<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Category.ascx.cs" Inherits="eProject_SEM3_G1.Master_Page.UserControl.Category" %>
<ul class="nav">
   <%
       System.Collections.Generic.List<eProject_SEM3_G1.Model.Category> listCat = eProject_SEM3_G1.Model.Category.GetAllCategory();
       string htmlStr = "";

       htmlStr += "<li><a href='/Default.aspx'><i class='icon-home'></i></a></li>";
       foreach (eProject_SEM3_G1.Model.Category item in listCat)
       {
           htmlStr += "<li><a href='ViewProduct.aspx?categoryId=" + item.CategoryId.ToString() + "'>" + item.CategoryName + "</a></li>";
       }
       Response.Write(htmlStr);    
    %>
</ul><!--end nav-->