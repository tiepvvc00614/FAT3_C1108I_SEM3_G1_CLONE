using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eProject_SEM3_G1.Model;

namespace eProject_SEM3_G1.Ajax
{
    public partial class SearchProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                int categoryId = 0;
                if (Request.Params["searchInCategory"] != null &&
                    Request.Params["searchInCategory"] != "")
                {
                    try
                    {
                        categoryId = Int32.Parse(Request.Params["searchInCategory"].ToString());
                    }
                    catch (FormatException)
                    {
                        categoryId = 0;
                    }
                }


                if (Request.Params["keyword"] != null &&
                   Request.Params["keyword"] != "")
                {
                    string keyword = Request.Params["keyword"].ToString();
                    List<Product> listReturn = Product.SearchProduct(keyword, categoryId);
                    Response.Write(Product.ToJSONString(listReturn));
                }



            }
            catch (Exception ex)
            {
                Response.Write("\"message\": \""+ex.Message+"\"");
            }
        }
    }
}