using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace eProject_SEM3_G1.Model
{
    public class IncomeStatistics
    {
        private DateTime orderDate;
        private float detailTotal;
       
        public DateTime OrderDate
        {
            get { return orderDate; }
            set { orderDate = value; }
        }
        public float DetailTotal
        {
            get { return detailTotal; }
            set { detailTotal = value; }
        }

        public static string ToJSONString(List<IncomeStatistics> listData)
        {
            try
            {
                string jsonStr = "";

                jsonStr += "{";
                jsonStr += "\"message\": \"Okay\",";
                jsonStr += "\"data\": [";
                for (int i = 0, lenght = listData.Count; i < lenght; i++)
                {

                }


                    jsonStr += "]";

                jsonStr += "}";

                return jsonStr;
            }
            catch (Exception ex)
            {
                throw ex;
            }
      
        }
    }
}