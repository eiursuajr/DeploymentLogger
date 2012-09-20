﻿
/*
'===============================================================================
'  Generated From - CSharp_dOOdads_BusinessEntity.vbgen
' 
'  ** IMPORTANT  ** 
'  How to Generate your stored procedures:
' 
'  SQL        = SQL_StoredProcs.vbgen
'  ACCESS     = Access_StoredProcs.vbgen
'  ORACLE     = Oracle_StoredProcs.vbgen
'  FIREBIRD   = FirebirdStoredProcs.vbgen
'  POSTGRESQL = PostgreSQL_StoredProcs.vbgen
'
'  The supporting base class SqlClientEntity is in the Architecture directory in "dOOdads".
'  
'  This object is 'abstract' which means you need to inherit from it to be able
'  to instantiate it.  This is very easilly done. You can override properties and
'  methods in your derived class, this allows you to regenerate this class at any
'  time and not worry about overwriting custom code. 
'
'  NEVER EDIT THIS FILE.
'
'  public class YourObject :  _YourObject
'  {
'
'  }
'
'===============================================================================
*/

// Generated by MyGeneration Version # (1.1.5.0)

using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Collections.Specialized;

using MyGeneration.dOOdads;

namespace DL_WEB.DAL.Client
{
	public abstract class _LogEntryStatus : SqlClientEntity
	{
		public _LogEntryStatus()
		{
			this.QuerySource = "LogEntryStatus";
			this.MappingName = "LogEntryStatus";

		}	

		//=================================================================
		//  public Overrides void AddNew()
		//=================================================================
		//
		//=================================================================
		public override void AddNew()
		{
			base.AddNew();
			
		}
		
		
		public override void FlushData()
		{
			this._whereClause = null;
			this._aggregateClause = null;
			base.FlushData();
		}
		
		//=================================================================
		//  	public Function LoadAll() As Boolean
		//=================================================================
		//  Loads all of the records in the database, and sets the currentRow to the first row
		//=================================================================
		public bool LoadAll() 
		{
			ListDictionary parameters = null;
			
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "LoadAllLogEntryStatus]", parameters);
		}
	
