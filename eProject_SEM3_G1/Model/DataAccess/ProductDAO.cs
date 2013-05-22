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
                return null;
            }
            catch (Exception ex)
            {
                throw ex;
            }
      
        }
    }
}