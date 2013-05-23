using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace eProject_SEM3_G1.Utilities.DatabaseConnection
{
    public class MSSQLConnection : SqlClientConnectionAbstract
    {
        private SqlConnection con;
        public override SqlConnection GetConnection()
        {
            string cnnstr = WebConfigurationManager.ConnectionStrings["MSSQLConnectionString"].ToString();
            if (con == null)
            {
                con = new SqlConnection(cnnstr);
                con.Open();
            }

            return con;
        }
    }
}