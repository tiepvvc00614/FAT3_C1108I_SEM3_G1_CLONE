using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using eProject_SEM3_G1.Utilities.DatabaseConnection;

namespace eProject_SEM3_G1.Model.DataAccess
{
    public class CategoryDAO : DataAccessObject
    {
        public override void Delete()
        {

        }
        public override void Update()
        {

        }
        public override void Add()
        {

        }

        public static HashSet<Category> GetAllCategory() {
            
            SqlConnection con = DatabaseFactory.GetConnection(DatabaseFactory.SQL_TYPE_MSSQL).GetConnection();
            SqlCommand command = new SqlCommand();
            command.CommandText = "LoadCategories";
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Connection = con;
            SqlDataReader reader = command.ExecuteReader();
            HashSet<Category> hsReturn = new HashSet<Category>(new CategoryComparer());

            Category tmpCate = new Category();

            while (reader.Read())
            {
                
                Category cateTmp = new Category();
                cateTmp.CategoryId = reader.GetInt32(0);
                cateTmp.CategoryName = reader.GetString(1);
                if (!tmpCate.Equals(cateTmp))
                {
                    tmpCate = cateTmp;
                    hsReturn.Add(cateTmp);
                }
                HashSet<Category> listSubCate = tmpCate.ChildrenCategory;
                Category subCatTmp1 = new Category();
                subCatTmp1.CategoryId = reader.GetInt32(2);
                subCatTmp1.CategoryName = reader.GetString(3);

                listSubCate.Add(subCatTmp1)

                
            }

            return ;
        }
    }
}