using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using eProject_SEM3_G1.Utilities.DatabaseConnection;

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

        }
        public override void Update()
        {

        }
        public override void Add()
        {

        }

        public static Product Select(int productId) 
        {
            try
            {
                Product productReturn = new Product();
                SqlConnection con = DatabaseFactory.GetConnection(DatabaseFactory.SQL_TYPE_MSSQL).GetConnection();
                SqlCommand command = new SqlCommand();
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@product_id", productId);
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    productReturn.ProductName = reader.GetString(1);
                    productReturn.ProductPrice = reader.GetFloat(2);
                    productReturn.ProductDescription = reader.GetString(3);
                    productReturn.ProductDiscount = reader.GetInt32(4);
                    productReturn.ProductImageURL = reader.GetString(5);
                    productReturn.ProductInStock = reader.GetInt32(6);
                }
                productReturn.ProductInfos = GetProductInfo(productId);
                productReturn.RelatedProduct = GetRelatedProduct(productId);

                return productReturn;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private static Dictionary<string, string> GetProductInfo(int productId)
        {
            try
            {
                SqlConnection con = DatabaseFactory.GetConnection(DatabaseFactory.SQL_TYPE_MSSQL).GetConnection();
                Dictionary<string, string> dictionaryReturn = new Dictionary<string, string>();                
                SqlCommand command= new SqlCommand();
                command.CommandType= System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@product_id",productId);
                SqlDataReader reader= command.ExecuteReader();
                if(reader.Read())
                {
                    dictionaryReturn.Add(reader.GetString(0), reader.GetString(1));
                }
                return dictionaryReturn;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private static List<Product> GetRelatedProduct(int productId)
        {
            try
            {
                SqlConnection con = DatabaseFactory.GetConnection(DatabaseFactory.SQL_TYPE_MSSQL).GetConnection();
                List<Product> listProductReturn = new List<Product>();                
                SqlCommand command = new SqlCommand();
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@product_id", productId);
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    Product product = new Product();
                    product.ProductId = reader.GetInt32(0);
                    product.ProductName= reader.GetString(1);
                    product.ProductPrice= reader.GetFloat(2);
                    product.ProductDescription= reader.GetString(3);
                    product.ProductDiscount = reader.GetInt32(4);
                    product.ProductImageURL= reader.GetString(5);
                    product.ProductInStock = reader.GetInt32(6);
                    listProductReturn.Add(product);
                }
                return listProductReturn;
            }
            catch (Exception ex)
            {
                throw ex;
            }
      
        }
    }
}