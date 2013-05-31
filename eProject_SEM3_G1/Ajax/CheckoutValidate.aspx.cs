using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eProject_SEM3_G1.Ajax
{
    public partial class CheckoutValidate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(5000);
            Response.ContentType = "application/json";
            Response.Write("{\"response\": \"true\"}");
        }
    }
}