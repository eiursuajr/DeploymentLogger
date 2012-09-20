﻿
// Generated by MyGeneration Version # (1.1.5.0)

using System;
using DL_DAL.Client;
using System.Data;

namespace DL_WEB.DAL.Client
{
    public class Role : _Role
    {
        #region Cached Roles

        protected DataTable m_dtRoles = null;

        public DataTable Roles
        {
            get
            {
                if (null == m_dtRoles)
                {
                    ReloadCache();
                }

                return m_dtRoles;
            }
        }

        #endregion

        #region Instance

        protected static Role m_Role = null;

        public static Role Instance
        {
            get
            {
                if (null == m_Role)
                {
                    m_Role = new Role();
                }
                return m_Role;
            }
        }

        #endregion

        #region Constructor

        public Role()
        {
        }

        #endregion

        #region Public Methods
        
        public DataView LoadAllRole()
        {
            this.LoadAll();
            return this.DefaultView;
        }

        public DataView LoadRoleByPrimaryKey(int RoleID)
        {
            if (RoleID > 0)
                base.LoadByPrimaryKey(RoleID);
            else
            {
                base.AddNew();
                base.RoleID = 0;
            }
            return base.DefaultView;
        }

        public void Delete(int RoleID)
        {
            base.RoleID = RoleID;
            base.MarkAsDeleted();
            base.Save();
        }

        public int Update(int RoleID, string Name, string Description)
        {
            this.LoadRoleByPrimaryKey(RoleID);

            base.Name = Name;
            base.Description = Description == null ? "" : Description;
            base.Save();

            return base.RoleID;
        }

        #endregion

        #region Private Methods

        protected void ReloadCache()
        {
            this.LoadAll();
            m_dtRoles = this.DefaultView.Table;
        }

        #endregion
    }
}