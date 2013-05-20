using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace eProject_SEM3_G1.Utilities.DatabaseConnection
{
    public class DatabaseFactory
    {
        public static string SQL_TYPE_MSSQL = @"MSSQL";
        public static string SQL_TYPE_ORACLE = @"ORACLE";
        public static string SQL_TYPE_MYSQL = @"MYSQL";

        private static SqlClientConnectionAbstract con;

        public static SqlClientConnectionAbstract GetConnection(string typeConnection)
        {
            if (typeConnection == SQL_TYPE_MSSQL)
            {
                con = new MSSQLConnection();
            }

            return con;
        }
    }
}