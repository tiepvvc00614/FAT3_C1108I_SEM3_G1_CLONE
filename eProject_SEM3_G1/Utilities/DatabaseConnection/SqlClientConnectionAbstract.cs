using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace eProject_SEM3_G1.Utilities.DatabaseConnection
{
    public abstract class SqlClientConnectionAbstract
    {
        public SqlConnection GetConnection();

    }
}