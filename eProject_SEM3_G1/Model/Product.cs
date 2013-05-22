using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using eProject_SEM3_G1.Model.DataAccess;

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
        private List<Product> relatedProduct;
        private int discount;
        private ProductDAO productDataAccess;

        

        private Dictionary<string, string> productInfos;

        public int ProductDiscount
        {
            get
            {
                return discount;
            }
            set
            {
                if (discount != value) discount = value;
            }
        }
        public int ProductId
        {
            get
            {
                return productId;
            }
            set
            {
                if (productId != value) productId = value;
            }
        }

        public string ProductName
        {
            get
            {
                return productName;
            }
            set
            {
                if (productName != value) productName = value;
            }
        }

        public float ProductPrice
        {
            get
            {
                return price;
            }
            set
            {
                if (price != value) price = value;
            }
        }

        public string ProductDescription
        {
            get
            {
                return description;
            }
            set
            {
                if (description != value) description = value;
            }
        }
        public string ProductImageURL
        {
            get
            {
                return imageURL;
            }
            set
            {
                if (imageURL != value) imageURL = value;
            }
        }

        public int ProductInStock
        {
            get
            {
                return inStock;
            }
            set
            {
                inStock = value;
            }
        }

        public Category InCategory
        {
            get
            {
                return inCategory;
            }
            set
            {
                if (inCategory != value) inCategory = value;
            }
        }

        public Dictionary<string, string> ProductInfos
        {
            get 
            {
                return productInfos;
            }
            set
            {
                productInfos = value;
            }
        }

        public List<Product> RelatedProduct
        {
            get
            {
                return relatedProduct;
            }
            set
            {
                relatedProduct = value;
            }
        }
    }
}