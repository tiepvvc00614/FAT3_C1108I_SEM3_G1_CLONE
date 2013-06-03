using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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