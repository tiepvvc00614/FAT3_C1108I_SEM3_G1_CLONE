<%@ Page Title="" Language="C#" MasterPageFile="~/Master Page/MainMP.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="eProject_SEM3_G1.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleTextContentPlaceHolder" runat="server">
View Cart
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderAppend" runat="server">
    <script src="/js/cart-loader.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
<div class="container" ID="content_place" runat="server">
			<div class="span12">
                <img src="img/product-loader.gif" align="center" style="display: block;margin-left: auto; margin-right: auto" />
            </div>
		</div><!--end conatiner-->
</asp:Content>
