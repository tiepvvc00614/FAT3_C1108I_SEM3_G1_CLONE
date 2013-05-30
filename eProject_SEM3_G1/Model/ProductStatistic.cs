using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace eProject_SEM3_G1.Model
{
    public class ProductStatistic : Product
    {
        private int orderCount;

        public ProductStatistic(int ordCount) : base() {
            this.orderCount = ordCount;
        }

        public int OrderCount
        {
            get
            {
                return this.orderCount;
            }
        }
    }
}