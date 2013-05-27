using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eProject_SEM3_G1.Model;
using eProject_SEM3_G1.Model.DataAccess;

namespace eProject_SEM3_G1.Ajax
{
    public partial class ShoppingCartHandler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Response.ContentType = "application/json";
                if (Request.Params["quantity"] != null &&
                   Request.Params["product"] != null)
                {
                    try
                    {
                        int quantity = int.Parse(Request.Params["quantity"].ToString());
                        int productId = int.Parse(Request.Params["product"].ToString());

                        Product product = ProductDAO.GetProductByProductId(productId);
                        if (product == null) throw new Exception("Product could not be founded!");

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
                        throw ex;
                    }
                }
                else
                {
                    Response.Write(ShoppingCart.GetJSONStringFromListItem(ShoppingCart.GetListItemInCart(Session)));
                }
            }
            catch (Exception ex)
            {
                Response.Write("{\"message\": \"" + ex.Message + "\"}");
            }
        }
    }
}