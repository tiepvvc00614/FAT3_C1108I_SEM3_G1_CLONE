using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eProject_SEM3_G1.Model;
using eProject_SEM3_G1.Utilities;
using System.Threading;

namespace eProject_SEM3_G1.admin.Ajax
{
    public partial class OrderLoader : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.ContentType = "application/json";

            try
            {
                int sortBy = -1;
                if (Request.Params["sortingBy"] != null && Request.Params["sortingBy"] != "")
                {

                    switch (Request.Params["sortingBy"].ToString())
                    {
                        case "cancelled":
                            sortBy = Order.ORDER_STATUS_CANCELED;
                            break;
                        case "completed":
                            sortBy = Order.ORDER_STATUS_COMPLETED;
                            break;
                        case "placed":
                            sortBy = Order.ORDER_STATUS_PLACED;
                            break;
                        case "paid":
                            sortBy = Order.ORDER_STATUS_PAID;
                            break;
                        default:
                            sortBy = -1;
                            break;
                    }
                }


                if (Request.Params["fromDate"] != null &&
                    Request.Params["fromDate"] != "" &&
                    Request.Params["toDate"] != null &&
                    Request.Params["toDate"] != "")
                {
                    DateTime dateFrom = DateTime.Parse(Request.Params["fromDate"].ToString());
                    DateTime dateTo = DateTime.Parse(Request.Params["toDate"].ToString());
                    List<Order> listOrderStatistics = null;

                    if (sortBy > -1)
                        listOrderStatistics = Order.GetOrder(dateFrom, dateTo, sortBy);
                    else
                        listOrderStatistics = Order.GetOrder(dateFrom, dateTo);

                    Response.Write(JSONUtilities.GetJSONString(listOrderStatistics, dateFrom, dateTo));
                }
                else
                {
                    DateTime dateFrom = DateTime.Now.AddDays(-8);
                    DateTime dateTo = DateTime.Now;

                    List<Order> listOrderStatistics = null;

                    if (sortBy > -1)
                        listOrderStatistics = Order.GetOrder(dateFrom, dateTo, sortBy);
                    else
                        listOrderStatistics = Order.GetOrder(dateFrom, dateTo);

                    Response.Write(JSONUtilities.GetJSONString(listOrderStatistics, dateFrom, dateTo));
                }
            }
            catch (FormatException)
            {
                Response.Write("\"message\": \"Date is wrong format\"");
            }
            catch (Exception ex)
            {
                Response.Write("\"message\": \"" + ex.StackTrace + "\"");
            }
        }
    }
}