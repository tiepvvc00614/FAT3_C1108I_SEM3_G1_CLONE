using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eProject_SEM3_G1.Model;

namespace eProject_SEM3_G1
{
    public partial class ProductDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            try
            {
                if (Request.Params["productId"] != null)
                {
                    int productId = 0;

                    productId = int.Parse(Request.Params["productId"].ToString());

                    Product product = new Product(productId);
                }
                else
                {
                    throw new ArgumentNullException("null agrument");
                }
                
            }
            catch (FormatException fex)
            {
                Response.Write(@"<script>alert('Wrong format product id');</script>");
            }
            catch (Exception ex)
            {
                Response.Write(@"<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}