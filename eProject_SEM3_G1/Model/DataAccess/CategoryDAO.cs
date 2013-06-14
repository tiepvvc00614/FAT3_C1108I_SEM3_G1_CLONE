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

        public static List<Category> GetAllCategory()
        {
            try
            {
                SqlDataReader reader = DatabaseFactory.DataReader(System.Data.CommandType.StoredProcedure, "GetAllCategory", new Dictionary<string, object>(), DatabaseFactory.GetConnection(DatabaseFactory.SQL_TYPE_MSSQL).GetConnection());

                List<Category> listReturn = new List<Category>();

                while (reader.Read()) {
                    Category cateTemp = new Category();
                    cateTemp.CategoryId = reader.GetInt32(0);
                    cateTemp.CategoryName = reader.GetString(1);
                    listReturn.Add(cateTemp);
                }

                reader.Close();

                return listReturn;

            }
            catch (Exception ex)
            {
                
                throw ex;
            }
        }
 
    }
}