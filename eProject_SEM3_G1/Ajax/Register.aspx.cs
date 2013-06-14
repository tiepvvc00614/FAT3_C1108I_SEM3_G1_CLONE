using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eProject_SEM3_G1.Ajax
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string firstName = null;
                string lastName = null;
                string email = null;
                string phone = null;
                string fax = null;
                string company = null;
                string firstAddress = null;
                string secondAddress = null;
                string city = null;
                string zipcode = null;
                string country = null;
                string state = null;
                string password = null;
                string repassword = null;


                if (Request.Params["firstName"] != null && Request.Params["firstName"] != "") firstName = Request.Params["firstName"].ToString();
                else throw new Exception("First name can't be blank");

                
                if (Request.Params["lastName"] != null && Request.Params["lastName"] != "") lastName = Request.Params["lastName"].ToString();
                else throw new Exception("Last name can't be blank");


                if (Request.Params["email"] != null && Request.Params["email"] != "") email = Request.Params["email"].ToString();
                else throw new Exception("Email can't be blank");


                if (Request.Params["phone"] != null && Request.Params["phone"] != "") phone = Request.Params["phone"].ToString();
                else throw new Exception("Phone can't be blank");


                if (Request.Params["fax"] != null && Request.Params["fax"] != "") fax = Request.Params["fax"].ToString();


                if (Request.Params["company"] != null && Request.Params["company"] != "") company = Request.Params["company"].ToString();


                if (Request.Params["firstAddress"] != null && Request.Params["firstAddress"] != "") firstAddress = Request.Params["firstAddress"].ToString();
                else throw new Exception("Address can't be blank");


                if(Request.Params["secondAddress"] != null && Request.Params["secondAddress"] != "") secondAddress = Request.Params["secondAddress"].ToString();
                if (Request.Params["city"] != null && Request.Params["city"] != "") city = Request.Params["city"].ToString();
                else throw new Exception("City can't be blank");


                if (Request.Params["zipcode"] != null && Request.Params["zipcode"] != "") zipcode = Request.Params["zipcode"].ToString();
                else throw new Exception("Zipcode can't be blank");


                if (Request.Params["country"] != null && Request.Params["country"] != "") country = Request.Params["country"].ToString();
                else throw new Exception("Country can't be blank");


                if (Request.Params["state"] != null && Request.Params["state"] != "") state = Request.Params["state"].ToString();
                else throw new Exception("State can't be blank");


                if (Request.Params["password"] != null && Request.Params["password"] != "") password = Request.Params["password"].ToString();
                else throw new Exception("Pass can't be blank");


                if (Request.Params["repassword"] != null && Request.Params["repassword"] != "") repassword = Request.Params["repassword"].ToString();
                else throw new Exception(" can't be blank");
                

                Response.Write("All are okay");



            }
            catch (Exception ex)
            {
                Response.Write("\"message\": \""+ ex.Message +"\"");
            }
      
        }
    }
}