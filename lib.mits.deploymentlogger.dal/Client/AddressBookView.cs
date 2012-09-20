﻿/*
'===============================================================================
'  Generated From - CSharp_dOOdads_View.vbgen
'
'  The supporting base class SqlClientEntity is in the 
'  Architecture directory in "dOOdads".
'===============================================================================
*/

// Generated by MyGeneration Version # (1.1.5.0)

using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Collections.Specialized;

using MyGeneration.dOOdads;

namespace DL_DAL.Client
{
	public class AddressBookView : SqlClientEntity
	{
		public AddressBookView()
		{
			this.QuerySource = "AddressBookView";
			this.MappingName = "AddressBookView";
		}	
	
		//=================================================================
		//  	public Function LoadAll() As Boolean
		//=================================================================
		//  Loads all of the records in the database, and sets the currentRow to the first row
		//=================================================================
		public bool LoadAll() 
		{
			return base.Query.Load();
		}
		
		public override void FlushData()
		{
			this._whereClause = null;
			this._aggregateClause = null;
			base.FlushData();
		}
	
		#region Parameters
		protected class Parameters
		{
			
			public static SqlParameter EntryID
			{
				get
				{
					return new SqlParameter("@EntryID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter Name
			{
				get
				{
					return new SqlParameter("@Name", SqlDbType.VarChar, 562);
				}
			}
			
			public static SqlParameter JobTitle
			{
				get
				{
					return new SqlParameter("@JobTitle", SqlDbType.VarChar, 255);
				}
			}
			
			public static SqlParameter Company
			{
				get
				{
					return new SqlParameter("@Company", SqlDbType.VarChar, 255);
				}
			}
			
			public static SqlParameter BusinessAddress
			{
				get
				{
					return new SqlParameter("@BusinessAddress", SqlDbType.VarChar, 1024);
				}
			}
			
			public static SqlParameter HomeAddress
			{
				get
				{
					return new SqlParameter("@HomeAddress", SqlDbType.VarChar, 1024);
				}
			}
			
			public static SqlParameter HomePhone
			{
				get
				{
					return new SqlParameter("@HomePhone", SqlDbType.VarChar, 50);
				}
			}
			
			public static SqlParameter WorkPhone
			{
				get
				{
					return new SqlParameter("@WorkPhone", SqlDbType.VarChar, 50);
				}
			}
			
			public static SqlParameter PrimaryEmail
			{
				get
				{
					return new SqlParameter("@PrimaryEmail", SqlDbType.VarChar, 50);
				}
			}
			
			public static SqlParameter SecondaryEmail
			{
				get
				{
					return new SqlParameter("@SecondaryEmail", SqlDbType.VarChar, 50);
				}
			}
			
			public static SqlParameter UserID
			{
				get
				{
					return new SqlParameter("@UserID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter IsShared
			{
				get
				{
					return new SqlParameter("@IsShared", SqlDbType.Bit, 0);
				}
			}
			
			public static SqlParameter Login
			{
				get
				{
					return new SqlParameter("@Login", SqlDbType.VarChar, 50);
				}
			}
			
		}
		#endregion	
	
		#region ColumnNames
		public class ColumnNames
		{  
            public const string EntryID = "EntryID";
            public const string Name = "Name";
            public const string JobTitle = "JobTitle";
            public const string Company = "Company";
            public const string BusinessAddress = "BusinessAddress";
            public const string HomeAddress = "HomeAddress";
            public const string HomePhone = "HomePhone";
            public const string WorkPhone = "WorkPhone";
            public const string PrimaryEmail = "PrimaryEmail";
            public const string SecondaryEmail = "SecondaryEmail";
            public const string UserID = "UserID";
            public const string IsShared = "IsShared";
            public const string Login = "Login";

			static public string ToPropertyName(string columnName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[EntryID] = AddressBookView.PropertyNames.EntryID;
					ht[Name] = AddressBookView.PropertyNames.Name;
					ht[JobTitle] = AddressBookView.PropertyNames.JobTitle;
					ht[Company] = AddressBookView.PropertyNames.Company;
					ht[BusinessAddress] = AddressBookView.PropertyNames.BusinessAddress;
					ht[HomeAddress] = AddressBookView.PropertyNames.HomeAddress;
					ht[HomePhone] = AddressBookView.PropertyNames.HomePhone;
					ht[WorkPhone] = AddressBookView.PropertyNames.WorkPhone;
					ht[PrimaryEmail] = AddressBookView.PropertyNames.PrimaryEmail;
					ht[SecondaryEmail] = AddressBookView.PropertyNames.SecondaryEmail;
					ht[UserID] = AddressBookView.PropertyNames.UserID;
					ht[IsShared] = AddressBookView.PropertyNames.IsShared;
					ht[Login] = AddressBookView.PropertyNames.Login;

				}
				return (string)ht[columnName];
			}

			static private Hashtable ht = null;			 
		}
		#endregion
		
		#region PropertyNames
		public class PropertyNames
		{  
            public const string EntryID = "EntryID";
            public const string Name = "Name";
            public const string JobTitle = "JobTitle";
            public const string Company = "Company";
            public const string BusinessAddress = "BusinessAddress";
            public const string HomeAddress = "HomeAddress";
            public const string HomePhone = "HomePhone";
            public const string WorkPhone = "WorkPhone";
            public const string PrimaryEmail = "PrimaryEmail";
            public const string SecondaryEmail = "SecondaryEmail";
            public const string UserID = "UserID";
            public const string IsShared = "IsShared";
            public const string Login = "Login";

			static public string ToColumnName(string propertyName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[EntryID] = AddressBookView.ColumnNames.EntryID;
					ht[Name] = AddressBookView.ColumnNames.Name;
					ht[JobTitle] = AddressBookView.ColumnNames.JobTitle;
					ht[Company] = AddressBookView.ColumnNames.Company;
					ht[BusinessAddress] = AddressBookView.ColumnNames.BusinessAddress;
					ht[HomeAddress] = AddressBookView.ColumnNames.HomeAddress;
					ht[HomePhone] = AddressBookView.ColumnNames.HomePhone;
					ht[WorkPhone] = AddressBookView.ColumnNames.WorkPhone;
					ht[PrimaryEmail] = AddressBookView.ColumnNames.PrimaryEmail;
					ht[SecondaryEmail] = AddressBookView.ColumnNames.SecondaryEmail;
					ht[UserID] = AddressBookView.ColumnNames.UserID;
					ht[IsShared] = AddressBookView.ColumnNames.IsShared;
					ht[Login] = AddressBookView.ColumnNames.Login;

				}
				return (string)ht[propertyName];
			}

			static private Hashtable ht = null;			 
		}			 
		#endregion

		#region StringPropertyNames
		public class StringPropertyNames
		{  
            public const string EntryID = "s_EntryID";
            public const string Name = "s_Name";
            public const string JobTitle = "s_JobTitle";
            public const string Company = "s_Company";
            public const string BusinessAddress = "s_BusinessAddress";
            public const string HomeAddress = "s_HomeAddress";
            public const string HomePhone = "s_HomePhone";
            public const string WorkPhone = "s_WorkPhone";
            public const string PrimaryEmail = "s_PrimaryEmail";
            public const string SecondaryEmail = "s_SecondaryEmail";
            public const string UserID = "s_UserID";
            public const string IsShared = "s_IsShared";
            public const string Login = "s_Login";

		}
		#endregion	
		
		#region Properties
			public virtual int EntryID
	    {
			get
	        {
				return base.Getint(ColumnNames.EntryID);
			}
			set
	        {
				base.Setint(ColumnNames.EntryID, value);
			}
		}

		public virtual string Name
	    {
			get
	        {
				return base.Getstring(ColumnNames.Name);
			}
			set
	        {
				base.Setstring(ColumnNames.Name, value);
			}
		}

		public virtual string JobTitle
	    {
			get
	        {
				return base.Getstring(ColumnNames.JobTitle);
			}
			set
	        {
				base.Setstring(ColumnNames.JobTitle, value);
			}
		}

		public virtual string Company
	    {
			get
	        {
				return base.Getstring(ColumnNames.Company);
			}
			set
	        {
				base.Setstring(ColumnNames.Company, value);
			}
		}

		public virtual string BusinessAddress
	    {
			get
	        {
				return base.Getstring(ColumnNames.BusinessAddress);
			}
			set
	        {
				base.Setstring(ColumnNames.BusinessAddress, value);
			}
		}

		public virtual string HomeAddress
	    {
			get
	        {
				return base.Getstring(ColumnNames.HomeAddress);
			}
			set
	        {
				base.Setstring(ColumnNames.HomeAddress, value);
			}
		}

		public virtual string HomePhone
	    {
			get
	        {
				return base.Getstring(ColumnNames.HomePhone);
			}
			set
	        {
				base.Setstring(ColumnNames.HomePhone, value);
			}
		}

		public virtual string WorkPhone
	    {
			get
	        {
				return base.Getstring(ColumnNames.WorkPhone);
			}
			set
	        {
				base.Setstring(ColumnNames.WorkPhone, value);
			}
		}

		public virtual string PrimaryEmail
	    {
			get
	        {
				return base.Getstring(ColumnNames.PrimaryEmail);
			}
			set
	        {
				base.Setstring(ColumnNames.PrimaryEmail, value);
			}
		}

		public virtual string SecondaryEmail
	    {
			get
	        {
				return base.Getstring(ColumnNames.SecondaryEmail);
			}
			set
	        {
				base.Setstring(ColumnNames.SecondaryEmail, value);
			}
		}

		public virtual int UserID
	    {
			get
	        {
				return base.Getint(ColumnNames.UserID);
			}
			set
	        {
				base.Setint(ColumnNames.UserID, value);
			}
		}

		public virtual bool IsShared
	    {
			get
	        {
				return base.Getbool(ColumnNames.IsShared);
			}
			set
	        {
				base.Setbool(ColumnNames.IsShared, value);
			}
		}

		public virtual string Login
	    {
			get
	        {
				return base.Getstring(ColumnNames.Login);
			}
			set
	        {
				base.Setstring(ColumnNames.Login, value);
			}
		}


		#endregion
		
		#region String Properties
	
		public virtual string s_EntryID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.EntryID) ? string.Empty : base.GetintAsString(ColumnNames.EntryID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.EntryID);
				else
					this.EntryID = base.SetintAsString(ColumnNames.EntryID, value);
			}
		}

