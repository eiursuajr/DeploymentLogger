﻿
// Generated by MyGeneration Version # (1.1.5.0)

using System;
using DL_DAL.Client;
using System.Data;
using System.Collections.Specialized;

namespace DL_WEB.DAL.Client
{
	public class NotificationType : _NotificationType
	{
		public NotificationType()
		{
		
		}

		public DataView LoadAllNotificationType()
		{
			base.LoadAll();
			return base.DefaultView;
		}

		public DataView LoadNotificationTypeByPrimaryKey(int notificationTypeID)
		{
			if (notificationTypeID > 0)
				base.LoadByPrimaryKey(notificationTypeID);
			else
			{
				base.AddNew();
				base.NotificationTypeID = 0;
			}
			return base.DefaultView;
		}

		public int Update(int notificationTypeID, string name, string description, string notificationEmailDefaultHeader, string notificationEmailDefaultDescription)
		{
			this.LoadNotificationTypeByPrimaryKey(notificationTypeID);

			base.NotificationTypeID = notificationTypeID;
			base.Name = name;
			base.Description = description;
			base.NotificationEmailDefaultHeader = notificationEmailDefaultHeader;
			base.NotificationEmailDefaultDescription = notificationEmailDefaultDescription;
			base.Save();

			return base.NotificationTypeID;
		}

		public void Delete(int notificationTypeID)
		{
			ListDictionary parameters = new ListDictionary();
			parameters.Add(Parameters.NotificationTypeID, notificationTypeID);
			base.LoadFromSqlNoExec("[" + this.SchemaStoredProcedure + "DeleteNotificationType]", parameters);
		}
	}
}
