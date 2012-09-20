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
	public class ProductionUpdates : SqlClientEntity
	{
		public ProductionUpdates()
		{
			this.QuerySource = "ProductionUpdates";
			this.MappingName = "ProductionUpdates";
        }

        public ProductionUpdates(string sConnectionString) : this()
        {
            this.ConnectionString = sConnectionString;
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
			
			public static SqlParameter UpdateID
			{
				get
				{
					return new SqlParameter("@UpdateID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter Name
			{
				get
				{
					return new SqlParameter("@Name", SqlDbType.VarChar, 8000);
				}
			}
			
			public static SqlParameter Description
			{
				get
				{
					return new SqlParameter("@Description", SqlDbType.Text, 2147483647);
				}
			}
			
			public static SqlParameter UpdateGroupID
			{
				get
				{
					return new SqlParameter("@UpdateGroupID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter ProjectID
			{
				get
				{
					return new SqlParameter("@ProjectID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter UpdateStatusID
			{
				get
				{
					return new SqlParameter("@UpdateStatusID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter EnteredUserID
			{
				get
				{
					return new SqlParameter("@EnteredUserID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter EnteredDate
			{
				get
				{
					return new SqlParameter("@EnteredDate", SqlDbType.DateTime, 0);
				}
			}
			
			public static SqlParameter BuildNumber
			{
				get
				{
					return new SqlParameter("@BuildNumber", SqlDbType.VarChar, 50);
				}
			}
			
			public static SqlParameter BuildDate
			{
				get
				{
					return new SqlParameter("@BuildDate", SqlDbType.DateTime, 0);
				}
			}
			
		}
		#endregion	
	
		#region ColumnNames
		public class ColumnNames
		{  
            public const string UpdateID = "UpdateID";
            public const string Name = "Name";
            public const string Description = "Description";
            public const string UpdateGroupID = "UpdateGroupID";
            public const string ProjectID = "ProjectID";
            public const string UpdateStatusID = "UpdateStatusID";
            public const string EnteredUserID = "EnteredUserID";
            public const string EnteredDate = "EnteredDate";
            public const string BuildNumber = "BuildNumber";
            public const string BuildDate = "BuildDate";

			static public string ToPropertyName(string columnName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[UpdateID] = ProductionUpdates.PropertyNames.UpdateID;
					ht[Name] = ProductionUpdates.PropertyNames.Name;
					ht[Description] = ProductionUpdates.PropertyNames.Description;
					ht[UpdateGroupID] = ProductionUpdates.PropertyNames.UpdateGroupID;
					ht[ProjectID] = ProductionUpdates.PropertyNames.ProjectID;
					ht[UpdateStatusID] = ProductionUpdates.PropertyNames.UpdateStatusID;
					ht[EnteredUserID] = ProductionUpdates.PropertyNames.EnteredUserID;
					ht[EnteredDate] = ProductionUpdates.PropertyNames.EnteredDate;
					ht[BuildNumber] = ProductionUpdates.PropertyNames.BuildNumber;
					ht[BuildDate] = ProductionUpdates.PropertyNames.BuildDate;

				}
				return (string)ht[columnName];
			}

			static private Hashtable ht = null;			 
		}
		#endregion
		
		#region PropertyNames
		public class PropertyNames
		{  
            public const string UpdateID = "UpdateID";
            public const string Name = "Name";
            public const string Description = "Description";
            public const string UpdateGroupID = "UpdateGroupID";
            public const string ProjectID = "ProjectID";
            public const string UpdateStatusID = "UpdateStatusID";
            public const string EnteredUserID = "EnteredUserID";
            public const string EnteredDate = "EnteredDate";
            public const string BuildNumber = "BuildNumber";
            public const string BuildDate = "BuildDate";

			static public string ToColumnName(string propertyName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[UpdateID] = ProductionUpdates.ColumnNames.UpdateID;
					ht[Name] = ProductionUpdates.ColumnNames.Name;
					ht[Description] = ProductionUpdates.ColumnNames.Description;
					ht[UpdateGroupID] = ProductionUpdates.ColumnNames.UpdateGroupID;
					ht[ProjectID] = ProductionUpdates.ColumnNames.ProjectID;
					ht[UpdateStatusID] = ProductionUpdates.ColumnNames.UpdateStatusID;
					ht[EnteredUserID] = ProductionUpdates.ColumnNames.EnteredUserID;
					ht[EnteredDate] = ProductionUpdates.ColumnNames.EnteredDate;
					ht[BuildNumber] = ProductionUpdates.ColumnNames.BuildNumber;
					ht[BuildDate] = ProductionUpdates.ColumnNames.BuildDate;

				}
				return (string)ht[propertyName];
			}

			static private Hashtable ht = null;			 
		}			 
		#endregion

		#region StringPropertyNames
		public class StringPropertyNames
		{  
            public const string UpdateID = "s_UpdateID";
            public const string Name = "s_Name";
            public const string Description = "s_Description";
            public const string UpdateGroupID = "s_UpdateGroupID";
            public const string ProjectID = "s_ProjectID";
            public const string UpdateStatusID = "s_UpdateStatusID";
            public const string EnteredUserID = "s_EnteredUserID";
            public const string EnteredDate = "s_EnteredDate";
            public const string BuildNumber = "s_BuildNumber";
            public const string BuildDate = "s_BuildDate";

		}
		#endregion	
		
		#region Properties
			public virtual int UpdateID
	    {
			get
	        {
				return base.Getint(ColumnNames.UpdateID);
			}
			set
	        {
				base.Setint(ColumnNames.UpdateID, value);
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

		public virtual string Description
	    {
			get
	        {
				return base.Getstring(ColumnNames.Description);
			}
			set
	        {
				base.Setstring(ColumnNames.Description, value);
			}
		}

		public virtual int UpdateGroupID
	    {
			get
	        {
				return base.Getint(ColumnNames.UpdateGroupID);
			}
			set
	        {
				base.Setint(ColumnNames.UpdateGroupID, value);
			}
		}

		public virtual int ProjectID
	    {
			get
	        {
				return base.Getint(ColumnNames.ProjectID);
			}
			set
	        {
				base.Setint(ColumnNames.ProjectID, value);
			}
		}

		public virtual int UpdateStatusID
	    {
			get
	        {
				return base.Getint(ColumnNames.UpdateStatusID);
			}
			set
	        {
				base.Setint(ColumnNames.UpdateStatusID, value);
			}
		}

		public virtual int EnteredUserID
	    {
			get
	        {
				return base.Getint(ColumnNames.EnteredUserID);
			}
			set
	        {
				base.Setint(ColumnNames.EnteredUserID, value);
			}
		}

		public virtual DateTime EnteredDate
	    {
			get
	        {
				return base.GetDateTime(ColumnNames.EnteredDate);
			}
			set
	        {
				base.SetDateTime(ColumnNames.EnteredDate, value);
			}
		}

		public virtual string BuildNumber
	    {
			get
	        {
				return base.Getstring(ColumnNames.BuildNumber);
			}
			set
	        {
				base.Setstring(ColumnNames.BuildNumber, value);
			}
		}

		public virtual DateTime BuildDate
	    {
			get
	        {
				return base.GetDateTime(ColumnNames.BuildDate);
			}
			set
	        {
				base.SetDateTime(ColumnNames.BuildDate, value);
			}
		}


		#endregion
		
		#region String Properties
	
		public virtual string s_UpdateID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.UpdateID) ? string.Empty : base.GetintAsString(ColumnNames.UpdateID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.UpdateID);
				else
					this.UpdateID = base.SetintAsString(ColumnNames.UpdateID, value);
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

		public virtual string s_Description
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.Description) ? string.Empty : base.GetstringAsString(ColumnNames.Description);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.Description);
				else
					this.Description = base.SetstringAsString(ColumnNames.Description, value);
			}
		}

		public virtual string s_UpdateGroupID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.UpdateGroupID) ? string.Empty : base.GetintAsString(ColumnNames.UpdateGroupID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.UpdateGroupID);
				else
					this.UpdateGroupID = base.SetintAsString(ColumnNames.UpdateGroupID, value);
			}
		}

		public virtual string s_ProjectID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.ProjectID) ? string.Empty : base.GetintAsString(ColumnNames.ProjectID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.ProjectID);
				else
					this.ProjectID = base.SetintAsString(ColumnNames.ProjectID, value);
			}
		}

		public virtual string s_UpdateStatusID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.UpdateStatusID) ? string.Empty : base.GetintAsString(ColumnNames.UpdateStatusID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.UpdateStatusID);
				else
					this.UpdateStatusID = base.SetintAsString(ColumnNames.UpdateStatusID, value);
			}
		}

		public virtual string s_EnteredUserID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.EnteredUserID) ? string.Empty : base.GetintAsString(ColumnNames.EnteredUserID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.EnteredUserID);
				else
					this.EnteredUserID = base.SetintAsString(ColumnNames.EnteredUserID, value);
			}
		}

		public virtual string s_EnteredDate
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.EnteredDate) ? string.Empty : base.GetDateTimeAsString(ColumnNames.EnteredDate);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.EnteredDate);
				else
					this.EnteredDate = base.SetDateTimeAsString(ColumnNames.EnteredDate, value);
			}
		}

		public virtual string s_BuildNumber
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.BuildNumber) ? string.Empty : base.GetstringAsString(ColumnNames.BuildNumber);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.BuildNumber);
				else
					this.BuildNumber = base.SetstringAsString(ColumnNames.BuildNumber, value);
			}
		}

		public virtual string s_BuildDate
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.BuildDate) ? string.Empty : base.GetDateTimeAsString(ColumnNames.BuildDate);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.BuildDate);
				else
					this.BuildDate = base.SetDateTimeAsString(ColumnNames.BuildDate, value);
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
				
				
				public WhereParameter UpdateID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.UpdateID, Parameters.UpdateID);
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

				public WhereParameter Description
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.Description, Parameters.Description);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter UpdateGroupID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.UpdateGroupID, Parameters.UpdateGroupID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter ProjectID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.ProjectID, Parameters.ProjectID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter UpdateStatusID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.UpdateStatusID, Parameters.UpdateStatusID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter EnteredUserID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.EnteredUserID, Parameters.EnteredUserID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter EnteredDate
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.EnteredDate, Parameters.EnteredDate);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter BuildNumber
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.BuildNumber, Parameters.BuildNumber);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter BuildDate
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.BuildDate, Parameters.BuildDate);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}


				private WhereClause _clause;
			}
			#endregion
		
			public WhereParameter UpdateID
		    {
				get
		        {
					if(_UpdateID_W == null)
	        	    {
						_UpdateID_W = TearOff.UpdateID;
					}
					return _UpdateID_W;
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

			public WhereParameter Description
		    {
				get
		        {
					if(_Description_W == null)
	        	    {
						_Description_W = TearOff.Description;
					}
					return _Description_W;
				}
			}

			public WhereParameter UpdateGroupID
		    {
				get
		        {
					if(_UpdateGroupID_W == null)
	        	    {
						_UpdateGroupID_W = TearOff.UpdateGroupID;
					}
					return _UpdateGroupID_W;
				}
			}

			public WhereParameter ProjectID
		    {
				get
		        {
					if(_ProjectID_W == null)
	        	    {
						_ProjectID_W = TearOff.ProjectID;
					}
					return _ProjectID_W;
				}
			}

			public WhereParameter UpdateStatusID
		    {
				get
		        {
					if(_UpdateStatusID_W == null)
	        	    {
						_UpdateStatusID_W = TearOff.UpdateStatusID;
					}
					return _UpdateStatusID_W;
				}
			}

			public WhereParameter EnteredUserID
		    {
				get
		        {
					if(_EnteredUserID_W == null)
	        	    {
						_EnteredUserID_W = TearOff.EnteredUserID;
					}
					return _EnteredUserID_W;
				}
			}

			public WhereParameter EnteredDate
		    {
				get
		        {
					if(_EnteredDate_W == null)
	        	    {
						_EnteredDate_W = TearOff.EnteredDate;
					}
					return _EnteredDate_W;
				}
			}

			public WhereParameter BuildNumber
		    {
				get
		        {
					if(_BuildNumber_W == null)
	        	    {
						_BuildNumber_W = TearOff.BuildNumber;
					}
					return _BuildNumber_W;
				}
			}

			public WhereParameter BuildDate
		    {
				get
		        {
					if(_BuildDate_W == null)
	        	    {
						_BuildDate_W = TearOff.BuildDate;
					}
					return _BuildDate_W;
				}
			}

			private WhereParameter _UpdateID_W = null;
			private WhereParameter _Name_W = null;
			private WhereParameter _Description_W = null;
			private WhereParameter _UpdateGroupID_W = null;
			private WhereParameter _ProjectID_W = null;
			private WhereParameter _UpdateStatusID_W = null;
			private WhereParameter _EnteredUserID_W = null;
			private WhereParameter _EnteredDate_W = null;
			private WhereParameter _BuildNumber_W = null;
			private WhereParameter _BuildDate_W = null;

			public void WhereClauseReset()
			{
				_UpdateID_W = null;
				_Name_W = null;
				_Description_W = null;
				_UpdateGroupID_W = null;
				_ProjectID_W = null;
				_UpdateStatusID_W = null;
				_EnteredUserID_W = null;
				_EnteredDate_W = null;
				_BuildNumber_W = null;
				_BuildDate_W = null;

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
				
				
				public AggregateParameter UpdateID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.UpdateID, Parameters.UpdateID);
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

				public AggregateParameter Description
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.Description, Parameters.Description);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter UpdateGroupID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.UpdateGroupID, Parameters.UpdateGroupID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter ProjectID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.ProjectID, Parameters.ProjectID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter UpdateStatusID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.UpdateStatusID, Parameters.UpdateStatusID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter EnteredUserID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.EnteredUserID, Parameters.EnteredUserID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter EnteredDate
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.EnteredDate, Parameters.EnteredDate);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter BuildNumber
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.BuildNumber, Parameters.BuildNumber);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter BuildDate
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.BuildDate, Parameters.BuildDate);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}


				private AggregateClause _clause;
			}
			#endregion
		
			public AggregateParameter UpdateID
		    {
				get
		        {
					if(_UpdateID_W == null)
	        	    {
						_UpdateID_W = TearOff.UpdateID;
					}
					return _UpdateID_W;
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

			public AggregateParameter Description
		    {
				get
		        {
					if(_Description_W == null)
	        	    {
						_Description_W = TearOff.Description;
					}
					return _Description_W;
				}
			}

			public AggregateParameter UpdateGroupID
		    {
				get
		        {
					if(_UpdateGroupID_W == null)
	        	    {
						_UpdateGroupID_W = TearOff.UpdateGroupID;
					}
					return _UpdateGroupID_W;
				}
			}

			public AggregateParameter ProjectID
		    {
				get
		        {
					if(_ProjectID_W == null)
	        	    {
						_ProjectID_W = TearOff.ProjectID;
					}
					return _ProjectID_W;
				}
			}

			public AggregateParameter UpdateStatusID
		    {
				get
		        {
					if(_UpdateStatusID_W == null)
	        	    {
						_UpdateStatusID_W = TearOff.UpdateStatusID;
					}
					return _UpdateStatusID_W;
				}
			}

			public AggregateParameter EnteredUserID
		    {
				get
		        {
					if(_EnteredUserID_W == null)
	        	    {
						_EnteredUserID_W = TearOff.EnteredUserID;
					}
					return _EnteredUserID_W;
				}
			}

			public AggregateParameter EnteredDate
		    {
				get
		        {
					if(_EnteredDate_W == null)
	        	    {
						_EnteredDate_W = TearOff.EnteredDate;
					}
					return _EnteredDate_W;
				}
			}

			public AggregateParameter BuildNumber
		    {
				get
		        {
					if(_BuildNumber_W == null)
	        	    {
						_BuildNumber_W = TearOff.BuildNumber;
					}
					return _BuildNumber_W;
				}
			}

			public AggregateParameter BuildDate
		    {
				get
		        {
					if(_BuildDate_W == null)
	        	    {
						_BuildDate_W = TearOff.BuildDate;
					}
					return _BuildDate_W;
				}
			}

			private AggregateParameter _UpdateID_W = null;
			private AggregateParameter _Name_W = null;
			private AggregateParameter _Description_W = null;
			private AggregateParameter _UpdateGroupID_W = null;
			private AggregateParameter _ProjectID_W = null;
			private AggregateParameter _UpdateStatusID_W = null;
			private AggregateParameter _EnteredUserID_W = null;
			private AggregateParameter _EnteredDate_W = null;
			private AggregateParameter _BuildNumber_W = null;
			private AggregateParameter _BuildDate_W = null;

			public void AggregateClauseReset()
			{
				_UpdateID_W = null;
				_Name_W = null;
				_Description_W = null;
				_UpdateGroupID_W = null;
				_ProjectID_W = null;
				_UpdateStatusID_W = null;
				_EnteredUserID_W = null;
				_EnteredDate_W = null;
				_BuildNumber_W = null;
				_BuildDate_W = null;

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

        public void LoadProjectUpdates(int ProjectID)
        {
            throw new Exception("The method or operation is not implemented.");
        }
    }
}