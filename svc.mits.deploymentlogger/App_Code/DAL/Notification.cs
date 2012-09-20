using System;
using DL_DAL.Client;
using MyGeneration.dOOdads;
using System.Data;

namespace DL_DAL.DAL.Client
{
    public class Notification : _Notification
    {
        public Notification()
        {

        }

        public DataView LoadNotificationNotComplete()
        {
            this.Where.Complete.Value = false;
            this.Where.Complete.Operator = WhereParameter.Operand.Equal;

            this.Query.Load();

            return this.DefaultView;
        }
    }
}
