using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using eProject_SEM3_G1.Model;

namespace eProject_SEM3_G1.Utilities
{
    public class JSONUtilities
    {
        public static long GetJavascriptTimestamp(System.DateTime input)
        {
            System.TimeSpan span = new System.TimeSpan(System.DateTime.Parse("1/1/1970").Ticks);
            System.DateTime time = input.Subtract(span);
            return (long)(time.Ticks / 10000);
        }

        public static string GetJSONString(List<Order> listOrder, DateTime dateFrom, DateTime dateTo)
        {
            try
            {
                string jsonStr = "";

                jsonStr += "{";
                jsonStr += "\"dateFrom\": "+ GetJavascriptTimestamp(dateFrom) +",";
                jsonStr += "\"dateTo\": " + GetJavascriptTimestamp(dateTo) + ",";
                jsonStr += "\"orders\": ";
                jsonStr += "[";
                for (int i = 0, length = listOrder.Count; i < length; i++)
                {
                    jsonStr += "{";
                    jsonStr += "\"orderId\": \""+ listOrder[i].OrderId.ToString() +"\",";
                    jsonStr += "\"customerName\": \"" + listOrder[i].Billing.Fullname + "\",";
                    jsonStr += "\"total\": \"" + listOrder[i].Total.ToString() + "\",";
                    jsonStr += "\"time\": \"" + listOrder[i].DateOrder.Day.ToString() + "/" + listOrder[i].DateOrder.Month + "\"";
                    jsonStr += "}";

                    if (i < length - 1)
                    {
                        jsonStr += ", ";
                    }
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