using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace eProject_SEM3_G1.Utilities.DatabaseConnection
{
    public class MSSQLConnection : SqlClientConnectionAbstract
    {
        private static SqlConnection con;
        public SqlConnection GetConnection()
        {

            return new SqlConnection("");
        }
    }
}