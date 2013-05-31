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

        public static Dictionary<string, Category> GetAllCategory()
        {
            SqlConnection con = DatabaseFactory.GetConnection(DatabaseFactory.SQL_TYPE_MSSQL).GetConnection();
            SqlCommand command = new SqlCommand();
            command.CommandText = "LoadCategories";
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Connection = con;
            SqlDataReader reader = command.ExecuteReader();
            Dictionary<string, Category> hsReturn = new Dictionary<string, Category>();

            Category tmpCate = new Category();

            while (reader.Read())
            {

                Category parentNode = new Category();
                Category firstChildNode = null;
                Category secondChildNode = null;

                parentNode.CategoryId = reader.GetInt32(0);
                parentNode.CategoryName = reader.GetString(1);

                System.Data.SqlTypes.SqlInt32 firstChildVal = (System.Data.SqlTypes.SqlInt32)reader.GetSqlValue(2);
                if (!firstChildVal.IsNull)
                {
                    firstChildNode = new Category();
                    firstChildNode.CategoryId = reader.GetInt32(2);
                    firstChildNode.CategoryName = reader.GetString(3);
                }

                System.Data.SqlTypes.SqlInt32 secondChildVal = (System.Data.SqlTypes.SqlInt32)reader.GetSqlValue(4);
                if (!secondChildVal.IsNull)
                {

                    secondChildNode = new Category();
                    secondChildNode.CategoryId = reader.GetInt32(4);
                    secondChildNode.CategoryName = reader.GetString(5);
                }

                List<Category> listChildNode = new List<Category>();

                if (firstChildNode != null)
                {
                    if (secondChildNode != null)
                    {
                        List<Category> listChildSecond = new List<Category>();
                        listChildSecond.Add(secondChildNode);
                        firstChildNode.ChildrenCategory = listChildSecond;
                    }
                    firstChildNode.ChildrenCategory = listChildNode;
                    listChildNode.Add(firstChildNode);
                }


                parentNode.ChildrenCategory = listChildNode;

                FillDictionary(hsReturn, parentNode);
                
            }

            return hsReturn ;
        }
        private static void FillDictionary(Dictionary<string, Category> dictionary, Category node)
        {
            if (dictionary.ContainsKey(node.CategoryName))
            {
                return;
            }
            dictionary.Add(node.CategoryName, node);

            foreach (Category child in node.ChildrenCategory)
            {
                FillDictionary(dictionary, child);
            }
        }
    }
}