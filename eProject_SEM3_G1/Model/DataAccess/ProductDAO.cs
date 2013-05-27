using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using eProject_SEM3_G1.Utilities.DatabaseConnection;
using System.Data;

namespace eProject_SEM3_G1.Model.DataAccess
{
    public class ProductDAO : DataAccessObject
    {
        private Product productForAccess;

        public ProductDAO(Product product) :base()
        {
            this.productForAccess = product;
        }

        public override void Delete()
        {
            SqlCommand command = new SqlCommand();
            command.Connection = this.connectionForAccess;
            command.CommandText = "DeleteProduct";
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@product_id", this.productForAccess.ProductId);
            command.ExecuteNonQuery();
        }
        public override void Update()
        {
            SqlCommand command = new SqlCommand();
            command.Connection = this.connectionForAccess;
            command.CommandText = "UpdateProduct";
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@bs_product_id", this.productForAccess.ProductId);
            command.Parameters.AddWithValue("@bs_product_name", this.productForAccess.ProductName);
            command.Parameters.AddWithValue("@bs_product_price", this.productForAccess.ProductPrice);
            command.Parameters.AddWithValue("@bs_product_description", this.productForAccess.ProductDescription);
            command.Parameters.AddWithValue("@bs_product_discount", this.productForAccess.ProductDiscount);
            command.Parameters.AddWithValue("@bs_product_image_url", this.productForAccess.ProductImageURL);
            command.Parameters.AddWithValue("@bs_product_in_stock", this.productForAccess.ProductInStock);
            command.ExecuteNonQuery();                   
          

        }
        public override void Add()
        {
             
            SqlDataAdapter objAdapter = new SqlDataAdapter("AddProduct", this.connectionForAccess);
            objAdapter.InsertCommand = new SqlCommand();
            objAdapter.InsertCommand.CommandText = "AddProduct";
            objAdapter.InsertCommand.Connection = this.connectionForAccess;
            objAdapter.InsertCommand.CommandType = System.Data.CommandType.StoredProcedure;

            SqlParameter objParam1 = new SqlParameter("@bs_product_name", SqlDbType.VarChar);
            objParam1.Direction = ParameterDirection.Input;
            objParam1.Value = this.productForAccess.ProductName;
            objAdapter.InsertCommand.Parameters.Add(objParam1);

            SqlParameter objParam2 = new SqlParameter("@bs_product_price", SqlDbType.Float);
            objParam2.Direction = ParameterDirection.Input;
            objParam2.Value = this.productForAccess.ProductPrice;
            objAdapter.InsertCommand.Parameters.Add(objParam2);

            SqlParameter objParam3 = new SqlParameter("@bs_product_description", SqlDbType.Text);
            objParam3.Direction = ParameterDirection.Input;
            objParam3.Value = this.productForAccess.ProductDescription;
            objAdapter.InsertCommand.Parameters.Add(objParam3);

            SqlParameter objParam4 = new SqlParameter("@bs_product_discount", SqlDbType.Int);
            objParam4.Direction = ParameterDirection.Input;
            objParam4.Value = this.productForAccess.ProductDiscount;
            objAdapter.InsertCommand.Parameters.Add(objParam4);

            SqlParameter objParam5 = new SqlParameter("@bs_product_image_url", SqlDbType.VarChar);
            objParam5.Direction = ParameterDirection.Input;
            objParam5.Value = this.productForAccess.ProductImageURL;
            objAdapter.InsertCommand.Parameters.Add(objParam5);

            SqlParameter objParam6 = new SqlParameter("@bs_product_in_stock", SqlDbType.Int);
            objParam6.Direction = ParameterDirection.Input;
            objParam6.Value = this.productForAccess.ProductInStock;
            objAdapter.InsertCommand.Parameters.Add(objParam6);

            objAdapter.InsertCommand.ExecuteNonQuery();
            
        }

        public static HashSet<Product> GetHotProduct() 
        {
            try
            {
                HashSet<Product> hsReturn = new HashSet<Product>(new ProductComparer());
                return hsReturn;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static Product GetProductByProductId(int productId) 
        {
            try
            {
                Product productReturn = null;
                SqlCommand command = new SqlCommand();
                command.CommandText = "ViewProduct";
                command.Connection = DatabaseFactory.GetConnection(DatabaseFactory.SQL_TYPE_MSSQL).GetConnection();
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.Clear();
                command.Parameters.AddWithValue("@product_id", Int32.Parse(productId.ToString()));
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    productReturn = new Product();
                    productReturn.ProductId = reader.GetInt32(0);
                    productReturn.ProductName = reader.GetString(1);
                    productReturn.ProductPrice = float.Parse(reader.GetValue(2).ToString());
                    System.Data.SqlTypes.SqlString desc = (System.Data.SqlTypes.SqlString)reader.GetSqlValue(3);
                    if (desc.IsNull) productReturn.ProductDescription = "N/A";
                    else productReturn.ProductDescription = String.Format(desc.Value);
                    System.Data.SqlTypes.SqlInt32 disc = (System.Data.SqlTypes.SqlInt32)reader.GetSqlValue(4);

                    if (disc.IsNull) productReturn.ProductDiscount = 0;
                    else productReturn.ProductDiscount = disc.Value;

                    productReturn.ProductImageURL = reader.GetString(5);
                    productReturn.ProductInStock = reader.GetInt32(6);
                    reader.Close();
                }
                return productReturn;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Dictionary<string, string> GetProductInfo()
        {
            try
            {
                if (this.productForAccess == null || this.productForAccess.ProductId == 0)
                    throw new NullReferenceException("Product access object can't be null");

                Dictionary<string, string> dictionaryReturn = new Dictionary<string, string>();                
                SqlCommand command= new SqlCommand();
                command.Connection = this.connectionForAccess;
                command.CommandType= System.Data.CommandType.StoredProcedure;
                command.CommandText = "GetProductInfo";
                command.Parameters.AddWithValue("@product_id", this.productForAccess.ProductId);
                SqlDataReader reader= command.ExecuteReader();
                while(reader.Read())
                {
                    dictionaryReturn.Add(reader.GetValue(0).ToString(), reader.GetValue(1).ToString());
                }
                reader.Close();
                return dictionaryReturn;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<Product> GetRelatedProduct()
        {
            try
            {
                if (this.productForAccess == null || this.productForAccess.ProductId == 0)
                    throw new NullReferenceException("Product access object can't be null");

                List<Product> listProductReturn = new List<Product>();                
                SqlCommand command = new SqlCommand();
                command.Connection = this.connectionForAccess;
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.CommandText = "GetRelatedProductInSubcategory";
                command.Parameters.AddWithValue("@product_id", this.productForAccess.ProductId);
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    Product product = new Product();
                    product.ProductId = reader.GetInt32(0);
                    product.ProductName= reader.GetString(1);                               
                    product.ProductImageURL= reader.GetString(5);
                    product.ProductPrice = float.Parse(reader.GetValue(2).ToString());
                    listProductReturn.Add(product);
                }
                reader.Close();
                return listProductReturn;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}