using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eProject_SEM3_G1.Ajax
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.ContentType = "application/json";
            try
            {
                
                string emailLogin = null;
                string passwordLogin = null;

                bool isRemember = false;


                if (Request.Params["emailLogin"] != null && Request.Params["emailLogin"] != "") emailLogin = Request.Params["emailLogin"].ToString();
                else throw new Exception("Email can't be blank");

                if (Request.Params["passwordLogin"] != null && Request.Params["passwordLogin"] != "") passwordLogin = Request.Params["passwordLogin"].ToString();
                else throw new Exception("Password can't be blank");

                if (Request.Params["isRemember"] != null && Request.Params["isRemember"] != "") isRemember = true;


                Model.User u = Model.User.Login(emailLogin, passwordLogin);
                if (u == null) throw new Exception("Email or password invalid");
                if (u.Status == Model.User.STATUS_BANNED) throw new Exception("Your account has been banned");
                if (u.Status == Model.User.STATUS_UNACTIVE) throw new Exception("You must active your account before login");

                

                if (isRemember)
                {
                    Response.Cookies.Add(new HttpCookie(Model.User.USER_COOKIE_EMAIL_KEY, u.UserEmail));
                    Response.Cookies.Add(new HttpCookie(Model.User.USER_COOKIE_PASSWORD_KEY, u.UserEmail));
                    Response.Cookies[Model.User.USER_COOKIE_EMAIL_KEY].Expires = DateTime.Now.AddDays(365);
                    Response.Cookies[Model.User.USER_COOKIE_PASSWORD_KEY].Expires = DateTime.Now.AddDays(365);
                }
                else
                {
                    Session.Add(Model.User.USER_SESSION_KEY, u);
                }

                Response.Write("{\"message\": \"True\"}");
            }
            catch (Exception ex)
            {
                Response.Write("{\"message\": \""+ ex.Message +"\"}");
            }
        }
    }
}