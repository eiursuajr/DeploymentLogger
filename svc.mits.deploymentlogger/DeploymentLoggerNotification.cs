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
using System.Threading;
using MyGeneration.dOOdads;

namespace DL_SVC
{
    public partial class DeploymentLoggerNotification : ServiceBase
    {
        public static EventLog Log;
        public static System.Timers.Timer aTimer;

        public DeploymentLoggerNotification()
        {
            InitializeComponent();
            CanPauseAndContinue = true;
            Log = new EventLog("Application");
            Log.Source = ServiceName;
            aTimer = new System.Timers.Timer();
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
                int ServerID = Convert.ToInt32(ConfigurationManager.AppSettings["ServerID"]);
                string connectionString = ConfigurationManager.AppSettings["connectionString"];

                DL_SVC.DAL.Master.Server oServer = new DL_SVC.DAL.Master.Server();

                oServer.LoadByPrimaryKey(ServerID);

                string sWebSiteAddress = oServer.WebReference;

                if (0 == oServer.RowCount)
                    throw new Exception("Server not found in master database!");

                DL_SVC.DAL.Master.Database oDatabase = new DL_SVC.DAL.Master.Database();
                oDatabase.Where.ServerID.Value = ServerID;
                oDatabase.Where.ServerID.Operator = WhereParameter.Operand.Equal;
                oDatabase.Query.Load();

                SmtpClient client = new SmtpClient(oServer.MailHost);
                client.Credentials = new NetworkCredential(oServer.MailUser, oServer.MailPass);

                if (oDatabase.RowCount > 0)
                {
                    do
                    {
                        Log.WriteEntry("Processing Database: " + oDatabase.Name + ".", EventLogEntryType.Information);

                        DL_SVC.DAL.Client.Notification oNotification = new DL_SVC.DAL.Client.Notification();
                        DL_SVC.DAL.Client.NotificationLog oNotificationLog = new DL_SVC.DAL.Client.NotificationLog();

                        oNotification.ConnectionString = oDatabase.DBConnectionString;
                        oNotificationLog.ConnectionString = oDatabase.DBConnectionString;

                        oNotification.LoadInCompleteNotifications();
                        if (oNotification.RowCount > 0)
                            do
                            {
                                DL_SVC.DAL.Client.Notification oNotifEmails = new DL_SVC.DAL.Client.Notification();
                                oNotifEmails.ConnectionString = oDatabase.DBConnectionString;

                                oNotifEmails.LoadAddressBookByProjectNotification(oNotification.NotificationID);
                                if (oNotifEmails.RowCount > 0)
                                {
                                    foreach (DataRowView drv in oNotifEmails.DefaultView)
                                    {
                                        if (0 != Convert.ToInt32(drv.Row["ImpactLevel"]) && 
                                            Convert.ToInt32(drv.Row["ImpactLevel"]) > Convert.ToInt32(oNotification.GetColumn("ImpactLevel")))
                                            continue;

                                        MailAddress from = new MailAddress(oServer.MailEmail, "Deployment Logger Notification Service");
                                        MailAddress to = new MailAddress(drv.Row["PrimaryEMail"].ToString(), drv.Row["FirstName"].ToString() + " " + drv.Row["LastName"].ToString());
                                        MailMessage message = new MailMessage(from, to);

                                        message.Subject = "Deployment Logger Notification: " + oNotification.Header.ToString();
                                        message.Body = String.Format("Hello, {0}.\n\n{1}\n\n" + 
                                            "For more information follow the link below:\n " +
                                            "{4}Reports/DeploymentLog.aspx?projectid={2}&organizationid={3}&ImpactLevel={5}\n\n" +
                                            "Thank you.", 
                                            drv.Row["FirstName"].ToString() + " " + drv.Row["LastName"].ToString(), 
                                            oNotification.Description.Replace("\\n", Environment.NewLine), 
                                            oNotification.ProjectID.ToString(), 
                                            drv.Row["OrganizationID"], 
                                            sWebSiteAddress,
                                            drv.Row["ImpactLevelID"]);
                                        client.Send(message);
                                        MessagesSent ++;
                                        message.Dispose();

                                        oNotificationLog.AddNew();
                                        oNotificationLog.NotificationID = oNotification.NotificationID;
                                        oNotificationLog.Email = drv.Row["PrimaryEMail"].ToString();
                                        oNotificationLog.Save();
                                    }
                                }
                                oNotification.Complete = true;
                                oNotification.Save();
                            } while (oNotification.MoveNext());

                        Log.WriteEntry("Processing Complete for the Database: " + oDatabase.Name + ".", EventLogEntryType.Information);
                    } while (oDatabase.MoveNext());
                }
                else
                {
                    throw new Exception("No client databases were found on the specified server.\nServer Mail Host: " + oServer.MailHost);
                }
                if (0 != MessagesSent)
                {
                    Log.WriteEntry("Messages sent: " + MessagesSent.ToString(), EventLogEntryType.Information);
                }
            }
            catch (Exception E)
            {
                Log.WriteEntry("Exception: " + E.Message + "\n\n" + E.StackTrace, EventLogEntryType.Error);
            }
            finally
            {
                aTimer.Enabled = true;
            }
        }

        protected override void OnStop()
        {
            Log.WriteEntry("Service stoped", EventLogEntryType.SuccessAudit);
        }


    }
}
