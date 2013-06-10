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
        private Category categoryForAccess;
        public CategoryDAO(Category category) : base()
        {
            this.categoryForAccess = category;
        }
        public override void Delete()
        {
            try
            {
                SqlCommand command = new SqlCommand();
                command.Connection = this.connectionForAccess;
                command.CommandText = "DeleteCategory";
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@category_id", this.categoryForAccess.CategoryId);
                int result=command.ExecuteNonQuery();
                if (result == 0 || result > 1)
                    throw new Exception(" Category ID is not exits");
            }
            catch (Exception ex)
            {
                
                throw ex;
            }
            
        }
        public override void Update()
        {
            
        }
        public override void Add()
        {
            
        }
        public void Update(int parentId)
        {
            try
            {
                SqlConnection con = DatabaseFactory.GetConnection(DatabaseFactory.SQL_TYPE_MSSQL).GetConnection();
                SqlCommand command = new SqlCommand();
                command.Connection = con;
                command.CommandText = "UpdateCategory";
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@Category_Name", this.categoryForAccess.CategoryName);
                command.Parameters.AddWithValue("@Parent_ID", parentId);
                int result=command.ExecuteNonQuery();
                if (result == 0 || result > 1)
                    throw new Exception("Category ID is not exits");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public void Add(int parentId)
        {
            try
            {
                if (this.categoryForAccess.CategoryId == 0)
                    throw new Exception("Category is not exits");
                if (this.categoryForAccess.CategoryName == null || this.categoryForAccess.CategoryName == "")
                    throw new Exception("Category Name is not exits");
                SqlCommand command = new SqlCommand();
                command.Connection = this.connectionForAccess;
                command.CommandText = "AddCategory";
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@Category_Name", this.categoryForAccess.CategoryName);
                command.Parameters.AddWithValue("@Parent_Id",parentId);
                command.ExecuteNonQuery();

            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
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