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

    }
}