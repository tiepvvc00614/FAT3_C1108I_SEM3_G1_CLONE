using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eProject_SEM3_G1.Utilities;

namespace eProject_SEM3_G1.Master_Page.UserControl
{
    public partial class Header : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            clientArea.HRef = WebConfiguration.ClientAreaPageURL;
            cartPage.HRef = WebConfiguration.CartPageURL;
            checkoutPage.HRef = WebConfiguration.CheckoutPageURL;
            logoLink.HRef = "/Default.aspx";
            logoLink.InnerText = WebConfiguration.SiteName;


            if (Session[WebConfiguration.SESSION_USERNAME_KEY] != null)
            {
                loginArea.InnerHtml = "Hi, " + Session[WebConfiguration.SESSION_USERNAME_KEY].ToString() + ". Have a nice day";
            }
            else
            {
                loginArea.InnerHtml = @"Welcome to "+ WebConfiguration.SiteName +", <a href="+ WebConfiguration.LoginPageURL +">Login</a> or <a href="+ WebConfiguration.RegisterPageURL +">Create new account</a>";
            }
        }
    }
}