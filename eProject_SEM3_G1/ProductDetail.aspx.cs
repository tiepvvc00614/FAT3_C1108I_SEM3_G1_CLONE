﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
                }
                else
                {
                    throw new ArgumentNullException("Wrong URL");
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