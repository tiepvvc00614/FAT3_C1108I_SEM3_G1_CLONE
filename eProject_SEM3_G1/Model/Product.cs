using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace eProject_SEM3_G1.Model
{
    public class Product
    {
        private int productId;
        private string productName;
        private float price;
        private string description;
        private string imageURL;
        private int inStock;
        private Category inCategory;

        private Dictionary<string, string> productInfos;
    }
}