		public virtual string s_Name
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.Name) ? string.Empty : base.GetstringAsString(ColumnNames.Name);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.Name);
				else
					this.Name = base.SetstringAsString(ColumnNames.Name, value);
			}
		}

		public virtual string s_JobTitle
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.JobTitle) ? string.Empty : base.GetstringAsString(ColumnNames.JobTitle);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.JobTitle);
				else
					this.JobTitle = base.SetstringAsString(ColumnNames.JobTitle, value);
			}
		}

		public virtual string s_Company
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.Company) ? string.Empty : base.GetstringAsString(ColumnNames.Company);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.Company);
				else
					this.Company = base.SetstringAsString(ColumnNames.Company, value);
			}
		}

		public virtual string s_BusinessAddress
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.BusinessAddress) ? string.Empty : base.GetstringAsString(ColumnNames.BusinessAddress);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.BusinessAddress);
				else
					this.BusinessAddress = base.SetstringAsString(ColumnNames.BusinessAddress, value);
			}
		}

		public virtual string s_HomeAddress
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.HomeAddress) ? string.Empty : base.GetstringAsString(ColumnNames.HomeAddress);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.HomeAddress);
				else
					this.HomeAddress = base.SetstringAsString(ColumnNames.HomeAddress, value);
			}
		}

		public virtual string s_HomePhone
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.HomePhone) ? string.Empty : base.GetstringAsString(ColumnNames.HomePhone);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.HomePhone);
				else
					this.HomePhone = base.SetstringAsString(ColumnNames.HomePhone, value);
			}
		}

		public virtual string s_WorkPhone
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.WorkPhone) ? string.Empty : base.GetstringAsString(ColumnNames.WorkPhone);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.WorkPhone);
				else
					this.WorkPhone = base.SetstringAsString(ColumnNames.WorkPhone, value);
			}
		}

		public virtual string s_PrimaryEmail
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.PrimaryEmail) ? string.Empty : base.GetstringAsString(ColumnNames.PrimaryEmail);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.PrimaryEmail);
				else
					this.PrimaryEmail = base.SetstringAsString(ColumnNames.PrimaryEmail, value);
			}
		}

		public virtual string s_SecondaryEmail
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.SecondaryEmail) ? string.Empty : base.GetstringAsString(ColumnNames.SecondaryEmail);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.SecondaryEmail);
				else
					this.SecondaryEmail = base.SetstringAsString(ColumnNames.SecondaryEmail, value);
			}
		}

		public virtual string s_UserID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.UserID) ? string.Empty : base.GetintAsString(ColumnNames.UserID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.UserID);
				else
					this.UserID = base.SetintAsString(ColumnNames.UserID, value);
			}
		}

		public virtual string s_IsShared
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.IsShared) ? string.Empty : base.GetboolAsString(ColumnNames.IsShared);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.IsShared);
				else
					this.IsShared = base.SetboolAsString(ColumnNames.IsShared, value);
			}
		}

		public virtual string s_Login
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.Login) ? string.Empty : base.GetstringAsString(ColumnNames.Login);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.Login);
				else
					this.Login = base.SetstringAsString(ColumnNames.Login, value);
			}
		}


		#endregion			
	
		#region Where Clause
		public class WhereClause
		{
			public WhereClause(BusinessEntity entity)
			{
				this._entity = entity;
			}
			
			public TearOffWhereParameter TearOff
			{
				get
				{
					if(_tearOff == null)
					{
						_tearOff = new TearOffWhereParameter(this);
					}

					return _tearOff;
				}
			}

			#region WhereParameter TearOff's
			public class TearOffWhereParameter
			{
				public TearOffWhereParameter(WhereClause clause)
				{
					this._clause = clause;
				}
				
				
				public WhereParameter EntryID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.EntryID, Parameters.EntryID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter Name
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.Name, Parameters.Name);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter JobTitle
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.JobTitle, Parameters.JobTitle);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter Company
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.Company, Parameters.Company);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter BusinessAddress
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.BusinessAddress, Parameters.BusinessAddress);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter HomeAddress
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.HomeAddress, Parameters.HomeAddress);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter HomePhone
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.HomePhone, Parameters.HomePhone);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter WorkPhone
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.WorkPhone, Parameters.WorkPhone);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter PrimaryEmail
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.PrimaryEmail, Parameters.PrimaryEmail);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter SecondaryEmail
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.SecondaryEmail, Parameters.SecondaryEmail);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter UserID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.UserID, Parameters.UserID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter IsShared
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.IsShared, Parameters.IsShared);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter Login
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.Login, Parameters.Login);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}


				private WhereClause _clause;
			}
			#endregion
		
			public WhereParameter EntryID
		    {
				get
		        {
					if(_EntryID_W == null)
	        	    {
						_EntryID_W = TearOff.EntryID;
					}
					return _EntryID_W;
				}
			}

			public WhereParameter Name
		    {
				get
		        {
					if(_Name_W == null)
	        	    {
						_Name_W = TearOff.Name;
					}
					return _Name_W;
				}
			}

			public WhereParameter JobTitle
		    {
				get
		        {
					if(_JobTitle_W == null)
	        	    {
						_JobTitle_W = TearOff.JobTitle;
					}
					return _JobTitle_W;
				}
			}

			public WhereParameter Company
		    {
				get
		        {
					if(_Company_W == null)
	        	    {
						_Company_W = TearOff.Company;
					}
					return _Company_W;
				}
			}

			public WhereParameter BusinessAddress
		    {
				get
		        {
					if(_BusinessAddress_W == null)
	        	    {
						_BusinessAddress_W = TearOff.BusinessAddress;
					}
					return _BusinessAddress_W;
				}
			}

			public WhereParameter HomeAddress
		    {
				get
		        {
					if(_HomeAddress_W == null)
	        	    {
						_HomeAddress_W = TearOff.HomeAddress;
					}
					return _HomeAddress_W;
				}
			}

			public WhereParameter HomePhone
		    {
				get
		        {
					if(_HomePhone_W == null)
	        	    {
						_HomePhone_W = TearOff.HomePhone;
					}
					return _HomePhone_W;
				}
			}

			public WhereParameter WorkPhone
		    {
				get
		        {
					if(_WorkPhone_W == null)
	        	    {
						_WorkPhone_W = TearOff.WorkPhone;
					}
					return _WorkPhone_W;
				}
			}

			public WhereParameter PrimaryEmail
		    {
				get
		        {
					if(_PrimaryEmail_W == null)
	        	    {
						_PrimaryEmail_W = TearOff.PrimaryEmail;
					}
					return _PrimaryEmail_W;
				}
			}

			public WhereParameter SecondaryEmail
		    {
				get
		        {
					if(_SecondaryEmail_W == null)
	        	    {
						_SecondaryEmail_W = TearOff.SecondaryEmail;
					}
					return _SecondaryEmail_W;
				}
			}

			public WhereParameter UserID
		    {
				get
		        {
					if(_UserID_W == null)
	        	    {
						_UserID_W = TearOff.UserID;
					}
					return _UserID_W;
				}
			}

			public WhereParameter IsShared
		    {
				get
		        {
					if(_IsShared_W == null)
	        	    {
						_IsShared_W = TearOff.IsShared;
					}
					return _IsShared_W;
				}
			}

			public WhereParameter Login
		    {
				get
		        {
					if(_Login_W == null)
	        	    {
						_Login_W = TearOff.Login;
					}
					return _Login_W;
				}
			}

			private WhereParameter _EntryID_W = null;
			private WhereParameter _Name_W = null;
			private WhereParameter _JobTitle_W = null;
			private WhereParameter _Company_W = null;
			private WhereParameter _BusinessAddress_W = null;
			private WhereParameter _HomeAddress_W = null;
			private WhereParameter _HomePhone_W = null;
			private WhereParameter _WorkPhone_W = null;
			private WhereParameter _PrimaryEmail_W = null;
			private WhereParameter _SecondaryEmail_W = null;
			private WhereParameter _UserID_W = null;
			private WhereParameter _IsShared_W = null;
			private WhereParameter _Login_W = null;

			public void WhereClauseReset()
			{
				_EntryID_W = null;
				_Name_W = null;
				_JobTitle_W = null;
				_Company_W = null;
				_BusinessAddress_W = null;
				_HomeAddress_W = null;
				_HomePhone_W = null;
				_WorkPhone_W = null;
				_PrimaryEmail_W = null;
				_SecondaryEmail_W = null;
				_UserID_W = null;
				_IsShared_W = null;
				_Login_W = null;

				this._entity.Query.FlushWhereParameters();

			}
	
			private BusinessEntity _entity;
			private TearOffWhereParameter _tearOff;
			
		}
	
		public WhereClause Where
		{
			get
			{
				if(_whereClause == null)
				{
					_whereClause = new WhereClause(this);
				}
		
				return _whereClause;
			}
		}
		
		private WhereClause _whereClause = null;	
		#endregion
	
		#region Aggregate Clause
		public class AggregateClause
		{
			public AggregateClause(BusinessEntity entity)
			{
				this._entity = entity;
			}
			
			public TearOffAggregateParameter TearOff
			{
				get
				{
					if(_tearOff == null)
					{
						_tearOff = new TearOffAggregateParameter(this);
					}

					return _tearOff;
				}
			}

			#region AggregateParameter TearOff's
			public class TearOffAggregateParameter
			{
				public TearOffAggregateParameter(AggregateClause clause)
				{
					this._clause = clause;
				}
				
				
				public AggregateParameter EntryID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.EntryID, Parameters.EntryID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter Name
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.Name, Parameters.Name);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter JobTitle
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.JobTitle, Parameters.JobTitle);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter Company
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.Company, Parameters.Company);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter BusinessAddress
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.BusinessAddress, Parameters.BusinessAddress);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter HomeAddress
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.HomeAddress, Parameters.HomeAddress);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter HomePhone
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.HomePhone, Parameters.HomePhone);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter WorkPhone
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.WorkPhone, Parameters.WorkPhone);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter PrimaryEmail
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.PrimaryEmail, Parameters.PrimaryEmail);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter SecondaryEmail
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.SecondaryEmail, Parameters.SecondaryEmail);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter UserID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.UserID, Parameters.UserID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter IsShared
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.IsShared, Parameters.IsShared);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter Login
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.Login, Parameters.Login);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}


				private AggregateClause _clause;
			}
			#endregion
		
			public AggregateParameter EntryID
		    {
				get
		        {
					if(_EntryID_W == null)
	        	    {
						_EntryID_W = TearOff.EntryID;
					}
					return _EntryID_W;
				}
			}

			public AggregateParameter Name
		    {
				get
		        {
					if(_Name_W == null)
	        	    {
						_Name_W = TearOff.Name;
					}
					return _Name_W;
				}
			}

			public AggregateParameter JobTitle
		    {
				get
		        {
					if(_JobTitle_W == null)
	        	    {
						_JobTitle_W = TearOff.JobTitle;
					}
					return _JobTitle_W;
				}
			}

			public AggregateParameter Company
		    {
				get
		        {
					if(_Company_W == null)
	        	    {
						_Company_W = TearOff.Company;
					}
					return _Company_W;
				}
			}

			public AggregateParameter BusinessAddress
		    {
				get
		        {
					if(_BusinessAddress_W == null)
	        	    {
						_BusinessAddress_W = TearOff.BusinessAddress;
					}
					return _BusinessAddress_W;
				}
			}

			public AggregateParameter HomeAddress
		    {
				get
		        {
					if(_HomeAddress_W == null)
	        	    {
						_HomeAddress_W = TearOff.HomeAddress;
					}
					return _HomeAddress_W;
				}
			}

			public AggregateParameter HomePhone
		    {
				get
		        {
					if(_HomePhone_W == null)
	        	    {
						_HomePhone_W = TearOff.HomePhone;
					}
					return _HomePhone_W;
				}
			}

			public AggregateParameter WorkPhone
		    {
				get
		        {
					if(_WorkPhone_W == null)
	        	    {
						_WorkPhone_W = TearOff.WorkPhone;
					}
					return _WorkPhone_W;
				}
			}

			public AggregateParameter PrimaryEmail
		    {
				get
		        {
					if(_PrimaryEmail_W == null)
	        	    {
						_PrimaryEmail_W = TearOff.PrimaryEmail;
					}
					return _PrimaryEmail_W;
				}
			}

			public AggregateParameter SecondaryEmail
		    {
				get
		        {
					if(_SecondaryEmail_W == null)
	        	    {
						_SecondaryEmail_W = TearOff.SecondaryEmail;
					}
					return _SecondaryEmail_W;
				}
			}

			public AggregateParameter UserID
		    {
				get
		        {
					if(_UserID_W == null)
	        	    {
						_UserID_W = TearOff.UserID;
					}
					return _UserID_W;
				}
			}

			public AggregateParameter IsShared
		    {
				get
		        {
					if(_IsShared_W == null)
	        	    {
						_IsShared_W = TearOff.IsShared;
					}
					return _IsShared_W;
				}
			}

			public AggregateParameter Login
		    {
				get
		        {
					if(_Login_W == null)
	        	    {
						_Login_W = TearOff.Login;
					}
					return _Login_W;
				}
			}

			private AggregateParameter _EntryID_W = null;
			private AggregateParameter _Name_W = null;
			private AggregateParameter _JobTitle_W = null;
			private AggregateParameter _Company_W = null;
			private AggregateParameter _BusinessAddress_W = null;
			private AggregateParameter _HomeAddress_W = null;
			private AggregateParameter _HomePhone_W = null;
			private AggregateParameter _WorkPhone_W = null;
			private AggregateParameter _PrimaryEmail_W = null;
			private AggregateParameter _SecondaryEmail_W = null;
			private AggregateParameter _UserID_W = null;
			private AggregateParameter _IsShared_W = null;
			private AggregateParameter _Login_W = null;

			public void AggregateClauseReset()
			{
				_EntryID_W = null;
				_Name_W = null;
				_JobTitle_W = null;
				_Company_W = null;
				_BusinessAddress_W = null;
				_HomeAddress_W = null;
				_HomePhone_W = null;
				_WorkPhone_W = null;
				_PrimaryEmail_W = null;
				_SecondaryEmail_W = null;
				_UserID_W = null;
				_IsShared_W = null;
				_Login_W = null;

				this._entity.Query.FlushAggregateParameters();

			}
	
			private BusinessEntity _entity;
			private TearOffAggregateParameter _tearOff;
			
		}
	
		public AggregateClause Aggregate
		{
			get
			{
				if(_aggregateClause == null)
				{
					_aggregateClause = new AggregateClause(this);
				}
		
				return _aggregateClause;
			}
		}
		
		private AggregateClause _aggregateClause = null;	
		#endregion
	
		protected override IDbCommand GetInsertCommand() 
		{
			return null;
		}
	
		protected override IDbCommand GetUpdateCommand()
		{
			return null;
		}
	
		protected override IDbCommand GetDeleteCommand()
		{
			return null;
		}
	}
}
