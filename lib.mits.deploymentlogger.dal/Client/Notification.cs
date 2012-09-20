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
    public abstract class _Notification : SqlClientEntity
    {
        public _Notification()
        {
            this.QuerySource = "Notification";
            this.MappingName = "Notification";

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

            return base.LoadFromSql("[" + this.SchemaStoredProcedure + "LoadAllNotification]", parameters);
        }

        //=================================================================
        // public Overridable Function LoadByPrimaryKey()  As Boolean
        //=================================================================
        //  Loads a single row of via the primary key
        //=================================================================
        public virtual bool LoadByPrimaryKey(int NotificationID)
        {
            ListDictionary parameters = new ListDictionary();
            parameters.Add(Parameters.NotificationID, NotificationID);


            return base.LoadFromSql("[" + this.SchemaStoredProcedure + "LoadNotificationByPrimaryKey]", parameters);
        }

        #region Parameters
        protected class Parameters
        {

            public static SqlParameter NotificationID
            {
                get
                {
                    return new SqlParameter("@NotificationID", SqlDbType.Int, 0);
                }
            }

            public static SqlParameter NotificationTypeID
            {
                get
                {
                    return new SqlParameter("@NotificationTypeID", SqlDbType.Int, 0);
                }
            }

            public static SqlParameter ProjectID
            {
                get
                {
                    return new SqlParameter("@ProjectID", SqlDbType.Int, 0);
                }
            }

            public static SqlParameter UpdateID
            {
                get
                {
                    return new SqlParameter("@UpdateID", SqlDbType.Int, 0);
                }
            }

            public static SqlParameter Header
            {
                get
                {
                    return new SqlParameter("@Header", SqlDbType.VarChar, 1024);
                }
            }

            public static SqlParameter Description
            {
                get
                {
                    return new SqlParameter("@Description", SqlDbType.VarChar, 8000);
                }
            }

            public static SqlParameter DateCreated
            {
                get
                {
                    return new SqlParameter("@DateCreated", SqlDbType.DateTime, 0);
                }
            }

            public static SqlParameter Complete
            {
                get
                {
                    return new SqlParameter("@Complete", SqlDbType.Bit, 0);
                }
            }

        }
        #endregion

        #region ColumnNames
        public class ColumnNames
        {
            public const string NotificationID = "NotificationID";
            public const string NotificationTypeID = "NotificationTypeID";
            public const string ProjectID = "ProjectID";
            public const string UpdateID = "UpdateID";
            public const string Header = "Header";
            public const string Description = "Description";
            public const string DateCreated = "DateCreated";
            public const string Complete = "Complete";

            static public string ToPropertyName(string columnName)
            {
                if (ht == null)
                {
                    ht = new Hashtable();

                    ht[NotificationID] = _Notification.PropertyNames.NotificationID;
                    ht[NotificationTypeID] = _Notification.PropertyNames.NotificationTypeID;
                    ht[ProjectID] = _Notification.PropertyNames.ProjectID;
                    ht[UpdateID] = _Notification.PropertyNames.UpdateID;
                    ht[Header] = _Notification.PropertyNames.Header;
                    ht[Description] = _Notification.PropertyNames.Description;
                    ht[DateCreated] = _Notification.PropertyNames.DateCreated;
                    ht[Complete] = _Notification.PropertyNames.Complete;

                }
                return (string)ht[columnName];
            }

            static private Hashtable ht = null;
        }
        #endregion

        #region PropertyNames
        public class PropertyNames
        {
            public const string NotificationID = "NotificationID";
            public const string NotificationTypeID = "NotificationTypeID";
            public const string ProjectID = "ProjectID";
            public const string UpdateID = "UpdateID";
            public const string Header = "Header";
            public const string Description = "Description";
            public const string DateCreated = "DateCreated";
            public const string Complete = "Complete";

            static public string ToColumnName(string propertyName)
            {
                if (ht == null)
                {
                    ht = new Hashtable();

                    ht[NotificationID] = _Notification.ColumnNames.NotificationID;
                    ht[NotificationTypeID] = _Notification.ColumnNames.NotificationTypeID;
                    ht[ProjectID] = _Notification.ColumnNames.ProjectID;
                    ht[UpdateID] = _Notification.ColumnNames.UpdateID;
                    ht[Header] = _Notification.ColumnNames.Header;
                    ht[Description] = _Notification.ColumnNames.Description;
                    ht[DateCreated] = _Notification.ColumnNames.DateCreated;
                    ht[Complete] = _Notification.ColumnNames.Complete;

                }
                return (string)ht[propertyName];
            }

            static private Hashtable ht = null;
        }
        #endregion

        #region StringPropertyNames
        public class StringPropertyNames
        {
            public const string NotificationID = "s_NotificationID";
            public const string NotificationTypeID = "s_NotificationTypeID";
            public const string ProjectID = "s_ProjectID";
            public const string UpdateID = "s_UpdateID";
            public const string Header = "s_Header";
            public const string Description = "s_Description";
            public const string DateCreated = "s_DateCreated";
            public const string Complete = "s_Complete";

        }
        #endregion

        #region Properties

        public virtual int NotificationID
        {
            get
            {
                return base.Getint(ColumnNames.NotificationID);
            }
            set
            {
                base.Setint(ColumnNames.NotificationID, value);
            }
        }

        public virtual int NotificationTypeID
        {
            get
            {
                return base.Getint(ColumnNames.NotificationTypeID);
            }
            set
            {
                base.Setint(ColumnNames.NotificationTypeID, value);
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

        public virtual string Header
        {
            get
            {
                return base.Getstring(ColumnNames.Header);
            }
            set
            {
                base.Setstring(ColumnNames.Header, value);
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

        public virtual DateTime DateCreated
        {
            get
            {
                return base.GetDateTime(ColumnNames.DateCreated);
            }
            set
            {
                base.SetDateTime(ColumnNames.DateCreated, value);
            }
        }

        public virtual bool Complete
        {
            get
            {
                return base.Getbool(ColumnNames.Complete);
            }
            set
            {
                base.Setbool(ColumnNames.Complete, value);
            }
        }


        #endregion

        #region String Properties

        public virtual string s_NotificationID
        {
            get
            {
                return this.IsColumnNull(ColumnNames.NotificationID) ? string.Empty : base.GetintAsString(ColumnNames.NotificationID);
            }
            set
            {
                if (string.Empty == value)
                    this.SetColumnNull(ColumnNames.NotificationID);
                else
                    this.NotificationID = base.SetintAsString(ColumnNames.NotificationID, value);
            }
        }

        public virtual string s_NotificationTypeID
        {
            get
            {
                return this.IsColumnNull(ColumnNames.NotificationTypeID) ? string.Empty : base.GetintAsString(ColumnNames.NotificationTypeID);
            }
            set
            {
                if (string.Empty == value)
                    this.SetColumnNull(ColumnNames.NotificationTypeID);
                else
                    this.NotificationTypeID = base.SetintAsString(ColumnNames.NotificationTypeID, value);
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
                if (string.Empty == value)
                    this.SetColumnNull(ColumnNames.ProjectID);
                else
                    this.ProjectID = base.SetintAsString(ColumnNames.ProjectID, value);
            }
        }

        public virtual string s_UpdateID
        {
            get
            {
                return this.IsColumnNull(ColumnNames.UpdateID) ? string.Empty : base.GetintAsString(ColumnNames.UpdateID);
            }
            set
            {
                if (string.Empty == value)
                    this.SetColumnNull(ColumnNames.UpdateID);
                else
                    this.UpdateID = base.SetintAsString(ColumnNames.UpdateID, value);
            }
        }

        public virtual string s_Header
        {
            get
            {
                return this.IsColumnNull(ColumnNames.Header) ? string.Empty : base.GetstringAsString(ColumnNames.Header);
            }
            set
            {
                if (string.Empty == value)
                    this.SetColumnNull(ColumnNames.Header);
                else
                    this.Header = base.SetstringAsString(ColumnNames.Header, value);
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
                if (string.Empty == value)
                    this.SetColumnNull(ColumnNames.Description);
                else
                    this.Description = base.SetstringAsString(ColumnNames.Description, value);
            }
        }

        public virtual string s_DateCreated
        {
            get
            {
                return this.IsColumnNull(ColumnNames.DateCreated) ? string.Empty : base.GetDateTimeAsString(ColumnNames.DateCreated);
            }
            set
            {
                if (string.Empty == value)
                    this.SetColumnNull(ColumnNames.DateCreated);
                else
                    this.DateCreated = base.SetDateTimeAsString(ColumnNames.DateCreated, value);
            }
        }

        public virtual string s_Complete
        {
            get
            {
                return this.IsColumnNull(ColumnNames.Complete) ? string.Empty : base.GetboolAsString(ColumnNames.Complete);
            }
            set
            {
                if (string.Empty == value)
                    this.SetColumnNull(ColumnNames.Complete);
                else
                    this.Complete = base.SetboolAsString(ColumnNames.Complete, value);
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
                    if (_tearOff == null)
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


                public WhereParameter NotificationID
                {
                    get
                    {
                        WhereParameter where = new WhereParameter(ColumnNames.NotificationID, Parameters.NotificationID);
                        this._clause._entity.Query.AddWhereParameter(where);
                        return where;
                    }
                }

                public WhereParameter NotificationTypeID
                {
                    get
                    {
                        WhereParameter where = new WhereParameter(ColumnNames.NotificationTypeID, Parameters.NotificationTypeID);
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

                public WhereParameter UpdateID
                {
                    get
                    {
                        WhereParameter where = new WhereParameter(ColumnNames.UpdateID, Parameters.UpdateID);
                        this._clause._entity.Query.AddWhereParameter(where);
                        return where;
                    }
                }

                public WhereParameter Header
                {
                    get
                    {
                        WhereParameter where = new WhereParameter(ColumnNames.Header, Parameters.Header);
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

                public WhereParameter DateCreated
                {
                    get
                    {
                        WhereParameter where = new WhereParameter(ColumnNames.DateCreated, Parameters.DateCreated);
                        this._clause._entity.Query.AddWhereParameter(where);
                        return where;
                    }
                }

                public WhereParameter Complete
                {
                    get
                    {
                        WhereParameter where = new WhereParameter(ColumnNames.Complete, Parameters.Complete);
                        this._clause._entity.Query.AddWhereParameter(where);
                        return where;
                    }
                }


                private WhereClause _clause;
            }
            #endregion

            public WhereParameter NotificationID
            {
                get
                {
                    if (_NotificationID_W == null)
                    {
                        _NotificationID_W = TearOff.NotificationID;
                    }
                    return _NotificationID_W;
                }
            }

            public WhereParameter NotificationTypeID
            {
                get
                {
                    if (_NotificationTypeID_W == null)
                    {
                        _NotificationTypeID_W = TearOff.NotificationTypeID;
                    }
                    return _NotificationTypeID_W;
                }
            }

            public WhereParameter ProjectID
            {
                get
                {
                    if (_ProjectID_W == null)
                    {
                        _ProjectID_W = TearOff.ProjectID;
                    }
                    return _ProjectID_W;
                }
            }

            public WhereParameter UpdateID
            {
                get
                {
                    if (_UpdateID_W == null)
                    {
                        _UpdateID_W = TearOff.UpdateID;
                    }
                    return _UpdateID_W;
                }
            }

            public WhereParameter Header
            {
                get
                {
                    if (_Header_W == null)
                    {
                        _Header_W = TearOff.Header;
                    }
                    return _Header_W;
                }
            }

            public WhereParameter Description
            {
                get
                {
                    if (_Description_W == null)
                    {
                        _Description_W = TearOff.Description;
                    }
                    return _Description_W;
                }
            }

            public WhereParameter DateCreated
            {
                get
                {
                    if (_DateCreated_W == null)
                    {
                        _DateCreated_W = TearOff.DateCreated;
                    }
                    return _DateCreated_W;
                }
            }

            public WhereParameter Complete
            {
                get
                {
                    if (_Complete_W == null)
                    {
                        _Complete_W = TearOff.Complete;
                    }
                    return _Complete_W;
                }
            }

            private WhereParameter _NotificationID_W = null;
            private WhereParameter _NotificationTypeID_W = null;
            private WhereParameter _ProjectID_W = null;
            private WhereParameter _UpdateID_W = null;
            private WhereParameter _Header_W = null;
            private WhereParameter _Description_W = null;
            private WhereParameter _DateCreated_W = null;
            private WhereParameter _Complete_W = null;

            public void WhereClauseReset()
            {
                _NotificationID_W = null;
                _NotificationTypeID_W = null;
                _ProjectID_W = null;
                _UpdateID_W = null;
                _Header_W = null;
                _Description_W = null;
                _DateCreated_W = null;
                _Complete_W = null;

                this._entity.Query.FlushWhereParameters();

            }

            private BusinessEntity _entity;
            private TearOffWhereParameter _tearOff;

        }

        public WhereClause Where
        {
            get
            {
                if (_whereClause == null)
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
                    if (_tearOff == null)
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


                public AggregateParameter NotificationID
                {
                    get
                    {
                        AggregateParameter aggregate = new AggregateParameter(ColumnNames.NotificationID, Parameters.NotificationID);
                        this._clause._entity.Query.AddAggregateParameter(aggregate);
                        return aggregate;
                    }
                }

                public AggregateParameter NotificationTypeID
                {
                    get
                    {
                        AggregateParameter aggregate = new AggregateParameter(ColumnNames.NotificationTypeID, Parameters.NotificationTypeID);
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

                public AggregateParameter UpdateID
                {
                    get
                    {
                        AggregateParameter aggregate = new AggregateParameter(ColumnNames.UpdateID, Parameters.UpdateID);
                        this._clause._entity.Query.AddAggregateParameter(aggregate);
                        return aggregate;
                    }
                }

                public AggregateParameter Header
                {
                    get
                    {
                        AggregateParameter aggregate = new AggregateParameter(ColumnNames.Header, Parameters.Header);
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

                public AggregateParameter DateCreated
                {
                    get
                    {
                        AggregateParameter aggregate = new AggregateParameter(ColumnNames.DateCreated, Parameters.DateCreated);
                        this._clause._entity.Query.AddAggregateParameter(aggregate);
                        return aggregate;
                    }
                }

                public AggregateParameter Complete
                {
                    get
                    {
                        AggregateParameter aggregate = new AggregateParameter(ColumnNames.Complete, Parameters.Complete);
                        this._clause._entity.Query.AddAggregateParameter(aggregate);
                        return aggregate;
                    }
                }


                private AggregateClause _clause;
            }
            #endregion

            public AggregateParameter NotificationID
            {
                get
                {
                    if (_NotificationID_W == null)
                    {
                        _NotificationID_W = TearOff.NotificationID;
                    }
                    return _NotificationID_W;
                }
            }

            public AggregateParameter NotificationTypeID
            {
                get
                {
                    if (_NotificationTypeID_W == null)
                    {
                        _NotificationTypeID_W = TearOff.NotificationTypeID;
                    }
                    return _NotificationTypeID_W;
                }
            }

            public AggregateParameter ProjectID
            {
                get
                {
                    if (_ProjectID_W == null)
                    {
                        _ProjectID_W = TearOff.ProjectID;
                    }
                    return _ProjectID_W;
                }
            }

            public AggregateParameter UpdateID
            {
                get
                {
                    if (_UpdateID_W == null)
                    {
                        _UpdateID_W = TearOff.UpdateID;
                    }
                    return _UpdateID_W;
                }
            }

            public AggregateParameter Header
            {
                get
                {
                    if (_Header_W == null)
                    {
                        _Header_W = TearOff.Header;
                    }
                    return _Header_W;
                }
            }

            public AggregateParameter Description
            {
                get
                {
                    if (_Description_W == null)
                    {
                        _Description_W = TearOff.Description;
                    }
                    return _Description_W;
                }
            }

            public AggregateParameter DateCreated
            {
                get
                {
                    if (_DateCreated_W == null)
                    {
                        _DateCreated_W = TearOff.DateCreated;
                    }
                    return _DateCreated_W;
                }
            }

            public AggregateParameter Complete
            {
                get
                {
                    if (_Complete_W == null)
                    {
                        _Complete_W = TearOff.Complete;
                    }
                    return _Complete_W;
                }
            }

            private AggregateParameter _NotificationID_W = null;
            private AggregateParameter _NotificationTypeID_W = null;
            private AggregateParameter _ProjectID_W = null;
            private AggregateParameter _UpdateID_W = null;
            private AggregateParameter _Header_W = null;
            private AggregateParameter _Description_W = null;
            private AggregateParameter _DateCreated_W = null;
            private AggregateParameter _Complete_W = null;

            public void AggregateClauseReset()
            {
                _NotificationID_W = null;
                _NotificationTypeID_W = null;
                _ProjectID_W = null;
                _UpdateID_W = null;
                _Header_W = null;
                _Description_W = null;
                _DateCreated_W = null;
                _Complete_W = null;

                this._entity.Query.FlushAggregateParameters();

            }

            private BusinessEntity _entity;
            private TearOffAggregateParameter _tearOff;

        }

        public AggregateClause Aggregate
        {
            get
            {
                if (_aggregateClause == null)
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
            cmd.CommandText = "[" + this.SchemaStoredProcedure + "InsertNotification]";

            CreateParameters(cmd);

            SqlParameter p;
            p = cmd.Parameters[Parameters.NotificationID.ParameterName];
            p.Direction = ParameterDirection.Output;

            return cmd;
        }

        protected override IDbCommand GetUpdateCommand()
        {

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "[" + this.SchemaStoredProcedure + "UpdateNotification]";

            CreateParameters(cmd);

            return cmd;
        }

        protected override IDbCommand GetDeleteCommand()
        {

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "[" + this.SchemaStoredProcedure + "DeleteNotification]";

            SqlParameter p;
            p = cmd.Parameters.Add(Parameters.NotificationID);
            p.SourceColumn = ColumnNames.NotificationID;
            p.SourceVersion = DataRowVersion.Current;


            return cmd;
        }

        private IDbCommand CreateParameters(SqlCommand cmd)
        {
            SqlParameter p;

            p = cmd.Parameters.Add(Parameters.NotificationID);
            p.SourceColumn = ColumnNames.NotificationID;
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.NotificationTypeID);
            p.SourceColumn = ColumnNames.NotificationTypeID;
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.ProjectID);
            p.SourceColumn = ColumnNames.ProjectID;
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.UpdateID);
            p.SourceColumn = ColumnNames.UpdateID;
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Header);
            p.SourceColumn = ColumnNames.Header;
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Description);
            p.SourceColumn = ColumnNames.Description;
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.DateCreated);
            p.SourceColumn = ColumnNames.DateCreated;
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Complete);
            p.SourceColumn = ColumnNames.Complete;
            p.SourceVersion = DataRowVersion.Current;


            return cmd;
        }
    }
}

