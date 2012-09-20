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

namespace DL_DAL.Master
{
	public abstract class _UserRole : SqlClientEntity
	{
		public _UserRole()
		{
			this.QuerySource = "UserRole";
			this.MappingName = "UserRole";

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
			
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "LoadAllUserRole]", parameters);
		}
	
		//=================================================================
		// public Overridable Function LoadByPrimaryKey()  As Boolean
		//=================================================================
		//  Loads a single row of via the primary key
		//=================================================================
		public virtual bool LoadByPrimaryKey(int UserID, int RoleID, int OrganizationID)
		{
			ListDictionary parameters = new ListDictionary();
			parameters.Add(Parameters.UserID, UserID);

parameters.Add(Parameters.RoleID, RoleID);

parameters.Add(Parameters.OrganizationID, OrganizationID);

		
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "LoadUserRoleByPrimaryKey]", parameters);
		}
		
		#region Parameters
		protected class Parameters
		{
			
			public static SqlParameter UserID
			{
				get
				{
					return new SqlParameter("@UserID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter RoleID
			{
				get
				{
					return new SqlParameter("@RoleID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter OrganizationID
			{
				get
				{
					return new SqlParameter("@OrganizationID", SqlDbType.Int, 0);
				}
			}
			
		}
		#endregion		
	
		#region ColumnNames
		public class ColumnNames
		{  
            public const string UserID = "UserID";
            public const string RoleID = "RoleID";
            public const string OrganizationID = "OrganizationID";

			static public string ToPropertyName(string columnName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[UserID] = _UserRole.PropertyNames.UserID;
					ht[RoleID] = _UserRole.PropertyNames.RoleID;
					ht[OrganizationID] = _UserRole.PropertyNames.OrganizationID;

				}
				return (string)ht[columnName];
			}

			static private Hashtable ht = null;			 
		}
		#endregion
		
		#region PropertyNames
		public class PropertyNames
		{  
            public const string UserID = "UserID";
            public const string RoleID = "RoleID";
            public const string OrganizationID = "OrganizationID";

			static public string ToColumnName(string propertyName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[UserID] = _UserRole.ColumnNames.UserID;
					ht[RoleID] = _UserRole.ColumnNames.RoleID;
					ht[OrganizationID] = _UserRole.ColumnNames.OrganizationID;

				}
				return (string)ht[propertyName];
			}

			static private Hashtable ht = null;			 
		}			 
		#endregion	

		#region StringPropertyNames
		public class StringPropertyNames
		{  
            public const string UserID = "s_UserID";
            public const string RoleID = "s_RoleID";
            public const string OrganizationID = "s_OrganizationID";

		}
		#endregion		
		
		#region Properties
	
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

		public virtual int RoleID
	    {
			get
	        {
				return base.Getint(ColumnNames.RoleID);
			}
			set
	        {
				base.Setint(ColumnNames.RoleID, value);
			}
		}

		public virtual int OrganizationID
	    {
			get
	        {
				return base.Getint(ColumnNames.OrganizationID);
			}
			set
	        {
				base.Setint(ColumnNames.OrganizationID, value);
			}
		}


		#endregion
		
		#region String Properties
	
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

		public virtual string s_RoleID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.RoleID) ? string.Empty : base.GetintAsString(ColumnNames.RoleID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.RoleID);
				else
					this.RoleID = base.SetintAsString(ColumnNames.RoleID, value);
			}
		}

		public virtual string s_OrganizationID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.OrganizationID) ? string.Empty : base.GetintAsString(ColumnNames.OrganizationID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.OrganizationID);
				else
					this.OrganizationID = base.SetintAsString(ColumnNames.OrganizationID, value);
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
				
				
				public WhereParameter UserID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.UserID, Parameters.UserID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter RoleID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.RoleID, Parameters.RoleID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter OrganizationID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.OrganizationID, Parameters.OrganizationID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}


				private WhereClause _clause;
			}
			#endregion
		
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

			public WhereParameter RoleID
		    {
				get
		        {
					if(_RoleID_W == null)
	        	    {
						_RoleID_W = TearOff.RoleID;
					}
					return _RoleID_W;
				}
			}

			public WhereParameter OrganizationID
		    {
				get
		        {
					if(_OrganizationID_W == null)
	        	    {
						_OrganizationID_W = TearOff.OrganizationID;
					}
					return _OrganizationID_W;
				}
			}

			private WhereParameter _UserID_W = null;
			private WhereParameter _RoleID_W = null;
			private WhereParameter _OrganizationID_W = null;

			public void WhereClauseReset()
			{
				_UserID_W = null;
				_RoleID_W = null;
				_OrganizationID_W = null;

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
				
				
				public AggregateParameter UserID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.UserID, Parameters.UserID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter RoleID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.RoleID, Parameters.RoleID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter OrganizationID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.OrganizationID, Parameters.OrganizationID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}


				private AggregateClause _clause;
			}
			#endregion
		
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

			public AggregateParameter RoleID
		    {
				get
		        {
					if(_RoleID_W == null)
	        	    {
						_RoleID_W = TearOff.RoleID;
					}
					return _RoleID_W;
				}
			}

			public AggregateParameter OrganizationID
		    {
				get
		        {
					if(_OrganizationID_W == null)
	        	    {
						_OrganizationID_W = TearOff.OrganizationID;
					}
					return _OrganizationID_W;
				}
			}

			private AggregateParameter _UserID_W = null;
			private AggregateParameter _RoleID_W = null;
			private AggregateParameter _OrganizationID_W = null;

			public void AggregateClauseReset()
			{
				_UserID_W = null;
				_RoleID_W = null;
				_OrganizationID_W = null;

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
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "InsertUserRole]";
	
			CreateParameters(cmd);
			    
			return cmd;
		}
	
		protected override IDbCommand GetUpdateCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "UpdateUserRole]";
	
			CreateParameters(cmd);
			      
			return cmd;
		}
	
		protected override IDbCommand GetDeleteCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "DeleteUserRole]";
	
			SqlParameter p;
			p = cmd.Parameters.Add(Parameters.UserID);
			p.SourceColumn = ColumnNames.UserID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.RoleID);
			p.SourceColumn = ColumnNames.RoleID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.OrganizationID);
			p.SourceColumn = ColumnNames.OrganizationID;
			p.SourceVersion = DataRowVersion.Current;

  
			return cmd;
		}
		
		private IDbCommand CreateParameters(SqlCommand cmd)
		{
			SqlParameter p;
		
			p = cmd.Parameters.Add(Parameters.UserID);
			p.SourceColumn = ColumnNames.UserID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.RoleID);
			p.SourceColumn = ColumnNames.RoleID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.OrganizationID);
			p.SourceColumn = ColumnNames.OrganizationID;
			p.SourceVersion = DataRowVersion.Current;


			return cmd;
		}
	}
}