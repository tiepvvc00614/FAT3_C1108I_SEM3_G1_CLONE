using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace eProject_SEM3_G1.Model
{
    public class BillingAddress : Address
    {
        private int orderId;

        public int OrderId
        {
            get { return orderId; }
            set { orderId = value; }
        }

    }
}