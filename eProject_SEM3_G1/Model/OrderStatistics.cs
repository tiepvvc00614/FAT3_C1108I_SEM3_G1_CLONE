using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace eProject_SEM3_G1.Model
{
    public class OrderStatistics
    {
        private int countOrder;
        private DateTime orderDate;

        public int CountOrder
        {
            get { return countOrder; }
            set { countOrder = value; }
        }
        

        public DateTime OrderDate
        {
            get { return orderDate; }
            set { orderDate = value; }
        }
    }
}