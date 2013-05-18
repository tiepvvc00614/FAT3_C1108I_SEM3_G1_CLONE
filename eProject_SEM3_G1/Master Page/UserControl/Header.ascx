<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="eProject_SEM3_G1.Master_Page.UserControl.Header" %>
 <%@ Register Src="../UserControl/Cart.ascx" TagName="CartUC" TagPrefix="cartUC" %>
  <%@ Register Src="../UserControl/Category.ascx" TagName="CategoryUC" TagPrefix="categoryUC" %>
    <header>
			<div class="upperHeader">
				<div class="container">
					<ul class="pull-right inline">
						<li><a class="invarseColor" ID="clientArea" runat="server">My Account</a></li>
						<li class="divider-vertical"></li>
						<li><a class="invarseColor" ID="cartPage" runat="server">Shoping Cart</a></li>
						<li class="divider-vertical"></li>
						<li><a class="invarseColor" ID="checkoutPage" runat="server">Checkout</a></li>
					</ul>
					<p ID="loginArea" runat="server">
					<!-- Login area in here -->
					</p>
				</div><!--end container-->
			</div><!--end upperHeader-->

			<div class="middleHeader">
				<div class="container">

					<div class="middleContainer clearfix">

					<div class="siteLogo pull-left">
						<h1><a href="index.html" ID="logoLink" runat="server"></a></h1>
					</div>

					<div class="pull-right">
						<form method="get" action="Search.aspx" class="siteSearch">
							<div class="input-append">
								<input type="text" class="span2" id="appendedInputButton" placeholder="Search...">
								<button class="btn btn-primary" type="submit" name=""><i class="icon-search"></i></button>
							</div>
						</form>
					</div>

					<div class="pull-right">
						<div class="btn-group">
                            <cartUC:CartUC ID="Cart" runat="server" /> <!-- Cart user control -->
						</div>
					</div><!--end pull-right-->

					</div><!--end middleCoontainer-->

				</div><!--end container-->
			</div><!--end middleHeader-->

			<div class="mainNav">
				<div class="container">
					<div class="navbar">
					      	
				      	<categoryUC:CategoryUC ID="categoryList" runat="server" /> <!--Category user control -->

					</div>
				</div><!--end container-->
			</div><!--end mainNav-->
			
		</header>