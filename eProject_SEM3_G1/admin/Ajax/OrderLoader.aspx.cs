using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
                if (Request.Params["filterBy"] != null)
                {
                    sortBy = Request.Params["filterBy"].ToString();
                }


                if (Request.Params["fromDate"] != null && Request.Params["toDate"] != null)
                {
                    DateTime dateFrom = DateTime.Parse(Request.Params["fromDate"].ToString());
                    DateTime dateTo = DateTime.Parse(Request.Params["toDate"].ToString());
                }
                else
                {

                }
            }
            catch (Exception ex)
            {
                Response.Write("\"message\": \"" + ex.Message + "\"");
            }
        }
    }
}