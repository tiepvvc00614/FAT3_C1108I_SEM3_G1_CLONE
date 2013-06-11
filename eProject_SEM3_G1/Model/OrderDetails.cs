using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using eProject_SEM3_G1.Model.DataAccess;

namespace eProject_SEM3_G1.Model
{
    public class OrderDetails
    {
        private int orderDetailId;
        private int orderDetailQuantity;
        private Product orderDetailProduct;

        public OrderDetails(Product pro, int quan)
        {
            this.orderDetailProduct = pro;
            this.orderDetailQuantity = quan;
        }

        public int OrderDetailId
        {
            set
            {
                this.orderDetailId = value;
            }
        }

        public int Quantity
        {
            get
            {
                return this.orderDetailQuantity;
            }
            set
            {
                this.orderDetailQuantity = value;
            }
        }

        public float TotalPrice
        {
            get
            {
                float priceProduct = this.orderDetailProduct.ProductPrice;
                return (priceProduct * this.orderDetailQuantity) - (((priceProduct * this.orderDetailQuantity) / 100) * this.orderDetailProduct.ProductDiscount);
                
            }
        }

        public Product OrderDetailProduct
        {
            get { return orderDetailProduct; }
        }

        public string ToJSONString()
        {
            string jsonStr = "";
            jsonStr += "{";
            jsonStr += "\"product\": "+ this.OrderDetailProduct.ToJSONString() +",";
            jsonStr += "\"quantity\": "+ this.Quantity + ",";
            jsonStr += "\"total\": " + this.TotalPrice.ToString() + "";
            jsonStr += "}";

            return jsonStr;
        }

        public static string ToJSONString(List<OrderDetails> listItem)
        {
            string jsonStr = "";

            jsonStr += "{";

            for(int i = 0, length = listItem.Count; i< length; i++)
            {
                jsonStr += listItem[i].ToJSONString();

                if(i<length -1) jsonStr += ",";
            }

            jsonStr += "}";
            return jsonStr;

        }
    }

    public class OrderDetailComparer : IEqualityComparer<OrderDetails>
    {
        public bool Equals(OrderDetails one, OrderDetails two)
        {
            if (one.OrderDetailProduct.ProductId == two.OrderDetailProduct.ProductId)
            {
                return true;
            }
            else return false;
        }

        public int GetHashCode(OrderDetails order)
        {
            return order.OrderDetailProduct.ProductId.GetHashCode();
        }
    }
}