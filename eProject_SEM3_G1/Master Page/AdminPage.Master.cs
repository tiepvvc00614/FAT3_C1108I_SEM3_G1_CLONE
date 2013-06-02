using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eProject_SEM3_G1.Master_Page
{
    public partial class AdminPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string dateString = "4/1/2008 8:30:52 AM";
            DateTime date1 = DateTime.Parse(dateString,
                                      System.Globalization.CultureInfo.InvariantCulture);
            dateString = "5/1/2008 8:30:52 AM";
            DateTime date2 = DateTime.Parse(dateString,
                                      System.Globalization.CultureInfo.InvariantCulture);
            dateString = "6/1/2008 8:30:52 AM";
            DateTime date3 = DateTime.Parse(dateString,
                                      System.Globalization.CultureInfo.InvariantCulture);
            dateString = "7/1/2008 8:30:52 AM";
            DateTime date4 = DateTime.Parse(dateString,
                                      System.Globalization.CultureInfo.InvariantCulture);
            dateString = "8/1/2008 8:30:52 AM";
            DateTime date5 = DateTime.Parse(dateString,
                                      System.Globalization.CultureInfo.InvariantCulture);
            dateString = "9/1/2008 8:30:52 AM";
            DateTime date6 = DateTime.Parse(dateString,
                                      System.Globalization.CultureInfo.InvariantCulture);
            dateString = "10/1/2008 8:30:52 AM";
            DateTime date7 = DateTime.Parse(dateString,
                                      System.Globalization.CultureInfo.InvariantCulture);
            dateString = "11/1/2008 8:30:52 AM";
            DateTime date8 = DateTime.Parse(dateString,
                                      System.Globalization.CultureInfo.InvariantCulture);
            dateString = "12/1/2008 8:30:52 AM";
            DateTime date9 = DateTime.Parse(dateString,
                                      System.Globalization.CultureInfo.InvariantCulture);
            Response.Write("<script>console.log('" + GetJavascriptTimestamp(date1) + "');</script>");
            Response.Write("<script>console.log('" + GetJavascriptTimestamp(date2) + "');</script>");
            Response.Write("<script>console.log('" + GetJavascriptTimestamp(date3) + "');</script>");
            Response.Write("<script>console.log('" + GetJavascriptTimestamp(date4) + "');</script>");
            Response.Write("<script>console.log('" + GetJavascriptTimestamp(date5) + "');</script>");
            Response.Write("<script>console.log('" + GetJavascriptTimestamp(date6) + "');</script>");
            Response.Write("<script>console.log('" + GetJavascriptTimestamp(date7) + "');</script>");
            Response.Write("<script>console.log('" + GetJavascriptTimestamp(date8) + "');</script>");
            Response.Write("<script>console.log('" + GetJavascriptTimestamp(date9) + "');</script>");

        }
        public static long GetJavascriptTimestamp(System.DateTime input)
        {
            System.TimeSpan span = new System.TimeSpan(System.DateTime.Parse("1/1/1970").Ticks);
            System.DateTime time = input.Subtract(span);
            return (long)(time.Ticks / 10000);
        }
    }
}