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

        public Product()
        {
            this.productDataAccess = new ProductDAO(this);
        }

        public Product(int productIdz)
        {
            this.productId = productIdz;
            this.productDataAccess = new ProductDAO(this);

            Product productTemp = this.productDataAccess.Select();


            this.ProductId = productTemp.productId;
            this.ProductName = productTemp.productName;
            this.ProductPrice = productTemp.price;
            this.ProductDescription = productTemp.description;
            this.ProductImageURL = productTemp.imageURL;
            this.ProductDiscount = productTemp.discount;
            this.ProductInStock = productTemp.inStock;
        }

        private Dictionary<string, string> productInfos;

        public int ProductDiscount
        {
            get
            {
                return discount;
            }
            set
            {
                discount = value;
            }
        }
        public int ProductId
        {
            get
            {
                return this.productId;
            }
            set
            {
                productId = value;
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
                return this.inStock;
            }
            set
            {
                this.inStock = value;
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
                if (productInfos == null)
                {
                    productInfos = this.productDataAccess.GetProductInfo();
                }
                return productInfos;
            }
        }

        public List<Product> RelatedProduct
        {
            get
            {
                if (relatedProduct == null)
                {
                    relatedProduct = productDataAccess.GetRelatedProduct();
                }
                return relatedProduct;
            }
        }

        public override string ToString()
        {
            return String.Format("Product ID: %i | Product Name: %s | Product Price: %f | Product Image URL: %s | In Stock: %i | In Category: %s", this.productId, this.productName, this.price, this.imageURL, this.inStock, this.inCategory.ToString());
        }
    }

    public class ProductComparer : IEqualityComparer<Product>
    {
        public bool Equals(Product one, Product two)
        {
            return one.ProductId == two.ProductId;
        }

        public int GetHashCode(Product pro)
        {
            return pro.ProductId.GetHashCode();
        }
    }


}