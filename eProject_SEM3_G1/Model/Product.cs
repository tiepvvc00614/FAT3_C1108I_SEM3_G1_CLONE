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

        internal Product() { productDataAccess = new ProductDAO(this); }
        private Dictionary<string, string> productInfos;

        public static Product GetProduct(int productId)
        {
            return ProductDAO.GetProductByProductId(productId);
        }

        public static List<Product> SearchProduct(string keyword, int categoryId = 0)
        {
            if (categoryId > 0)
                return ProductDAO.SearchProduct(keyword, categoryId);
            else
                return ProductDAO.SearchProduct(keyword);
        }

        public void Add()
        {
            this.productDataAccess.Add();
        }
        public void Delete()
        {
            this.productDataAccess.Delete();
        }
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

        public string ToJSONString() {
            try
            {
                Dictionary<string, string> productInfo = this.ProductInfos;
                List<Product> relatedProduct = this.RelatedProduct;
                string jsonStr = "{";
                jsonStr += "\"productName\": \""+ this.ProductName +"\",";
                jsonStr += "\"productId\": \"" + this.ProductId + "\",";
                jsonStr += "\"productImageURL\": \"" + this.ProductImageURL + "\",";
                jsonStr += "\"inStock\": \"" + this.inStock + "\",";
                jsonStr += "\"productDescription\": \"" + this.ProductDescription + "\",";
                jsonStr += "\"productId\": \"" + this.ProductId + "\",";
                jsonStr += "\"productPrice\": \"" + this.ProductPrice + "\",";


                List<string> listKeyProductInfo = productInfo.Keys.ToList<string>();
                List<string> listValueProductInfo = productInfo.Values.ToList<string>();

                jsonStr += "\"productInfos\": [";
                for (int i = 0; i < listKeyProductInfo.Count; i++)
                {
                    jsonStr += "{";
                    jsonStr += "\"key\":\"" + listKeyProductInfo[i].ToString() + "\",";
                    jsonStr += "\"value\":\"" + listValueProductInfo[i].ToString() + "\"";
                    jsonStr += "}";

                    if (i < listKeyProductInfo.Count - 1)
                    {
                        jsonStr += ",";
                    }
                }
                jsonStr += "],";

                jsonStr += "\"relatedProduct\": [";
                for (int i = 0; i < relatedProduct.Count; i++)
                {
                    Product temp = relatedProduct[i];
                    jsonStr += "{";
                    jsonStr += "\"productName\": \"" + temp.ProductName + "\",";
                    jsonStr += "\"productId\": \"" + temp.ProductId + "\",";
                    jsonStr += "\"productImageURL\": \"" + temp.ProductImageURL + "\",";
                    jsonStr += "\"inStock\": \"" + temp.inStock + "\",";
                    jsonStr += "\"productDescription\": \"" + temp.ProductDescription + "\",";
                    jsonStr += "\"productId\": \"" + temp.ProductId + "\",";
                    jsonStr += "\"productPrice\": \"" + temp.ProductPrice + "\"";
                    jsonStr += "}";

                    if (i < relatedProduct.Count - 1)
                    {
                        jsonStr += ",";
                    }
                }
                jsonStr += "]";

                /*jsonStr += "\"listItem\": [";
                for (int i = 0; i < orderList.Count; i++)
                {
                    OrderDetails currentOrderDetail = orderList[i];
                    totalPrice += currentOrderDetail.TotalPrice;
                    jsonStr += "{";
                    jsonStr += "\"imageUrl\":\"" + currentOrderDetail.OrderDetailProduct.ProductImageURL + "\",";
                    jsonStr += "\"productId\":\"" + currentOrderDetail.OrderDetailProduct.ProductId + "\",";
                    jsonStr += "\"productName\":\"" + currentOrderDetail.OrderDetailProduct.ProductName + "\",";
                    jsonStr += "\"productPrice\":\"" + currentOrderDetail.OrderDetailProduct.ProductPrice.ToString() + "\",";
                    jsonStr += "\"inStock\":\"" + currentOrderDetail.OrderDetailProduct.ProductInStock.ToString() + "\",";
                    jsonStr += "\"quantity\":\"" + currentOrderDetail.Quantity + "\"";
                    jsonStr += "}";

                    if (i < orderList.Count - 1)
                    {
                        jsonStr += ",";
                    }
                }
                jsonStr += "],";*/
                jsonStr += "}";

                return jsonStr;
            }
            catch (Exception ex)
            {
                throw ex;
            }
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