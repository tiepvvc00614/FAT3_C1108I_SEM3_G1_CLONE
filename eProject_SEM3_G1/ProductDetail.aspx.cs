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

                    /*Product product = new Product(productId);
                    Dictionary<string, string> productInfo = product.ProductInfos;
                    List<Product> relatedProduct = product.RelatedProduct;

                    productName.InnerText = product.ProductName;
                    price.InnerText = product.ProductPrice.ToString();
                    Title = product.ProductName;
                    productID.Value = product.ProductId.ToString();
                    descriptionProduct.InnerText = product.ProductDescription;
                    imageHref.HRef = product.ProductImageURL;
                    imageUrl.Src = product.ProductImageURL;


                    /* Generate quantity html string 
                    string quantityHTML = "<option>-- Select Quantity --</option>";
                    if (product.ProductInStock > 0)
                    {
                        for (int i = 1; i <= product.ProductInStock; i++)
                        {
                            quantityHTML += "<option value='"+ i.ToString() +"'>"+ i.ToString() +"</option>";
                        }
                    }
                    else
                    {
                        quantityHTML += "<option value='not-avaiable'>Not-Avaiable</option>";
                    }

                    quantity.InnerHtml = quantityHTML;
                    /*=============END Generate quantity html string============*/



                    /* Generate product infos string 
                    string productInfosHTML = "";
                    productInfosHTML += "<dt>";
                    productInfosHTML += "Availabilty: ";
                    productInfosHTML += "</dt>";

                    productInfosHTML += "<dd>";
                    productInfosHTML += (product.ProductInStock > 0) ? "YES" : "NO";
                    productInfosHTML += "</dd>";

                    foreach (KeyValuePair<string, string> kvp in productInfo)
                    {
                        productInfosHTML += "<dt>";
                        productInfosHTML += ""+ kvp.Key.ToString() +": ";
                        productInfosHTML += "</dt>";

                        productInfosHTML += "<dd>"+ kvp.Value.ToString() +"</dd>";
                    }

                    productInfoDL.InnerHtml = productInfosHTML;
                    /*=============END Generate product infos html string===========*/



                }
                else
                {
                    throw new ArgumentNullException("null agrument");
                }
                
            }
            catch (Exception ex)
            {
                content_place.InnerHtml = "Product not found";
                //Response.Write(@"<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}