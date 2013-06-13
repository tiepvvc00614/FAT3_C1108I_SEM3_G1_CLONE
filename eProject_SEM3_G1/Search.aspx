<%@ Page Title="" Language="C#" MasterPageFile="~/Master Page/MainMP.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="eProject_SEM3_G1.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleTextContentPlaceHolder" runat="server">
- Search in site
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderAppend" runat="server">
    <script src="js/page.customization/search.product.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
<div class="container">

			<div class="row">

				<div class="span3">
					<div class="search">
						<div class="titleHeader clearfix">
							<h3>Search</h3>
						</div>

						<form method="get" action="/Ajax/SearchProduct.aspx" id="searchItem">
						  	<input type="text" class="span3" name="keyword" placeholder="Type Search Term...">
						    <select name="searchInCategory" class="span3">
						  	  <option value="none">--Select Category--</option>
						   	  <option value="1">Put Category1</option>
						  	  <option value="2">Put Category2</option>
						  	  <option value="3">Put Category3</option>
						  	  <option value="4">Put Category4</option>
						    </select>

						    <br>
						    <button type="submit" class="btn btn-primary"><i class="icon-search"></i> Start Searching</button>
						</form><!--end form-->

					</div><!--end search-->
				</div><!--end span3-->


				<div class="span9">
					<div class="alert alert-error search-error" style="display:none;">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<h4>Oh, We're So Sorry</h4>
						There is no product that matches the search criteria.
					</div><!--end alert-->


					<div class="titleHeader clearfix">
						<h3>Search Result</h3>
					</div><!--end titleHeader-->
					<div class="row listProducts">
                    </div><!--end row-->

					

				</div><!--end span9-->

			</div><!--end row-->

		</div><!--end conatiner-->
</asp:Content>
