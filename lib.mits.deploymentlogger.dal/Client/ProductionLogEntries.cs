using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Collections.Specialized;

using MyGeneration.dOOdads;

namespace DL_DAL.Client
{
    public class ProductionLogEntries : SqlClientEntity
    {
        public ProductionLogEntries()
        {
            this.QuerySource = "ProductionLogEntries";
            this.MappingName = "ProductionLogEntries";
        }

 
        public ProductionLogEntries(string sConnectionString)
            : this()
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

            public static SqlParameter Description
            {
                get
                {
                    return new SqlParameter("@Description", SqlDbType.Text, 2147483647);
                }
            }

            public static SqlParameter Header
            {
                get
                {
                    return new SqlParameter("@Header", SqlDbType.VarChar, 8000);
                }
            }

            public static SqlParameter LogEntryID
            {
                get
                {
                    return new SqlParameter("@LogEntryID", SqlDbType.Int, 0);
                }
            }

            public static SqlParameter LogEntryTypeID
            {
                get
                {
                    return new SqlParameter("@LogEntryTypeID", SqlDbType.Int, 0);
                }
            }

            public static SqlParameter ProjectID
            {
                get
                {
                    return new SqlParameter("@ProjectID", SqlDbType.Int, 0);
                }
            }

            public static SqlParameter PublicDescription
            {
                get
                {
                    return new SqlParameter("@PublicDescription", SqlDbType.Text, 2147483647);
                }
            }

            public static SqlParameter PublicHeader
            {
                get
                {
                    return new SqlParameter("@PublicHeader", SqlDbType.VarChar, 8000);
                }
            }

            public static SqlParameter TimeStamp
            {
                get
                {
                    return new SqlParameter("@TimeStamp", SqlDbType.DateTime, 0);
                }
            }

            public static SqlParameter UpdateID
            {
                get
                {
                    return new SqlParameter("@UpdateID", SqlDbType.Int, 0);
                }
            }

            public static SqlParameter LogEntryStatusID
            {
                get
                {
                    return new SqlParameter("@LogEntryStatusID", SqlDbType.Int, 0);
                }
            }

            public static SqlParameter IconPath
            {
                get
                {
                    return new SqlParameter("@IconPath", SqlDbType.VarChar, 1024);
                }
            }

            public static SqlParameter TypeName
            {
                get
                {
                    return new SqlParameter("@TypeName", SqlDbType.VarChar, 255);
                }
            }

            public static SqlParameter ImpactLevelID
            {
                get
                {
                    return new SqlParameter("@ImpactLevelID", SqlDbType.Int, 0);
                }
            }

            public static SqlParameter ProjectSectionID
            {
                get
                {
                    return new SqlParameter("@ProjectSectionID", SqlDbType.Int, 0);
                }
            }

            public static SqlParameter ProjectSectionName
            {
                get
                {
                    return new SqlParameter("@ProjectSectionName", SqlDbType.VarChar, 255);
                }
            }

        }
        #endregion

        #region ColumnNames
        public class ColumnNames
        {
            public const string Description = "Description";
            public const string Header = "Header";
            public const string LogEntryID = "LogEntryID";
            public const string LogEntryTypeID = "LogEntryTypeID";
            public const string ProjectID = "ProjectID";
            public const string PublicDescription = "PublicDescription";
            public const string PublicHeader = "PublicHeader";
            public const string TimeStamp = "TimeStamp";
            public const string UpdateID = "UpdateID";
            public const string LogEntryStatusID = "LogEntryStatusID";
            public const string IconPath = "IconPath";
            public const string TypeName = "TypeName";
            public const string ImpactLevelID = "ImpactLevelID";
            public const string ProjectSectionID = "ProjectSectionID";
            public const string ProjectSectionName = "ProjectSectionName";

