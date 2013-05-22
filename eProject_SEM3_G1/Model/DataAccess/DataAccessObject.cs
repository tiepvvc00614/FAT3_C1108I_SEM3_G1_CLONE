using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using eProject_SEM3_G1.Utilities.DatabaseConnection;

namespace eProject_SEM3_G1.Model.DataAccess
{
    public abstract class DataAccessObject
    {
        private SqlConnection connectionForAccess;
        public abstract void Delete();
        public abstract void Update();
        public abstract void Add();

        public DataAccessObject() 
        {
            
            connectionForAccess = DatabaseFactory.GetConnection(DatabaseFactory.SQL_TYPE_MSSQL).GetConnection();
        }
    }
}