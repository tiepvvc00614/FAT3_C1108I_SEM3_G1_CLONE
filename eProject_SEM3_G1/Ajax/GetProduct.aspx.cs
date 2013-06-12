using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eProject_SEM3_G1.Model;

namespace eProject_SEM3_G1.Ajax
{
    public partial class GetProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.ContentType = "application/json";

            try
            {
                if (Request.Params["categoryId"] != null &&
                    Request.Params["categoryId"] != "" &&
                    Request.Params["currentPage"] != null &&
                    Request.Params["currentPage"] != "")
                {
                    int categoryId = Int32.Parse(Request.Params["categoryId"]);
                    int currentPage = Int32.Parse(Request.Params["currentPage"]);

                    List<Product> list = Product.GetProductByCategory(categoryId, currentPage);
                    Response.Write(Product.ToJSONString(list));

                }
            }
            catch (FormatException)
            {
                Response.Write("\"message\": \"Category id or current Page is invalid\"");
            }
            catch (Exception ex)
            {
                Response.Write("\"message\": \"" + ex.Message + "\"");
            }
           
        }
    }
}