            static public string ToPropertyName(string columnName)
            {
                if (ht == null)
                {
                    ht = new Hashtable();

                    ht[Description] = ProductionLogEntries.PropertyNames.Description;
                    ht[Header] = ProductionLogEntries.PropertyNames.Header;
                    ht[LogEntryID] = ProductionLogEntries.PropertyNames.LogEntryID;
                    ht[LogEntryTypeID] = ProductionLogEntries.PropertyNames.LogEntryTypeID;
                    ht[ProjectID] = ProductionLogEntries.PropertyNames.ProjectID;
                    ht[PublicDescription] = ProductionLogEntries.PropertyNames.PublicDescription;
                    ht[PublicHeader] = ProductionLogEntries.PropertyNames.PublicHeader;
                    ht[TimeStamp] = ProductionLogEntries.PropertyNames.TimeStamp;
                    ht[UpdateID] = ProductionLogEntries.PropertyNames.UpdateID;
                    ht[LogEntryStatusID] = ProductionLogEntries.PropertyNames.LogEntryStatusID;
                    ht[IconPath] = ProductionLogEntries.PropertyNames.IconPath;
                    ht[TypeName] = ProductionLogEntries.PropertyNames.TypeName;
                    ht[ImpactLevelID] = ProductionLogEntries.PropertyNames.ImpactLevelID;
                    ht[ProjectSectionID] = ProductionLogEntries.PropertyNames.ProjectSectionID;
                    ht[ProjectSectionName] = ProductionLogEntries.PropertyNames.ProjectSectionName;

                }
                return (string)ht[columnName];
            }

            static private Hashtable ht = null;
        }
        #endregion

        #region PropertyNames
        public class PropertyNames
        {
            public const string Description = "Description";
            public const string Header = "Header";
            public const string LogEntryID = "LogEntryID";
            public const string LogEntryTypeID = "LogEntryTypeID";
            public const string ProjectID = "ProjectID";
            public const string PublicDescription = "PublicDescription";
            public const string PublicHeader = "PublicHeader";
            public const string TimeStamp = "TimeStamp";
            public const string UpdateID = "UpdateID";
            public const string LogEntryStatusID = "LogEntryStatusID";
            public const string IconPath = "IconPath";
            public const string TypeName = "TypeName";
            public const string ImpactLevelID = "ImpactLevelID";
            public const string ProjectSectionID = "ProjectSectionID";
            public const string ProjectSectionName = "ProjectSectionName";

            static public string ToColumnName(string propertyName)
            {
                if (ht == null)
                {
                    ht = new Hashtable();

                    ht[Description] = ProductionLogEntries.ColumnNames.Description;
                    ht[Header] = ProductionLogEntries.ColumnNames.Header;
                    ht[LogEntryID] = ProductionLogEntries.ColumnNames.LogEntryID;
                    ht[LogEntryTypeID] = ProductionLogEntries.ColumnNames.LogEntryTypeID;
                    ht[ProjectID] = ProductionLogEntries.ColumnNames.ProjectID;
                    ht[PublicDescription] = ProductionLogEntries.ColumnNames.PublicDescription;
                    ht[PublicHeader] = ProductionLogEntries.ColumnNames.PublicHeader;
                    ht[TimeStamp] = ProductionLogEntries.ColumnNames.TimeStamp;
                    ht[UpdateID] = ProductionLogEntries.ColumnNames.UpdateID;
                    ht[LogEntryStatusID] = ProductionLogEntries.ColumnNames.LogEntryStatusID;
                    ht[IconPath] = ProductionLogEntries.ColumnNames.IconPath;
                    ht[TypeName] = ProductionLogEntries.ColumnNames.TypeName;
                    ht[ImpactLevelID] = ProductionLogEntries.ColumnNames.ImpactLevelID;
                    ht[ProjectSectionID] = ProductionLogEntries.ColumnNames.ProjectSectionID;
                    ht[ProjectSectionName] = ProductionLogEntries.ColumnNames.ProjectSectionName;

                }
                return (string)ht[propertyName];
            }

            static private Hashtable ht = null;
        }
        #endregion

        #region StringPropertyNames
        public class StringPropertyNames
        {
            public const string Description = "s_Description";
            public const string Header = "s_Header";
            public const string LogEntryID = "s_LogEntryID";
            public const string LogEntryTypeID = "s_LogEntryTypeID";
            public const string ProjectID = "s_ProjectID";
            public const string PublicDescription = "s_PublicDescription";
            public const string PublicHeader = "s_PublicHeader";
            public const string TimeStamp = "s_TimeStamp";
            public const string UpdateID = "s_UpdateID";
            public const string LogEntryStatusID = "s_LogEntryStatusID";
            public const string IconPath = "s_IconPath";
            public const string TypeName = "s_TypeName";
            public const string ImpactLevelID = "s_ImpactLevelID";
            public const string ProjectSectionID = "s_ProjectSectionID";
            public const string ProjectSectionName = "s_ProjectSectionName";

        }
        #endregion

