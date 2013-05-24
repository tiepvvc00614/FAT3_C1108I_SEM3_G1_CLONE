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
                        List<OrderDetails> orderList = listItem.ToList<OrderDetails>();

                        string jsonStr = "{";
                        jsonStr += "\"listItem\": [";
                        for (int i=0; i< orderList.Count; i++)
                        {
                            OrderDetails currentOrderDetail = orderList[i];
                            jsonStr += "{";
                            jsonStr += "\"imageUrl\":\"" + currentOrderDetail.OrderDetailProduct.ProductImageURL + "\",";
                            jsonStr += "\"productName\":\"" + currentOrderDetail.OrderDetailProduct.ProductName + "\",";
                            jsonStr += "\"productPrice\":\"" + currentOrderDetail.OrderDetailProduct.ProductPrice.ToString() + "\",";
                            jsonStr += "\"inStock\":\"" + currentOrderDetail.OrderDetailProduct.ProductInStock.ToString() + "\",";
                            jsonStr += "\"quantity\":\"" + currentOrderDetail.Quantity + "\"";
                            jsonStr += "}";

                            if (i < orderList.Count -1)
                            {
                                jsonStr += ",";
                            }
                        }
                        jsonStr += "]";

                        jsonStr += "}";
                        Response.Write(jsonStr);
                    }
                    else Response.Write("False");
                }
                catch (FormatException)
                {
                    Response.Write("Item id or quantity is invalid");
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
        }
    }
}