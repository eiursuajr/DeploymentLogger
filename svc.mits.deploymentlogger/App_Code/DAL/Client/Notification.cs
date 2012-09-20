using System;
using DL_DAL.Client;
using MyGeneration.dOOdads;
using System.Data;
using System.Collections.Specialized;

namespace DL_SVC.DAL.Client
{
    public class Notification : _Notification
    {
        public Notification()
        {

        }

        public DataView LoadInCompleteNotifications()
        {
            base.LoadFromSql("[" + this.SchemaStoredProcedure + "LoadAllIncompleteNotifications]", null);

            return this.DefaultView;
        }

        public DataView LoadAddressBookByProjectNotification(int iNotificationID)
        { 
			ListDictionary parameters = new ListDictionary();
            parameters.Add(Parameters.NotificationID, iNotificationID);
            base.LoadFromSql("[" + this.SchemaStoredProcedure + "LoadAddressBookByProjectNotification]", parameters);
            return base.DefaultView;
        }
    }
}
