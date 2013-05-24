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

        public Product Select() 
        {
            try
            {
                if (this.productForAccess == null || this.productForAccess.ProductId == 0)
                    throw new NullReferenceException("Product access object can't be null");

                Product productReturn = new Product();
                SqlCommand command = new SqlCommand();
                command.CommandText = "ViewProduct";
                command.Connection = this.connectionForAccess;
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.Clear();
                command.Parameters.AddWithValue("@product_id", Int32.Parse(this.productForAccess.ProductId.ToString()));
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
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
                    
                }
                reader.Close();
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