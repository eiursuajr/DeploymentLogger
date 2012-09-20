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

namespace DL_DAL.Client
{
	public abstract class _LogEntryType : SqlClientEntity
	{
		public _LogEntryType()
		{
			this.QuerySource = "LogEntryType";
			this.MappingName = "LogEntryType";

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
			
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "LoadAllLogEntryType]", parameters);
		}
	
		//=================================================================
		// public Overridable Function LoadByPrimaryKey()  As Boolean
		//=================================================================
		//  Loads a single row of via the primary key
		//=================================================================
		public virtual bool LoadByPrimaryKey(int LogEntryTypeID)
		{
			ListDictionary parameters = new ListDictionary();
			parameters.Add(Parameters.LogEntryTypeID, LogEntryTypeID);

		
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "LoadLogEntryTypeByPrimaryKey]", parameters);
		}
		
		#region Parameters
		protected class Parameters
		{
			
			public static SqlParameter LogEntryTypeID
			{
				get
				{
					return new SqlParameter("@LogEntryTypeID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter Name
			{
				get
				{
					return new SqlParameter("@Name", SqlDbType.VarChar, 255);
				}
			}
			
			public static SqlParameter Description
			{
				get
				{
					return new SqlParameter("@Description", SqlDbType.VarChar, 1024);
				}
			}
			
			public static SqlParameter IconPath
			{
				get
				{
					return new SqlParameter("@IconPath", SqlDbType.VarChar, 1024);
				}
			}
			
		}
		#endregion		
	
		#region ColumnNames
		public class ColumnNames
		{  
            public const string LogEntryTypeID = "LogEntryTypeID";
            public const string Name = "Name";
            public const string Description = "Description";
            public const string IconPath = "IconPath";

			static public string ToPropertyName(string columnName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[LogEntryTypeID] = _LogEntryType.PropertyNames.LogEntryTypeID;
					ht[Name] = _LogEntryType.PropertyNames.Name;
					ht[Description] = _LogEntryType.PropertyNames.Description;
					ht[IconPath] = _LogEntryType.PropertyNames.IconPath;

				}
				return (string)ht[columnName];
			}

			static private Hashtable ht = null;			 
		}
		#endregion
		
		#region PropertyNames
		public class PropertyNames
		{  
            public const string LogEntryTypeID = "LogEntryTypeID";
            public const string Name = "Name";
            public const string Description = "Description";
            public const string IconPath = "IconPath";

			static public string ToColumnName(string propertyName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[LogEntryTypeID] = _LogEntryType.ColumnNames.LogEntryTypeID;
					ht[Name] = _LogEntryType.ColumnNames.Name;
					ht[Description] = _LogEntryType.ColumnNames.Description;
					ht[IconPath] = _LogEntryType.ColumnNames.IconPath;

				}
				return (string)ht[propertyName];
			}

			static private Hashtable ht = null;			 
		}			 
		#endregion	

		#region StringPropertyNames
		public class StringPropertyNames
		{  
            public const string LogEntryTypeID = "s_LogEntryTypeID";
            public const string Name = "s_Name";
            public const string Description = "s_Description";
            public const string IconPath = "s_IconPath";

		}
		#endregion		
		
		#region Properties
	
		public virtual int LogEntryTypeID
	    {
			get
	        {
				return base.Getint(ColumnNames.LogEntryTypeID);
			}
			set
	        {
				base.Setint(ColumnNames.LogEntryTypeID, value);
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

		public virtual string IconPath
	    {
			get
	        {
				return base.Getstring(ColumnNames.IconPath);
			}
			set
	        {
				base.Setstring(ColumnNames.IconPath, value);
			}
		}


		#endregion
		
		#region String Properties
	
		public virtual string s_LogEntryTypeID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.LogEntryTypeID) ? string.Empty : base.GetintAsString(ColumnNames.LogEntryTypeID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.LogEntryTypeID);
				else
					this.LogEntryTypeID = base.SetintAsString(ColumnNames.LogEntryTypeID, value);
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

		public virtual string s_IconPath
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.IconPath) ? string.Empty : base.GetstringAsString(ColumnNames.IconPath);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.IconPath);
				else
					this.IconPath = base.SetstringAsString(ColumnNames.IconPath, value);
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
				
				
				public WhereParameter LogEntryTypeID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.LogEntryTypeID, Parameters.LogEntryTypeID);
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

				public WhereParameter IconPath
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.IconPath, Parameters.IconPath);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}


				private WhereClause _clause;
			}
			#endregion
		
			public WhereParameter LogEntryTypeID
		    {
				get
		        {
					if(_LogEntryTypeID_W == null)
	        	    {
						_LogEntryTypeID_W = TearOff.LogEntryTypeID;
					}
					return _LogEntryTypeID_W;
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

			public WhereParameter IconPath
		    {
				get
		        {
					if(_IconPath_W == null)
	        	    {
						_IconPath_W = TearOff.IconPath;
					}
					return _IconPath_W;
				}
			}

			private WhereParameter _LogEntryTypeID_W = null;
			private WhereParameter _Name_W = null;
			private WhereParameter _Description_W = null;
			private WhereParameter _IconPath_W = null;

			public void WhereClauseReset()
			{
				_LogEntryTypeID_W = null;
				_Name_W = null;
				_Description_W = null;
				_IconPath_W = null;

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
				
				
				public AggregateParameter LogEntryTypeID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.LogEntryTypeID, Parameters.LogEntryTypeID);
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

				public AggregateParameter IconPath
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.IconPath, Parameters.IconPath);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}


				private AggregateClause _clause;
			}
			#endregion
		
			public AggregateParameter LogEntryTypeID
		    {
				get
		        {
					if(_LogEntryTypeID_W == null)
	        	    {
						_LogEntryTypeID_W = TearOff.LogEntryTypeID;
					}
					return _LogEntryTypeID_W;
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

			public AggregateParameter IconPath
		    {
				get
		        {
					if(_IconPath_W == null)
	        	    {
						_IconPath_W = TearOff.IconPath;
					}
					return _IconPath_W;
				}
			}

			private AggregateParameter _LogEntryTypeID_W = null;
			private AggregateParameter _Name_W = null;
			private AggregateParameter _Description_W = null;
			private AggregateParameter _IconPath_W = null;

			public void AggregateClauseReset()
			{
				_LogEntryTypeID_W = null;
				_Name_W = null;
				_Description_W = null;
				_IconPath_W = null;

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
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "InsertLogEntryType]";
	
			CreateParameters(cmd);
			
			SqlParameter p;
			p = cmd.Parameters[Parameters.LogEntryTypeID.ParameterName];
			p.Direction = ParameterDirection.Output;
    
			return cmd;
		}
	
		protected override IDbCommand GetUpdateCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "UpdateLogEntryType]";
	
			CreateParameters(cmd);
			      
			return cmd;
		}
	
		protected override IDbCommand GetDeleteCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "DeleteLogEntryType]";
	
			SqlParameter p;
			p = cmd.Parameters.Add(Parameters.LogEntryTypeID);
			p.SourceColumn = ColumnNames.LogEntryTypeID;
			p.SourceVersion = DataRowVersion.Current;

  
			return cmd;
		}
		
		private IDbCommand CreateParameters(SqlCommand cmd)
		{
			SqlParameter p;
		
			p = cmd.Parameters.Add(Parameters.LogEntryTypeID);
			p.SourceColumn = ColumnNames.LogEntryTypeID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.Name);
			p.SourceColumn = ColumnNames.Name;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.Description);
			p.SourceColumn = ColumnNames.Description;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.IconPath);
			p.SourceColumn = ColumnNames.IconPath;
			p.SourceVersion = DataRowVersion.Current;


			return cmd;
		}
	}
}
