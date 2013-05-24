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
                    Dictionary<string, string> productInfo = product.ProductInfos;
                    List<Product> relatedProduct = product.RelatedProduct;

                    productName.InnerText = product.ProductName;
                    price.InnerText = "$" + product.ProductPrice.ToString();
                    productID.Value = product.ProductId.ToString();
                    descriptionProduct.InnerHtml = product.ProductDescription;
                    imageHref.HRef = product.ProductImageURL;
                    imageUrl.Src = product.ProductImageURL;


                    /*Generate quantity html string */
                    string quantityHTML = " <select class='span4' name='quantity'>";
                    quantityHTML += "<option>-- Select Quantity --</option>";
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
                    quantityHTML += "</select>";
                    quantity.InnerHtml = quantityHTML;
                    /*=============END Generate quantity html string============*/



                    /* Generate product infos string */
                    string productInfosHTML = "";
                    productInfosHTML += "<dt>";
                    productInfosHTML += "Availabilty: ";
                    productInfosHTML += "</dt>";

                    productInfosHTML += "<dd>";
                    productInfosHTML += product.ProductInStock.ToString();
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

                    /* Generate related product html string*/

                    string relatedProductHTML = "";

                    foreach (Product item in relatedProduct)
                    {
                        relatedProductHTML += "<li class='span3 clearfix'>";
                        relatedProductHTML += "<div class='thumbnail'>";
                        relatedProductHTML += "<a href=" + item.ProductImageURL + "><img src="+ item.ProductImageURL +" class='relatedImgProduct'></a>";

                        relatedProductHTML += "</div>";
                        relatedProductHTML += "<div class='thumbSetting'>";

                        relatedProductHTML += "<div class='thumbTitle'>";

                        relatedProductHTML += "<a href=/ProductDetail.aspx?productId="+ item.ProductId +" class='invarseColor'> " + item.ProductName + "</a>";

                        relatedProductHTML += "</div>";
                        relatedProductHTML += "<div class='thumbPrice'>";
                        relatedProductHTML += "<span>$"+ item.ProductPrice.ToString() +"</span>";
                        relatedProductHTML += "</div>";
                        relatedProductHTML += "<div class='thumbButtons'>";
                        relatedProductHTML += "<button class=\"btn btn-primary btn-small\" data-title=\"+To Cart\" data-placement=\"top\" data-toggle=\"tooltip\">";
                        relatedProductHTML += "<i class=\"icon-shopping-cart\"></i>";
                        relatedProductHTML += "</button>";
                        relatedProductHTML += "</div>";
                        relatedProductHTML += "</div>";
                    }
                    relatedProductHTMLControl.InnerHtml = relatedProductHTML;

                    /*=========END Generate related product html string=========*/


                }
                else
                {
                    throw new ArgumentNullException("null agrument");
                }
                
            }
            catch (Exception ex)
            {
                content_place.InnerHtml = ex.StackTrace;
                content_place.InnerHtml += ex.Message;
                //Response.Write(@"<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}