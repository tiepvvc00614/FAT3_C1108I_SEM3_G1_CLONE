using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using eProject_SEM3_G1.Model.DataAccess;

namespace eProject_SEM3_G1.Model
{
    public class Order
    {
        public static int ORDER_STATUS_PLACED = 0;
        public static int ORDER_STATUS_PAID = 1;
        public static int ORDER_STATUS_CANCELED = 3;
        public static int ORDER_STATUS_COMPLETED = 2;

        private OrderDAO dataAccessObj;
        private string email;
        private int orderId;
        private DateTime dateOrder;
        private int status;
        private BillingAddress billing;
        private ShippingAddress shipping;
        private User orderUser;
        private Tracking orderTracking;
        private ShippingService deliveryMethod;
        private List<OrderDetails> orderDetails;

        public Order()
        {
            this.dataAccessObj = new OrderDAO(this);
        }

        /*========== BEGIN GET SET =============*/
        public int OrderId
        {
            get { return orderId; }
            set { orderId = value; }
        }
        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        public DateTime DateOrder
        {
            get { return dateOrder; }
            set { dateOrder = value; }
        }
        public int Status
        {
            get { return status; }
            set { status = value; }
        }
        public BillingAddress Billing
        {
            get 
            {
                if (billing == null) this.billing = this.dataAccessObj.GetBilling();
                return this.billing;
            }
        }
        public ShippingAddress Shipping
        {
            get 
            {
                if (shipping == null) this.shipping = this.dataAccessObj.GetShipping();
                return this.shipping;
            }
        }
        public User OrderUser
        {
            get { return orderUser; }
            set { orderUser = value; }
        }
        public float Total
        {
            get {
                float totalPrice = 0;
                foreach (OrderDetails item in this.ListOrderDetails)
                {
                    totalPrice += item.TotalPrice;
                }
                //after all, return totalPrice 
                return totalPrice;
            }
        }
        public Tracking OrderTracking
        {
            get { return orderTracking; }
            set { orderTracking = value; }
        }
        public List<OrderDetails> ListOrderDetails
        {
            get 
            {
                if (orderDetails == null) orderDetails = this.dataAccessObj.GetOrderDetails();
                return orderDetails;
            }
        }

        /*========== END GET SET =============*/




        public string ToJSONString()
        {
            string jsonStr = "";
            jsonStr += "{";

            jsonStr += "\"orderId\": \""+ this.OrderId +"\",";
            jsonStr += "\"emailContact\": \"" + this.email + "\",";
            jsonStr += "\"dateOrder\": \"" + this.DateOrder.ToLongDateString() + "\",";
            jsonStr += "\"status\": \"" + Order.GetStatusString(this.status) + "\",";
            jsonStr += "\"billing\": \"" + this.Billing.ToJSONString() + "\",";
            jsonStr += "\"shipping\": \"" + this.Shipping.ToJSONString() + "\",";
            jsonStr += "\"total\": \"" + this.Total + "\",";
            jsonStr += "\"orderDetails\": "+ OrderDetails.ToJSONString(this.ListOrderDetails) +"";

            jsonStr += "}";

            return jsonStr;
        }

        public static string GetStatusString(int status)
        {
            string statusStr = "Not defined";
            if (status == Order.ORDER_STATUS_CANCELED)
                statusStr = "cancelled";
            if (status == Order.ORDER_STATUS_COMPLETED)
                statusStr = "completed";
            if (status == Order.ORDER_STATUS_PAID)
                statusStr = "paid";
            if (status == Order.ORDER_STATUS_PLACED)
                statusStr = "placed";

            return statusStr;
        }



        public static List<Order> GetOrder(DateTime start, DateTime end)
        {
            try
            {
                return StatisticsDAO.GetOrder(start, end);
            }
            catch (Exception ex)
            {
                throw ex;
            }
      
        }
        public static List<Order> GetOrder(DateTime start, DateTime end, int status)
        {
            return null;
        }

        public static Order GetOrder(int orderId)
        {
            return OrderDAO.GetOrderByOrderId(orderId);
        }
    }
}