        #region Properties
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

        public virtual int LogEntryID
        {
            get
            {
                return base.Getint(ColumnNames.LogEntryID);
            }
            set
            {
                base.Setint(ColumnNames.LogEntryID, value);
            }
        }

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

        public virtual string PublicDescription
        {
            get
            {
                return base.Getstring(ColumnNames.PublicDescription);
            }
            set
            {
                base.Setstring(ColumnNames.PublicDescription, value);
            }
        }

        public virtual string PublicHeader
        {
            get
            {
                return base.Getstring(ColumnNames.PublicHeader);
            }
            set
            {
                base.Setstring(ColumnNames.PublicHeader, value);
            }
        }

        public virtual DateTime TimeStamp
        {
            get
            {
                return base.GetDateTime(ColumnNames.TimeStamp);
            }
            set
            {
                base.SetDateTime(ColumnNames.TimeStamp, value);
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

        public virtual string TypeName
        {
            get
            {
                return base.Getstring(ColumnNames.TypeName);
            }
            set
            {
                base.Setstring(ColumnNames.TypeName, value);
            }
        }

        public virtual int ImpactLevelID
        {
            get
            {
                return base.Getint(ColumnNames.ImpactLevelID);
            }
            set
            {
                base.Setint(ColumnNames.ImpactLevelID, value);
            }
        }

        public virtual int ProjectSectionID
        {
            get
            {
                return base.Getint(ColumnNames.ProjectSectionID);
            }
            set
            {
                base.Setint(ColumnNames.ProjectSectionID, value);
            }
        }

        public virtual string ProjectSectionName
        {
            get
            {
                return base.Getstring(ColumnNames.ProjectSectionName);
            }
            set
            {
                base.Setstring(ColumnNames.ProjectSectionName, value);
            }
        }


        #endregion

        #region String Properties

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

        public virtual string s_LogEntryID
        {
            get
            {
                return this.IsColumnNull(ColumnNames.LogEntryID) ? string.Empty : base.GetintAsString(ColumnNames.LogEntryID);
            }
            set
            {
                if (string.Empty == value)
                    this.SetColumnNull(ColumnNames.LogEntryID);
                else
                    this.LogEntryID = base.SetintAsString(ColumnNames.LogEntryID, value);
            }
        }

        public virtual string s_LogEntryTypeID
        {
            get
            {
                return this.IsColumnNull(ColumnNames.LogEntryTypeID) ? string.Empty : base.GetintAsString(ColumnNames.LogEntryTypeID);
            }
            set
            {
                if (string.Empty == value)
                    this.SetColumnNull(ColumnNames.LogEntryTypeID);
                else
                    this.LogEntryTypeID = base.SetintAsString(ColumnNames.LogEntryTypeID, value);
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

        public virtual string s_PublicDescription
        {
            get
            {
                return this.IsColumnNull(ColumnNames.PublicDescription) ? string.Empty : base.GetstringAsString(ColumnNames.PublicDescription);
            }
            set
            {
                if (string.Empty == value)
                    this.SetColumnNull(ColumnNames.PublicDescription);
                else
                    this.PublicDescription = base.SetstringAsString(ColumnNames.PublicDescription, value);
            }
        }

        public virtual string s_PublicHeader
        {
            get
            {
                return this.IsColumnNull(ColumnNames.PublicHeader) ? string.Empty : base.GetstringAsString(ColumnNames.PublicHeader);
            }
            set
            {
                if (string.Empty == value)
                    this.SetColumnNull(ColumnNames.PublicHeader);
                else
                    this.PublicHeader = base.SetstringAsString(ColumnNames.PublicHeader, value);
            }
        }

        public virtual string s_TimeStamp
        {
            get
            {
                return this.IsColumnNull(ColumnNames.TimeStamp) ? string.Empty : base.GetDateTimeAsString(ColumnNames.TimeStamp);
            }
            set
            {
                if (string.Empty == value)
                    this.SetColumnNull(ColumnNames.TimeStamp);
                else
                    this.TimeStamp = base.SetDateTimeAsString(ColumnNames.TimeStamp, value);
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

        public virtual string s_LogEntryStatusID
        {
            get
            {
                return this.IsColumnNull(ColumnNames.LogEntryStatusID) ? string.Empty : base.GetintAsString(ColumnNames.LogEntryStatusID);
            }
            set
            {
                if (string.Empty == value)
                    this.SetColumnNull(ColumnNames.LogEntryStatusID);
                else
                    this.LogEntryStatusID = base.SetintAsString(ColumnNames.LogEntryStatusID, value);
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
                if (string.Empty == value)
                    this.SetColumnNull(ColumnNames.IconPath);
                else
                    this.IconPath = base.SetstringAsString(ColumnNames.IconPath, value);
            }
        }

        public virtual string s_TypeName
        {
            get
            {
                return this.IsColumnNull(ColumnNames.TypeName) ? string.Empty : base.GetstringAsString(ColumnNames.TypeName);
            }
            set
            {
                if (string.Empty == value)
                    this.SetColumnNull(ColumnNames.TypeName);
                else
                    this.TypeName = base.SetstringAsString(ColumnNames.TypeName, value);
            }
        }

        public virtual string s_ImpactLevelID
        {
            get
            {
                return this.IsColumnNull(ColumnNames.ImpactLevelID) ? string.Empty : base.GetintAsString(ColumnNames.ImpactLevelID);
            }
            set
            {
                if (string.Empty == value)
                    this.SetColumnNull(ColumnNames.ImpactLevelID);
                else
                    this.ImpactLevelID = base.SetintAsString(ColumnNames.ImpactLevelID, value);
            }
        }

        public virtual string s_ProjectSectionID
        {
            get
            {
                return this.IsColumnNull(ColumnNames.ProjectSectionID) ? string.Empty : base.GetintAsString(ColumnNames.ProjectSectionID);
            }
            set
            {
                if (string.Empty == value)
                    this.SetColumnNull(ColumnNames.ProjectSectionID);
                else
                    this.ProjectSectionID = base.SetintAsString(ColumnNames.ProjectSectionID, value);
            }
        }

        public virtual string s_ProjectSectionName
        {
            get
            {
                return this.IsColumnNull(ColumnNames.ProjectSectionName) ? string.Empty : base.GetstringAsString(ColumnNames.ProjectSectionName);
            }
            set
            {
                if (string.Empty == value)
                    this.SetColumnNull(ColumnNames.ProjectSectionName);
                else
                    this.ProjectSectionName = base.SetstringAsString(ColumnNames.ProjectSectionName, value);
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


                public WhereParameter Description
                {
                    get
                    {
                        WhereParameter where = new WhereParameter(ColumnNames.Description, Parameters.Description);
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

                public WhereParameter LogEntryID
                {
                    get
                    {
                        WhereParameter where = new WhereParameter(ColumnNames.LogEntryID, Parameters.LogEntryID);
                        this._clause._entity.Query.AddWhereParameter(where);
                        return where;
                    }
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

                public WhereParameter ProjectID
                {
                    get
                    {
                        WhereParameter where = new WhereParameter(ColumnNames.ProjectID, Parameters.ProjectID);
                        this._clause._entity.Query.AddWhereParameter(where);
                        return where;
                    }
                }

                public WhereParameter PublicDescription
                {
                    get
                    {
                        WhereParameter where = new WhereParameter(ColumnNames.PublicDescription, Parameters.PublicDescription);
                        this._clause._entity.Query.AddWhereParameter(where);
                        return where;
                    }
                }

                public WhereParameter PublicHeader
                {
                    get
                    {
                        WhereParameter where = new WhereParameter(ColumnNames.PublicHeader, Parameters.PublicHeader);
                        this._clause._entity.Query.AddWhereParameter(where);
                        return where;
                    }
                }

                public WhereParameter TimeStamp
                {
                    get
                    {
                        WhereParameter where = new WhereParameter(ColumnNames.TimeStamp, Parameters.TimeStamp);
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

                public WhereParameter LogEntryStatusID
                {
                    get
                    {
                        WhereParameter where = new WhereParameter(ColumnNames.LogEntryStatusID, Parameters.LogEntryStatusID);
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

                public WhereParameter TypeName
                {
                    get
                    {
                        WhereParameter where = new WhereParameter(ColumnNames.TypeName, Parameters.TypeName);
                        this._clause._entity.Query.AddWhereParameter(where);
                        return where;
                    }
                }

                public WhereParameter ImpactLevelID
                {
                    get
                    {
                        WhereParameter where = new WhereParameter(ColumnNames.ImpactLevelID, Parameters.ImpactLevelID);
                        this._clause._entity.Query.AddWhereParameter(where);
                        return where;
                    }
                }

                public WhereParameter ProjectSectionID
                {
                    get
                    {
                        WhereParameter where = new WhereParameter(ColumnNames.ProjectSectionID, Parameters.ProjectSectionID);
                        this._clause._entity.Query.AddWhereParameter(where);
                        return where;
                    }
                }

                public WhereParameter ProjectSectionName
                {
                    get
                    {
                        WhereParameter where = new WhereParameter(ColumnNames.ProjectSectionName, Parameters.ProjectSectionName);
                        this._clause._entity.Query.AddWhereParameter(where);
                        return where;
                    }
                }


                private WhereClause _clause;
            }
            #endregion

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

            public WhereParameter LogEntryID
            {
                get
                {
                    if (_LogEntryID_W == null)
                    {
                        _LogEntryID_W = TearOff.LogEntryID;
                    }
                    return _LogEntryID_W;
                }
            }

            public WhereParameter LogEntryTypeID
            {
                get
                {
                    if (_LogEntryTypeID_W == null)
                    {
                        _LogEntryTypeID_W = TearOff.LogEntryTypeID;
                    }
                    return _LogEntryTypeID_W;
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

            public WhereParameter PublicDescription
            {
                get
                {
                    if (_PublicDescription_W == null)
                    {
                        _PublicDescription_W = TearOff.PublicDescription;
                    }
                    return _PublicDescription_W;
                }
            }

            public WhereParameter PublicHeader
            {
                get
                {
                    if (_PublicHeader_W == null)
                    {
                        _PublicHeader_W = TearOff.PublicHeader;
                    }
                    return _PublicHeader_W;
                }
            }

            public WhereParameter TimeStamp
            {
                get
                {
                    if (_TimeStamp_W == null)
                    {
                        _TimeStamp_W = TearOff.TimeStamp;
                    }
                    return _TimeStamp_W;
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

            public WhereParameter LogEntryStatusID
            {
                get
                {
                    if (_LogEntryStatusID_W == null)
                    {
                        _LogEntryStatusID_W = TearOff.LogEntryStatusID;
                    }
                    return _LogEntryStatusID_W;
                }
            }

            public WhereParameter IconPath
            {
                get
                {
                    if (_IconPath_W == null)
                    {
                        _IconPath_W = TearOff.IconPath;
                    }
                    return _IconPath_W;
                }
            }

            public WhereParameter TypeName
            {
                get
                {
                    if (_TypeName_W == null)
                    {
                        _TypeName_W = TearOff.TypeName;
                    }
                    return _TypeName_W;
                }
            }

            public WhereParameter ImpactLevelID
            {
                get
                {
                    if (_ImpactLevelID_W == null)
                    {
                        _ImpactLevelID_W = TearOff.ImpactLevelID;
                    }
                    return _ImpactLevelID_W;
                }
            }

            public WhereParameter ProjectSectionID
            {
                get
                {
                    if (_ProjectSectionID_W == null)
                    {
                        _ProjectSectionID_W = TearOff.ProjectSectionID;
                    }
                    return _ProjectSectionID_W;
                }
            }

            public WhereParameter ProjectSectionName
            {
                get
                {
                    if (_ProjectSectionName_W == null)
                    {
                        _ProjectSectionName_W = TearOff.ProjectSectionName;
                    }
                    return _ProjectSectionName_W;
                }
            }

            private WhereParameter _Description_W = null;
            private WhereParameter _Header_W = null;
            private WhereParameter _LogEntryID_W = null;
            private WhereParameter _LogEntryTypeID_W = null;
            private WhereParameter _ProjectID_W = null;
            private WhereParameter _PublicDescription_W = null;
            private WhereParameter _PublicHeader_W = null;
            private WhereParameter _TimeStamp_W = null;
            private WhereParameter _UpdateID_W = null;
            private WhereParameter _LogEntryStatusID_W = null;
            private WhereParameter _IconPath_W = null;
            private WhereParameter _TypeName_W = null;
            private WhereParameter _ImpactLevelID_W = null;
            private WhereParameter _ProjectSectionID_W = null;
            private WhereParameter _ProjectSectionName_W = null;

            public void WhereClauseReset()
            {
                _Description_W = null;
                _Header_W = null;
                _LogEntryID_W = null;
                _LogEntryTypeID_W = null;
                _ProjectID_W = null;
                _PublicDescription_W = null;
                _PublicHeader_W = null;
                _TimeStamp_W = null;
                _UpdateID_W = null;
                _LogEntryStatusID_W = null;
                _IconPath_W = null;
                _TypeName_W = null;
                _ImpactLevelID_W = null;
                _ProjectSectionID_W = null;
                _ProjectSectionName_W = null;

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


                public AggregateParameter Description
                {
                    get
                    {
                        AggregateParameter aggregate = new AggregateParameter(ColumnNames.Description, Parameters.Description);
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

                public AggregateParameter LogEntryID
                {
                    get
                    {
                        AggregateParameter aggregate = new AggregateParameter(ColumnNames.LogEntryID, Parameters.LogEntryID);
                        this._clause._entity.Query.AddAggregateParameter(aggregate);
                        return aggregate;
                    }
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

                public AggregateParameter ProjectID
                {
                    get
                    {
                        AggregateParameter aggregate = new AggregateParameter(ColumnNames.ProjectID, Parameters.ProjectID);
                        this._clause._entity.Query.AddAggregateParameter(aggregate);
                        return aggregate;
                    }
                }

                public AggregateParameter PublicDescription
                {
                    get
                    {
                        AggregateParameter aggregate = new AggregateParameter(ColumnNames.PublicDescription, Parameters.PublicDescription);
                        this._clause._entity.Query.AddAggregateParameter(aggregate);
                        return aggregate;
                    }
                }

                public AggregateParameter PublicHeader
                {
                    get
                    {
                        AggregateParameter aggregate = new AggregateParameter(ColumnNames.PublicHeader, Parameters.PublicHeader);
                        this._clause._entity.Query.AddAggregateParameter(aggregate);
                        return aggregate;
                    }
                }

                public AggregateParameter TimeStamp
                {
                    get
                    {
                        AggregateParameter aggregate = new AggregateParameter(ColumnNames.TimeStamp, Parameters.TimeStamp);
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

                public AggregateParameter LogEntryStatusID
                {
                    get
                    {
                        AggregateParameter aggregate = new AggregateParameter(ColumnNames.LogEntryStatusID, Parameters.LogEntryStatusID);
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

                public AggregateParameter TypeName
                {
                    get
                    {
                        AggregateParameter aggregate = new AggregateParameter(ColumnNames.TypeName, Parameters.TypeName);
                        this._clause._entity.Query.AddAggregateParameter(aggregate);
                        return aggregate;
                    }
                }

                public AggregateParameter ImpactLevelID
                {
                    get
                    {
                        AggregateParameter aggregate = new AggregateParameter(ColumnNames.ImpactLevelID, Parameters.ImpactLevelID);
                        this._clause._entity.Query.AddAggregateParameter(aggregate);
                        return aggregate;
                    }
                }

                public AggregateParameter ProjectSectionID
                {
                    get
                    {
                        AggregateParameter aggregate = new AggregateParameter(ColumnNames.ProjectSectionID, Parameters.ProjectSectionID);
                        this._clause._entity.Query.AddAggregateParameter(aggregate);
                        return aggregate;
                    }
                }

                public AggregateParameter ProjectSectionName
                {
                    get
                    {
                        AggregateParameter aggregate = new AggregateParameter(ColumnNames.ProjectSectionName, Parameters.ProjectSectionName);
                        this._clause._entity.Query.AddAggregateParameter(aggregate);
                        return aggregate;
                    }
                }


                private AggregateClause _clause;
            }
            #endregion

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

            public AggregateParameter LogEntryID
            {
                get
                {
                    if (_LogEntryID_W == null)
                    {
                        _LogEntryID_W = TearOff.LogEntryID;
                    }
                    return _LogEntryID_W;
                }
            }

            public AggregateParameter LogEntryTypeID
            {
                get
                {
                    if (_LogEntryTypeID_W == null)
                    {
                        _LogEntryTypeID_W = TearOff.LogEntryTypeID;
                    }
                    return _LogEntryTypeID_W;
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

            public AggregateParameter PublicDescription
            {
                get
                {
                    if (_PublicDescription_W == null)
                    {
                        _PublicDescription_W = TearOff.PublicDescription;
                    }
                    return _PublicDescription_W;
                }
            }

            public AggregateParameter PublicHeader
            {
                get
                {
                    if (_PublicHeader_W == null)
                    {
                        _PublicHeader_W = TearOff.PublicHeader;
                    }
                    return _PublicHeader_W;
                }
            }

            public AggregateParameter TimeStamp
            {
                get
                {
                    if (_TimeStamp_W == null)
                    {
                        _TimeStamp_W = TearOff.TimeStamp;
                    }
                    return _TimeStamp_W;
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

            public AggregateParameter LogEntryStatusID
            {
                get
                {
                    if (_LogEntryStatusID_W == null)
                    {
                        _LogEntryStatusID_W = TearOff.LogEntryStatusID;
                    }
                    return _LogEntryStatusID_W;
                }
            }

            public AggregateParameter IconPath
            {
                get
                {
                    if (_IconPath_W == null)
                    {
                        _IconPath_W = TearOff.IconPath;
                    }
                    return _IconPath_W;
                }
            }

            public AggregateParameter TypeName
            {
                get
                {
                    if (_TypeName_W == null)
                    {
                        _TypeName_W = TearOff.TypeName;
                    }
                    return _TypeName_W;
                }
            }

            public AggregateParameter ImpactLevelID
            {
                get
                {
                    if (_ImpactLevelID_W == null)
                    {
                        _ImpactLevelID_W = TearOff.ImpactLevelID;
                    }
                    return _ImpactLevelID_W;
                }
            }

            public AggregateParameter ProjectSectionID
            {
                get
                {
                    if (_ProjectSectionID_W == null)
                    {
                        _ProjectSectionID_W = TearOff.ProjectSectionID;
                    }
                    return _ProjectSectionID_W;
                }
            }

            public AggregateParameter ProjectSectionName
            {
                get
                {
                    if (_ProjectSectionName_W == null)
                    {
                        _ProjectSectionName_W = TearOff.ProjectSectionName;
                    }
                    return _ProjectSectionName_W;
                }
            }

            private AggregateParameter _Description_W = null;
            private AggregateParameter _Header_W = null;
            private AggregateParameter _LogEntryID_W = null;
            private AggregateParameter _LogEntryTypeID_W = null;
            private AggregateParameter _ProjectID_W = null;
            private AggregateParameter _PublicDescription_W = null;
            private AggregateParameter _PublicHeader_W = null;
            private AggregateParameter _TimeStamp_W = null;
            private AggregateParameter _UpdateID_W = null;
            private AggregateParameter _LogEntryStatusID_W = null;
            private AggregateParameter _IconPath_W = null;
            private AggregateParameter _TypeName_W = null;
            private AggregateParameter _ImpactLevelID_W = null;
            private AggregateParameter _ProjectSectionID_W = null;
            private AggregateParameter _ProjectSectionName_W = null;

            public void AggregateClauseReset()
            {
                _Description_W = null;
                _Header_W = null;
                _LogEntryID_W = null;
                _LogEntryTypeID_W = null;
                _ProjectID_W = null;
                _PublicDescription_W = null;
                _PublicHeader_W = null;
                _TimeStamp_W = null;
                _UpdateID_W = null;
                _LogEntryStatusID_W = null;
                _IconPath_W = null;
                _TypeName_W = null;
                _ImpactLevelID_W = null;
                _ProjectSectionID_W = null;
                _ProjectSectionName_W = null;

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
