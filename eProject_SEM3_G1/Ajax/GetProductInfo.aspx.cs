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
    public partial class GetProductInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Response.ContentType = "application/json";
                if (Request.Params["productId"] != null)
                {
                    int productId = 0;

                    productId = int.Parse(Request.Params["productId"].ToString());

                    Product product = ProductDAO.GetProductByProductId(productId);
                    Response.Write(product.ToJSONString());
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
      
            
        }
    }
}