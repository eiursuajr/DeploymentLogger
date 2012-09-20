﻿
// Generated by MyGeneration Version # (1.1.5.0)

using System;
using DL_DAL.Client;
using System.Data;
using System.Collections.Specialized;

namespace DL_WEB.DAL.Client
{
	public class ProjectNotification : _ProjectNotification
	{
		public ProjectNotification()
		{
		
		}

		public DataView LoadAllUniqueProjectNotificationByProjectID(int projectID)
		{
			ListDictionary parameters = new ListDictionary();
			parameters.Add(Parameters.ProjectID, projectID);
			base.LoadFromSql("[" + base.SchemaStoredProcedure + "LoadAllUniqueProjectNotificationByProjectID]", parameters);

			return base.DefaultView;
		}

		public DataView LoadAllRoleByNotificationTypeID(int projectID, int notificationTypeID)
		{
			ListDictionary parameters = new ListDictionary();
			parameters.Add(Parameters.NotificationTypeID, notificationTypeID);
            parameters.Add(Parameters.ProjectID, projectID);
			base.LoadFromSql("[" + base.SchemaStoredProcedure + "LoadAllRoleByNotificationTypeID]", parameters);

			return base.DefaultView;
		}

        public DataView LoadAllUserByNotificationTypeID(int projectID, int notificationTypeID)
		{
			ListDictionary parameters = new ListDictionary();
			parameters.Add(Parameters.NotificationTypeID, notificationTypeID);
            parameters.Add(Parameters.ProjectID, projectID);
			base.LoadFromSql("[" + base.SchemaStoredProcedure + "LoadAllUserByNotificationTypeID]", parameters);

			return base.DefaultView;
		}

        public DataView LoadAllAddressBookByNotificationTypeID(int projectID, int notificationTypeID)
		{
			ListDictionary parameters = new ListDictionary();
			parameters.Add(Parameters.NotificationTypeID, notificationTypeID);
            parameters.Add(Parameters.ProjectID, projectID);
			base.LoadFromSql("[" + base.SchemaStoredProcedure + "LoadAllAddressBookByNotificationTypeID]", parameters);

			return base.DefaultView;
		}

		public void Delete(int projectNotificationID)
		{
			ListDictionary parameters = new ListDictionary();
			parameters.Add(Parameters.ProjectNotificationID, projectNotificationID);
			base.LoadFromSqlNoExec("[" + base.SchemaStoredProcedure + "DeleteProjectNotification]", parameters);
		}
	}
}