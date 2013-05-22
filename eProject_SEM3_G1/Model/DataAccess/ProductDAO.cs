using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace eProject_SEM3_G1.Model.DataAccess
{
    public class ProductDAO : DataAccessObject
    {
        private Product productForAccess;

        public ProductDAO(Product product)
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

                productReturn.ProductInfos = GetProductInfo(productId);
                productReturn.RelatedProduct = GetRelatedProduct(productId);

                return null;
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
                return null;
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
                return null;
            }
            catch (Exception ex)
            {
                throw ex;
            }
      
        }
    }
}