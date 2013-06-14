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

                if (Request.Params["getRandom"] != null &&
                   Request.Params["getRandom"] != "" &&
                   Request.Params["totalItem"] != null &&
                   Request.Params["totalItem"] != "")
                {
                    int totalItem = Int32.Parse(Request.Params["totalItem"].ToString());

                    List<Product> list = Product.GetRandomProduct(totalItem);
                    Response.Write(Product.ToJSONString(list));
                }

                if (Request.Params["productId"] != null)
                {
                    int productId = 0;

                    productId = int.Parse(Request.Params["productId"].ToString());

                    Product product = Product.GetProduct(productId);
                    List<Product> listRand = Product.GetRandomProduct(7);

                    string jsonStr = "";
                    jsonStr += "{";
                    jsonStr += "\"randomProduct\": [";
                    for (int i = 0, length = listRand.Count; i < length; i++) {
                        jsonStr += listRand[i].ToJSONString();
                        if (i < length - 1) jsonStr += ",";
                    }
                    jsonStr += "],";
                    jsonStr += "\"currentProduct\": ";
                    jsonStr += product.ToJSONString();
                    jsonStr += "}";

                    Response.Write(jsonStr);
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