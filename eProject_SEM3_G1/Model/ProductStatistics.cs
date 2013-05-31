using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace eProject_SEM3_G1.Model
{
    public class ProductStatistics
    {
        private int productId;
        private string productName;
        private int countOrder;


        public int ProductId
        {
            get { return productId; }
            set { productId = value; }
        }
       

        public string ProductName
        {
            get { return productName; }
            set { productName = value; }
        }
        

        public int CountOrder
        {
            get { return countOrder; }
            set { countOrder = value; }
        }
    }
}