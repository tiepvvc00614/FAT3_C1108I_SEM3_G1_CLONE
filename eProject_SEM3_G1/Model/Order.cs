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
        private string email;
        private DateTime dateOrder;
        private int status;
        private BillingAddress billing;
        private ShippingAddress shipping;
        private User orderUser;
        private Tracking orderTracking;
        private ShippingService deliveryMethod;
        List<OrderDetails> orderDetails;



    }
}