		//=================================================================
		// public Overridable Function LoadByPrimaryKey()  As Boolean
		//=================================================================
		//  Loads a single row of via the primary key
		//=================================================================
		public virtual bool LoadByPrimaryKey(int LogEntryStatusID)
		{
			ListDictionary parameters = new ListDictionary();
			parameters.Add(Parameters.LogEntryStatusID, LogEntryStatusID);

		
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "LoadLogEntryStatusByPrimaryKey]", parameters);
		}
		
		#region Parameters
		protected class Parameters
		{
			
			public static SqlParameter LogEntryStatusID
			{
				get
				{
					return new SqlParameter("@LogEntryStatusID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter Name
			{
				get
				{
					return new SqlParameter("@Name", SqlDbType.VarChar, 1024);
				}
			}
			
			public static SqlParameter Description
			{
				get
				{
					return new SqlParameter("@Description", SqlDbType.VarChar, 8000);
				}
			}
			
			public static SqlParameter StatusOrder
			{
				get
				{
					return new SqlParameter("@StatusOrder", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter ButtonText
			{
				get
				{
					return new SqlParameter("@ButtonText", SqlDbType.VarChar, 255);
				}
			}
			
		}
		#endregion		
	
		#region ColumnNames
		public class ColumnNames
		{  
            public const string LogEntryStatusID = "LogEntryStatusID";
            public const string Name = "Name";
            public const string Description = "Description";
            public const string StatusOrder = "StatusOrder";
            public const string ButtonText = "ButtonText";

			static public string ToPropertyName(string columnName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[LogEntryStatusID] = _LogEntryStatus.PropertyNames.LogEntryStatusID;
					ht[Name] = _LogEntryStatus.PropertyNames.Name;
					ht[Description] = _LogEntryStatus.PropertyNames.Description;
					ht[StatusOrder] = _LogEntryStatus.PropertyNames.StatusOrder;
					ht[ButtonText] = _LogEntryStatus.PropertyNames.ButtonText;

				}
				return (string)ht[columnName];
			}

			static private Hashtable ht = null;			 
		}
		#endregion
		
		#region PropertyNames
		public class PropertyNames
		{  
            public const string LogEntryStatusID = "LogEntryStatusID";
            public const string Name = "Name";
            public const string Description = "Description";
            public const string StatusOrder = "StatusOrder";
            public const string ButtonText = "ButtonText";

			static public string ToColumnName(string propertyName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[LogEntryStatusID] = _LogEntryStatus.ColumnNames.LogEntryStatusID;
					ht[Name] = _LogEntryStatus.ColumnNames.Name;
					ht[Description] = _LogEntryStatus.ColumnNames.Description;
					ht[StatusOrder] = _LogEntryStatus.ColumnNames.StatusOrder;
					ht[ButtonText] = _LogEntryStatus.ColumnNames.ButtonText;

				}
				return (string)ht[propertyName];
			}

			static private Hashtable ht = null;			 
		}			 
		#endregion	

		#region StringPropertyNames
		public class StringPropertyNames
		{  
            public const string LogEntryStatusID = "s_LogEntryStatusID";
            public const string Name = "s_Name";
            public const string Description = "s_Description";
            public const string StatusOrder = "s_StatusOrder";
            public const string ButtonText = "s_ButtonText";

		}
		#endregion		
		
		#region Properties
	
		public virtual int LogEntryStatusID
	    {
			get
	        {
				return base.Getint(ColumnNames.LogEntryStatusID);
			}
			set
	        {
				base.Setint(ColumnNames.LogEntryStatusID, value);
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

		public virtual int StatusOrder
	    {
			get
	        {
				return base.Getint(ColumnNames.StatusOrder);
			}
			set
	        {
				base.Setint(ColumnNames.StatusOrder, value);
			}
		}

		public virtual string ButtonText
	    {
			get
	        {
				return base.Getstring(ColumnNames.ButtonText);
			}
			set
	        {
				base.Setstring(ColumnNames.ButtonText, value);
			}
		}


		#endregion
		
		#region String Properties
	
		public virtual string s_LogEntryStatusID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.LogEntryStatusID) ? string.Empty : base.GetintAsString(ColumnNames.LogEntryStatusID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.LogEntryStatusID);
				else
					this.LogEntryStatusID = base.SetintAsString(ColumnNames.LogEntryStatusID, value);
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

		public virtual string s_StatusOrder
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.StatusOrder) ? string.Empty : base.GetintAsString(ColumnNames.StatusOrder);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.StatusOrder);
				else
					this.StatusOrder = base.SetintAsString(ColumnNames.StatusOrder, value);
			}
		}

		public virtual string s_ButtonText
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.ButtonText) ? string.Empty : base.GetstringAsString(ColumnNames.ButtonText);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.ButtonText);
				else
					this.ButtonText = base.SetstringAsString(ColumnNames.ButtonText, value);
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
				
				
				public WhereParameter LogEntryStatusID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.LogEntryStatusID, Parameters.LogEntryStatusID);
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

				public WhereParameter StatusOrder
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.StatusOrder, Parameters.StatusOrder);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter ButtonText
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.ButtonText, Parameters.ButtonText);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}


				private WhereClause _clause;
			}
			#endregion
		
			public WhereParameter LogEntryStatusID
		    {
				get
		        {
					if(_LogEntryStatusID_W == null)
	        	    {
						_LogEntryStatusID_W = TearOff.LogEntryStatusID;
					}
					return _LogEntryStatusID_W;
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

			public WhereParameter StatusOrder
		    {
				get
		        {
					if(_StatusOrder_W == null)
	        	    {
						_StatusOrder_W = TearOff.StatusOrder;
					}
					return _StatusOrder_W;
				}
			}

			public WhereParameter ButtonText
		    {
				get
		        {
					if(_ButtonText_W == null)
	        	    {
						_ButtonText_W = TearOff.ButtonText;
					}
					return _ButtonText_W;
				}
			}

			private WhereParameter _LogEntryStatusID_W = null;
			private WhereParameter _Name_W = null;
			private WhereParameter _Description_W = null;
			private WhereParameter _StatusOrder_W = null;
			private WhereParameter _ButtonText_W = null;

			public void WhereClauseReset()
			{
				_LogEntryStatusID_W = null;
				_Name_W = null;
				_Description_W = null;
				_StatusOrder_W = null;
				_ButtonText_W = null;

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
				
				
				public AggregateParameter LogEntryStatusID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.LogEntryStatusID, Parameters.LogEntryStatusID);
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

				public AggregateParameter StatusOrder
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.StatusOrder, Parameters.StatusOrder);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter ButtonText
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.ButtonText, Parameters.ButtonText);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}


				private AggregateClause _clause;
			}
			#endregion
		
			public AggregateParameter LogEntryStatusID
		    {
				get
		        {
					if(_LogEntryStatusID_W == null)
	        	    {
						_LogEntryStatusID_W = TearOff.LogEntryStatusID;
					}
					return _LogEntryStatusID_W;
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

			public AggregateParameter StatusOrder
		    {
				get
		        {
					if(_StatusOrder_W == null)
	        	    {
						_StatusOrder_W = TearOff.StatusOrder;
					}
					return _StatusOrder_W;
				}
			}

			public AggregateParameter ButtonText
		    {
				get
		        {
					if(_ButtonText_W == null)
	        	    {
						_ButtonText_W = TearOff.ButtonText;
					}
					return _ButtonText_W;
				}
			}

			private AggregateParameter _LogEntryStatusID_W = null;
			private AggregateParameter _Name_W = null;
			private AggregateParameter _Description_W = null;
			private AggregateParameter _StatusOrder_W = null;
			private AggregateParameter _ButtonText_W = null;

			public void AggregateClauseReset()
			{
				_LogEntryStatusID_W = null;
				_Name_W = null;
				_Description_W = null;
				_StatusOrder_W = null;
				_ButtonText_W = null;

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
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "InsertLogEntryStatus]";
	
			CreateParameters(cmd);
			
			SqlParameter p;
			p = cmd.Parameters[Parameters.LogEntryStatusID.ParameterName];
			p.Direction = ParameterDirection.Output;
    
			return cmd;
		}
	
		protected override IDbCommand GetUpdateCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "UpdateLogEntryStatus]";
	
			CreateParameters(cmd);
			      
			return cmd;
		}
	
		protected override IDbCommand GetDeleteCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "DeleteLogEntryStatus]";
	
			SqlParameter p;
			p = cmd.Parameters.Add(Parameters.LogEntryStatusID);
			p.SourceColumn = ColumnNames.LogEntryStatusID;
			p.SourceVersion = DataRowVersion.Current;

  
			return cmd;
		}
		
		private IDbCommand CreateParameters(SqlCommand cmd)
		{
			SqlParameter p;
		
			p = cmd.Parameters.Add(Parameters.LogEntryStatusID);
			p.SourceColumn = ColumnNames.LogEntryStatusID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.Name);
			p.SourceColumn = ColumnNames.Name;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.Description);
			p.SourceColumn = ColumnNames.Description;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.StatusOrder);
			p.SourceColumn = ColumnNames.StatusOrder;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.ButtonText);
			p.SourceColumn = ColumnNames.ButtonText;
			p.SourceVersion = DataRowVersion.Current;


			return cmd;
		}
	}
}
