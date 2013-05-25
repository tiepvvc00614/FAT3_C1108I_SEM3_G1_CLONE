using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eProject_SEM3_G1.Model;

namespace eProject_SEM3_G1.Ajax
{
    public partial class ShoppingCartHandler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.ContentType = "application/json";
            if (Request.Form["quantity"] != null &&
               Request.Form["product"] != null)
            {
                try
                {
                    int quantity = int.Parse(Request.Form["quantity"].ToString());
                    int productId = int.Parse(Request.Form["product"].ToString());

                    Product product = new Product(productId);
                    OrderDetails orderDetails = new OrderDetails(product, quantity);

                    HashSet<OrderDetails> listItem = ShoppingCart.GetListItemInCart(Session);

                    if (listItem.Add(orderDetails))
                    {
                        string jsonStr = ShoppingCart.GetJSONStringFromListItem(listItem);
                        Response.Write(jsonStr);
                    }
                    else Response.Write("{\"message\": \"Item have been exist\"}");
                }
                catch (FormatException)
                {
                    Response.Write("{\"message\": \"Item id or quantity is invalid\"}");
                }
                catch (Exception ex)
                {
                    Response.Write("{\"message\": \"" + ex.Message + "\"}");
                }
            }
            else
            {
                Response.Write(ShoppingCart.GetJSONStringFromListItem(ShoppingCart.GetListItemInCart(Session)));
            }
        }
    }
}