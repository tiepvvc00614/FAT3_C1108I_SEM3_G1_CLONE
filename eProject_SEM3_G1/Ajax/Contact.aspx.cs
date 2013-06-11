using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eProject_SEM3_G1.Ajax
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["name-contact"] != null && Request.Params["name-contact"] != "")
            {
                Response.Write("Have name");
            }
            else
            {
                Response.Write("Okay contact");
            }
            
        }
    }
}