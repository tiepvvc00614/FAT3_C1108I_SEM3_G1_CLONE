<%@ Page Title="" Language="C#" MasterPageFile="~/Master Page/MainMP.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="eProject_SEM3_G1.ProductDetail" %>
<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleTextContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderAppend" runat="server">
<script src="js/product-loader.js" type="text/javascript"></script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
<div class="container" ID="content_place" runat="server">
			<div class="span12">
                <img src="img/product-loader.gif" align="center" style="display: block;margin-left: auto; margin-right: auto" />
            </div>
		</div><!--end conatiner-->
</asp:Content>
