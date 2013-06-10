using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

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
        public static int DataUpdate(System.Data.CommandType cmType, string cmText, SqlConnection con, Dictionary<string, object> listKV = null)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = cmType;
                cmd.CommandText = cmText;
                foreach (KeyValuePair<string, object> item in listKV)
                {
                    cmd.Parameters.AddWithValue(item.Key, item.Value);
                }
                int result = cmd.ExecuteNonQuery();
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        internal static SqlDataReader DataReader(System.Data.CommandType commandType, string p, Dictionary<string, object> listKV, SqlConnection sqlConnection)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = sqlConnection;
                cmd.CommandType = commandType;
                cmd.CommandText = p;
                foreach (KeyValuePair<string, object> item in listKV)
                {
                    cmd.Parameters.AddWithValue(item.Key, item.Value);
                }
                SqlDataReader reader = cmd.ExecuteReader();
                return reader;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}