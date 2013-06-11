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
                    Order odTmp = listOrder[i];
                    string status = "Not Define";

                    if (odTmp.Status == Order.ORDER_STATUS_CANCELED)
                        status = "Cancelled";
                    if (odTmp.Status == Order.ORDER_STATUS_COMPLETED)
                        status = "Completed";
                    if (odTmp.Status == Order.ORDER_STATUS_PAID)
                        status = "Paid";
                    if (odTmp.Status == Order.ORDER_STATUS_PLACED)
                        status = "Placed";

                    jsonStr += "{";
                    jsonStr += "\"orderId\": \"" + odTmp.OrderId.ToString() + "\",";
                    jsonStr += "\"customerName\": \"" + odTmp.Billing.FullName + "\",";
                    jsonStr += "\"total\": \"" + odTmp.Total.ToString() + "\",";
                    jsonStr += "\"status\": \"" + status + "\",";
                    jsonStr += "\"billing\": " + odTmp.Billing.ToJSONString() + ",";
                    jsonStr += "\"shipping\": " + odTmp.Shipping.ToJSONString() + ",";
                    jsonStr += "\"time\": \"" + odTmp.DateOrder.ToShortDateString() + " " + odTmp.DateOrder.ToShortTimeString() + "\"";
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