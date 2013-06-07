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
                string sortBy = null;
                if (Request.Params["sortingBy"] != null && Request.Params["sortingBy"] != "")
                {
                    sortBy = Request.Params["sortingBy"].ToString();
                }


                if (Request.Params["fromDate"] != null && 
                    Request.Params["fromDate"] != "" && 
                    Request.Params["toDate"] != null && 
                    Request.Params["toDate"] != "")
                {
                    DateTime dateFrom = DateTime.Parse(Request.Params["fromDate"].ToString());
                    DateTime dateTo = DateTime.Parse(Request.Params["toDate"].ToString());
                    Response.Write("Have date");
                }
                else
                {
                    DateTime dateFrom = DateTime.Now.AddDays(-8);
                    DateTime dateTo = DateTime.Now;

                    List<Order> listOrder = new List<Order>();
                    Order o1 = new Order();
                    o1.Status = Order.ORDER_STATUS_PAID;
                    o1.OrderId = 1;
                    o1.Email = "order-one@gmail.com";
                    o1.DateOrder = DateTime.Now.AddDays(new Random().Next(10));

                    BillingAddress b1 = new BillingAddress();
                    b1.Firstname = "VU";
                    b1.Lastname = "Tiep";
                    b1.OrderId = 1;

                    o1.Billing = b1;

                    OrderDetails od11 = new OrderDetails();
                    OrderDetails od12 = new OrderDetails();
                    OrderDetails od13 = new OrderDetails();
                    OrderDetails od14 = new OrderDetails();
                    List<OrderDetails> listOrderDetails = new List<OrderDetails>();
                    listOrderDetails.Add(od11);
                    listOrderDetails.Add(od12);
                    listOrderDetails.Add(od13);
                    listOrderDetails.Add(od14);

                    o1.OrderDetails = listOrderDetails;

                    listOrder.Add(o1);

                    Thread.Sleep(200);

                    Order o2 = new Order();
                    o2.Status = Order.ORDER_STATUS_COMPLETED;
                    o2.OrderId = 3;
                    o2.Email = "order-one@gmail.com";
                    o2.DateOrder = DateTime.Now.AddDays(new Random().Next(10));

                    BillingAddress b2 = new BillingAddress();
                    b2.Firstname = "David";
                    b2.Lastname = "Beckham";

                    o2.Billing = b2;

                    OrderDetails od21 = new OrderDetails();
                    OrderDetails od22 = new OrderDetails();
                    OrderDetails od23 = new OrderDetails();
                    OrderDetails od24 = new OrderDetails();
                    List<OrderDetails> listOrderDetails2 = new List<OrderDetails>();
                    listOrderDetails2.Add(od21);
                    listOrderDetails2.Add(od22);
                    listOrderDetails2.Add(od23);
                    listOrderDetails2.Add(od24);

                    o2.OrderDetails = listOrderDetails2;

                    listOrder.Add(o2);
                    Response.Write(JSONUtilities.GetJSONString(listOrder, dateFrom, dateTo));
                }
            }
            catch (Exception ex)
            {
                Response.Write("\"message\": \"" + ex.StackTrace + "\"");
            }
        }
    }
}