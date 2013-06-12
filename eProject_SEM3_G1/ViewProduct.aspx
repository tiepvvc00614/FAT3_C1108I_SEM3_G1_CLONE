<%@ Page Title="" Language="C#" MasterPageFile="~/Master Page/MainMP.Master" AutoEventWireup="true" CodeBehind="ViewProduct.aspx.cs" Inherits="eProject_SEM3_G1.ViewProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleTextContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderAppend" runat="server">
    <script src="js/view.product.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
<div class="container">

			<div class="row">

				<aside class="span3">

					<div class="categories">
						<div class="titleHeader clearfix">
							<h3>Categories</h3>
						</div><!--end titleHeader-->
						<ul class="unstyled">
							<li><a class="invarseColor active" href="#">Women (16)</a>
								<ul class="submenu">
									<li><a class="invarseColor" href="#">Beauty (3)</a></li>
									<li><a class="invarseColor active" href="#">Dresses (4)</a></li>
									<li><a class="invarseColor" href="#">Shorts (6)</a></li>
									<li><a class="invarseColor" href="#">Shoes (2)</a></li>
									<li><a class="invarseColor" href="#">Tops (1)</a></li>
									<li><a class="invarseColor" href="#">Jakets &amp; Coats (7)</a></li>
								</ul>
							</li>
							<li><a class="invarseColor" href="#">Men (6)</a></li>
							<li><a class="invarseColor" href="#">Children (8)</a></li>
							<li><a class="invarseColor" href="#">FootWear (3)</a></li>
							<li><a class="invarseColor" href="#">Accesspries (56)</a></li>
							<li><a class="invarseColor" href="#">Outlet (12)</a></li>
							<li><a class="invarseColor" href="#">Community (0)</a></li>
						</ul>
					</div><!--end categories-->

					<div class="pro-range-slider">
						<div class="titleHeader clearfix">
							<h3>Shop By Price</h3>
						</div><!--end titleHeader-->
						<div class="price-range">
							<p class="clearfix">
							  <label>Price:</label>
							  <input type="text" id="amount">
							</p>
							<div id="slider-range"></div>
						</div>
					</div><!--end pro-range-slider-->


					<div class="special">
						<div class="titleHeader clearfix">
							<h3>Special</h3>
						</div><!--end titleHeader-->

						<ul class="vProductItemsTiny">
							<li class="span4 clearfix">
								<div class="thumbImage">
									<a href=""><img src="img/92x92.jpg" alt=""></a>
								</div>
								<div class="thumbSetting">
									<div class="thumbTitle">
										<a href="#" class="invarseColor">
											Foliomania the title here
										</a>
									</div>
									<div class="thumbPrice">
										<span>$150.00</span>
									</div>
									<ul class="rating">
										<li><i class="star-off"></i></li>
										<li><i class="star-off"></i></li>
										<li><i class="star-off"></i></li>
										<li><i class="star-off"></i></li>
										<li><i class="star-off"></i></li>
									</ul>
								</div>
							</li>
							<li class="span4 clearfix">
								<div class="thumbImage">
									<a href=""><img src="img/92x92.jpg" alt=""></a>
								</div>
								<div class="thumbSetting">
									<div class="thumbTitle">
										<a href="#" class="invarseColor">
											Foliomania the designer portfolio
										</a>
									</div>
									<div class="thumbPrice">
										<span>$150.00</span>
									</div>
									<ul class="rating">
										<li><i class="star-on"></i></li>
										<li><i class="star-on"></i></li>
										<li><i class="star-on"></i></li>
										<li><i class="star-off"></i></li>
										<li><i class="star-off"></i></li>
									</ul>
								</div>
							</li>
							<li class="span4 clearfix">
								<div class="thumbImage">
									<a href=""><img src="img/92x92.jpg" alt=""></a>
								</div>
								<div class="thumbSetting">
									<div class="thumbTitle">
										<a href="#" class="invarseColor">
											Foliomania the designer portfolio
										</a>
									</div>
									<div class="thumbPrice">
										<span>$150.00</span>
									</div>
									<ul class="rating">
										<li><i class="star-on"></i></li>
										<li><i class="star-on"></i></li>
										<li><i class="star-on"></i></li>
										<li><i class="star-off"></i></li>
										<li><i class="star-off"></i></li>
									</ul>
								</div>
							</li>
							<li class="span4 clearfix">
								<div class="thumbImage">
									<a href=""><img src="img/92x92.jpg" alt=""></a>
								</div>
								<div class="thumbSetting">
									<div class="thumbTitle">
										<a href="#" class="invarseColor">
											Foliomania the designer portfolio
										</a>
									</div>
									<div class="thumbPrice">
										<span>$150.00</span>
									</div>
								</div>
							</li>
						</ul>
					</div><!--end special-->

				</aside><!--end aside-->


				<div class="span9">

					<div class="row listProducts">
						
					</div><!--end row-->

				</div><!--end span9-->

			</div><!--end row-->

		</div><!--end conatiner-->
</asp:Content>
