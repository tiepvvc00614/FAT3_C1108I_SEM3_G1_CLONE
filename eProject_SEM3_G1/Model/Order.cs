using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace eProject_SEM3_G1.Model
{
    public class Order
    {
        public static int ORDER_STATUS_PLACED = 0;
        public static int ORDER_STATUS_PAID = 1;
        public static int ORDER_STATUS_CANCELED = 3;
        public static int ORDER_STATUS_COMPLETED = 2;

        private int orderId;

        public int OrderId
        {
            get { return orderId; }
            set { orderId = value; }
        }
        private string email;

        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        private DateTime dateOrder;

        public DateTime DateOrder
        {
            get { return dateOrder; }
            set { dateOrder = value; }
        }
        private int status;

        public int Status
        {
            get { return status; }
            set { status = value; }
        }
        private BillingAddress billing;

        public BillingAddress Billing
        {
            get { return billing; }
            set { billing = value; }
        }
        private ShippingAddress shipping;

        public ShippingAddress Shipping
        {
            get { return shipping; }
            set { shipping = value; }
        }
        private User orderUser;

        public User OrderUser
        {
            get { return orderUser; }
            set { orderUser = value; }
        }
        private float total;
        public float Total
        {
            get {
                float totalPrice = 0;
                foreach (OrderDetails item in this.orderDetails)
                {
                    totalPrice += item.TotalPrice;
                }
                //after all, return totalPrice 
                return totalPrice;
            }
        }

        private Tracking orderTracking;

        public Tracking OrderTracking
        {
            get { return orderTracking; }
            set { orderTracking = value; }
        }

        
        private ShippingService deliveryMethod;


        private List<OrderDetails> orderDetails;

        public List<OrderDetails> OrderDetails
        {
            get { return orderDetails; }
            set { orderDetails = value; }
        }
        



    }
}