using System;
using System.Configuration;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Data;
using System.Diagnostics;
using System.ServiceProcess;
using System.Text;
using System.Net;
using System.Net.Mail;
using System.Timers;
using MyGeneration.dOOdads;

namespace DL_SVC
{
    public partial class NotificationService : ServiceBase
    {
        public static EventLog Log;
        public static Timer aTimer;

        public NotificationService()
        {
            InitializeComponent();
            CanPauseAndContinue = true;
            Log = new EventLog("Application");
            Log.Source = ServiceName;
            aTimer = new Timer();
            aTimer.Elapsed += new ElapsedEventHandler(OnTimedEvent);
        }

        protected override void OnStart(string[] args)
        {
            try
            {
                Log.WriteEntry("Starting Notification Service", EventLogEntryType.Information);
                aTimer.Interval = Convert.ToDouble(ConfigurationManager.AppSettings["timerInterval"]);
                aTimer.Enabled = true;
                GC.KeepAlive(aTimer);
                Log.WriteEntry("Service started", EventLogEntryType.SuccessAudit);
            }
            catch (Exception ex)
            {
                Log.WriteEntry(ex.Message, EventLogEntryType.Error);
                Log.WriteEntry("Notification Service did not start", EventLogEntryType.FailureAudit);
            }

        }

        private void OnTimedEvent(object source, ElapsedEventArgs e)
        {
            int MessagesSent = 0;

            try
            {
                aTimer.Enabled = false;

                string connectionString = ConfigurationManager.AppSettings["connectionString"];
                string mailHost = ConfigurationManager.AppSettings["mailHost"];
                string mailUser = ConfigurationManager.AppSettings["mailUser"];
                string mailPass = ConfigurationManager.AppSettings["mailPass"];
                string mailEmail = ConfigurationManager.AppSettings["mailEmail"];


                SmtpClient client = new SmtpClient(mailHost);
                client.Credentials = new NetworkCredential(mailUser, mailPass);

                using (SqlConnection connEMail = new SqlConnection(connectionString))
                {
                    connEMail.Open();

                    SqlCommand cmdEMail = new SqlCommand("LoadAddressBookByProjectNotification", connEMail);
                    cmdEMail.CommandType = CommandType.StoredProcedure;
                    cmdEMail.Parameters.Add("ProjectID", SqlDbType.Int);
                    cmdEMail.Parameters.Add("NotificationTypeID", SqlDbType.Int);
                    cmdEMail.Parameters.Add("NotificationID", SqlDbType.Int);

                    DL_DAL.DAL.Client.Notification oNotification = new DL_DAL.DAL.Client.Notification();
                    DL_DAL.DAL.Client.NotificationLog oNotificationLog = new DL_DAL.DAL.Client.NotificationLog();

                    oNotification.ConnectionString = connectionString;
                    oNotificationLog.ConnectionString = connectionString;

                    oNotification.LoadNotificationNotComplete();
                    while (!oNotification.EOF)
                    {
                        cmdEMail.Parameters["ProjectID"].Value = oNotification.ProjectID;
                        cmdEMail.Parameters["NotificationTypeID"].Value = oNotification.NotificationTypeID;
                        cmdEMail.Parameters["NotificationID"].Value = oNotification.NotificationID;
                        SqlDataReader rdrEMail = cmdEMail.ExecuteReader();
                        while (rdrEMail.Read())
                        {
                            MailAddress from = new MailAddress(mailEmail, "Deployment Logger Notification Service");
                            MailAddress to = new MailAddress(rdrEMail["PrimaryEMail"].ToString(), rdrEMail["FirstName"].ToString() + " " + rdrEMail["LastName"].ToString());
                            MailMessage message = new MailMessage(from, to);
                            message.Subject = "Notification created on " + oNotification.DateCreated.ToString();
                            message.Body = oNotification.Description.ToString();
                            client.Send(message);
                            MessagesSent++;
                            message.Dispose();
                            oNotificationLog.AddNew();
                            oNotificationLog.NotificationID = oNotification.NotificationID;
                            oNotificationLog.Email = rdrEMail["PrimaryEMail"].ToString();
                            oNotificationLog.Save();
                        }

                        rdrEMail.Close();

                        oNotification.Complete = true;
                        oNotification.Save();

                        oNotification.MoveNext();
                    }
                }
                Log.WriteEntry("Messages sent: " + MessagesSent.ToString(), EventLogEntryType.Information);
            }
            catch (Exception E)
            {
                Log.WriteEntry("Exception: " + E.Message,EventLogEntryType.Error);
            }
            aTimer.Enabled = true;
        }

        protected override void OnStop()
        {
            Log.WriteEntry("Service stoped", EventLogEntryType.Information);
        }


    }
}
