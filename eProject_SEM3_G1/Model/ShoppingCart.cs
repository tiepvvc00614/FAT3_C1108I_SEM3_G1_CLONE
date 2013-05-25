using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace eProject_SEM3_G1.Model
{
    public class ShoppingCart
    {
        private static string SESSION_KEY_SHOPPING_CART = "Shopping cart session key";
        private static HashSet<OrderDetails> listItemInCart;

        public static HashSet<OrderDetails> GetListItemInCart(System.Web.SessionState.HttpSessionState session)
        {
            listItemInCart = (HashSet<OrderDetails>)session[SESSION_KEY_SHOPPING_CART];

            if (listItemInCart == null)
            {
                listItemInCart = new HashSet<OrderDetails>(new OrderDetailComparer());
                session.Add(SESSION_KEY_SHOPPING_CART, listItemInCart);
            }
            return listItemInCart;
        }

        public static string GetJSONStringFromListItem(HashSet<OrderDetails> listItem)
        {
            try
            {
                List<OrderDetails> orderList = listItem.ToList<OrderDetails>();
                float totalPrice = 0;

                string jsonStr = "{";
                jsonStr += "\"message\": \"Added\",";
                jsonStr += "\"listItem\": [";
                for (int i = 0; i < orderList.Count; i++)
                {
                    OrderDetails currentOrderDetail = orderList[i];
                    totalPrice += currentOrderDetail.TotalPrice;
                    jsonStr += "{";
                    jsonStr += "\"imageUrl\":\"" + currentOrderDetail.OrderDetailProduct.ProductImageURL + "\",";
                    jsonStr += "\"productName\":\"" + currentOrderDetail.OrderDetailProduct.ProductName + "\",";
                    jsonStr += "\"productPrice\":\"" + currentOrderDetail.OrderDetailProduct.ProductPrice.ToString() + "\",";
                    jsonStr += "\"inStock\":\"" + currentOrderDetail.OrderDetailProduct.ProductInStock.ToString() + "\",";
                    jsonStr += "\"quantity\":\"" + currentOrderDetail.Quantity + "\"";
                    jsonStr += "}";

                    if (i < orderList.Count - 1)
                    {
                        jsonStr += ",";
                    }
                }
                jsonStr += "],";
                jsonStr += "\"totalPrice\": \"" + totalPrice.ToString() + "\"";
                jsonStr += "}";
                return jsonStr;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}