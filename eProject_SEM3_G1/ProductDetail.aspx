<%@ Page Title="" Language="C#" MasterPageFile="~/Master Page/MainMP.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="eProject_SEM3_G1.ProductDetail" %>
<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleTextContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderAppend" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
<div class="container" ID="content_place" runat="server">

			<div class="row">
				
				<div class="span9">
					<div class="row">

						<div class="product-details clearfix">
							<div class="span5">
								<div class="product-title">
									<h4 ID="productName" runat="server">Foliomania the designer portfolio brochure</h4>
								</div>
								<div class="product-img">
									<a class="fancybox" href="img/650x700.jpg" ID="imageHref" runat="server"><img src="img/372x370.jpg" alt="" ID="imageUrl" runat="server"></a>
								</div><!--end product-img-->
							</div><!--end span5-->

							<div class="span4">
								<div class="product-set">
									<div class="product-price">
										<span ID="price" runat="server">$150.00</span>
									</div><!--end product-price-->
									<div class="product-info">
										<dl class="dl-horizontal" ID="productInfoDL" runat="server">
										  <dt>Availabilty:</dt>
										  <dd>Available In Stock</dd>

										  <dt>Product Code:</dt>
										  <dd>No. CtAw9458</dd>

										  <dt>Manfactuer:</dt>
										  <dd>Nicka Corparation</dd>

										   <dt>Review Points:</dt>
										  <dd>25 Points</dd>
										</dl>
									</div><!--end product-info-->
									<div class="product-inputs">
										<form method="post" id="add-to-cart-form">
											<div class="controls-row">
											    <select class="span4" name="#" ID="quantity" runat="server">
												    <option>-- Select Quantity --</option>
												    <option value="">Red</option>
												    <option value="">Blue</option>
												    <option value="">Brown</option>
											    </select>
											</div><!--end controls-row-->
                                            <input type="hidden" name="product-id" value="" id="productID" runat="server" />
											<div class="input-append">
											<button class="btn btn-primary"><i class="icon-shopping-cart"></i> Add To Cart</button>
											</div>
											
										</form><!--end form-->

									</div><!--end product-inputs-->
								</div><!--end product-set-->
							</div><!--end span4-->

						</div><!--end product-details-->

					</div><!--end row-->


					<div class="product-tab">
						<ul class="nav nav-tabs">
						  <li class="active">
						  	<a href="#description" data-toggle="tab">Description</a>
						  </li>
						  <li>
						  	<a href="#shipping-info" data-toggle="tab">Shipping info</a>
						  </li>
						  <li>
						  	<a href="#return-info" data-toggle="tab">Return Info</a>
						  </li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="description">
								<p id="descriptionProduct" runat="server">
									Suspendisse potenti. In non nisl sem, eu rutrum augue. Donec eu dolor vel massa ornare cursus id eget erat. Mauris in ante magna. Curabitur eget risus mi, non interdum lacus. Duis magna leo, rhoncus eget malesuada quis, semper a quam. Morbi imperdiet imperdiet lectus ac pellentesque. Integer diam sem, vulputate in feugiat ut, porttitor eu libero. Integer non dolor ipsum. Cras condimentum mattis turpis quis vestibulum. Nulla a augue ipsum. Donec aliquam velit vel metus fermentum dictum sodales metus condimentum. Nullam id massa quis nulla molestie ultrices eget sed nulla. Cras feugiat odio at tellus euismod lacinia.
									Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer a eros neque. In sapien est, malesuada non interdum id, cursus vel neque. Curabitur quis sem vel justo dictum ullamcorper ac vehicula lacus. Duis nisi dolor, suscipit id adipiscing ac, vestibulum in magna. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Fusce ut metus sem. Etiam in odio eu metus ornare convallis in sit amet lorem.

									Suspendisse potenti. In non nisl sem, eu rutrum augue. Donec eu dolor vel massa ornare cursus id eget erat. Mauris in ante magna. Curabitur eget risus mi, non interdum lacus. Duis magna leo, rhoncus eget malesuada quis, semper a quam. Morbi imperdiet imperdiet lectus ac pellentesque. Integer diam sem, vulputate in feugiat ut, porttitor eu libero. Integer non dolor ipsum. Cras condimentum mattis turpis quis vestibulum. Nulla a augue ipsum. Donec aliquam velit vel metus fermentum dictum sodales metus condimentum. Nullam id massa quis nulla molestie ultrices eget sed nulla. Cras feugiat odio at tellus euismod lacinia.
								</p>
								
							</div>
							<div class="tab-pane" id="shipping-info">
								<h4>Read our Shipping info</h4><br>
								<p>
									Suspendisse potenti. In non nisl sem, eu rutrum augue. Donec eu dolor vel massa ornare cursus id eget erat. Mauris in ante magna. Curabitur eget risus mi, non interdum lacus. Duis magna leo, rhoncus eget malesuada quis, semper a quam. Morbi imperdiet imperdiet lectus ac pellentesque. Integer diam sem, vulputate in feugiat ut, porttitor eu libero. Integer non dolor ipsum. Cras condimentum mattis turpis quis vestibulum. Nulla a augue ipsum. Donec aliquam velit vel metus fermentum dictum sodales metus condimentum. Nullam id massa quis nulla molestie ultrices eget sed nulla. Cras feugiat odio at tellus euismod lacinia.
									
								</p>
							</div>
							<div class="tab-pane" id="return-info">
								<h4>Read our Returning info</h4><br>
								<p>
									Suspendisse potenti. In non nisl sem, eu rutrum augue. Donec eu dolor vel massa ornare cursus id eget erat. Mauris in ante magna. Curabitur eget risus mi, non interdum lacus. Duis magna leo, rhoncus eget malesuada quis, semper a quam. Morbi imperdiet imperdiet lectus ac pellentesque. Integer diam sem, vulputate in feugiat ut, porttitor eu libero. Integer non dolor ipsum. Cras condimentum mattis turpis quis vestibulum. Nulla a augue ipsum. Donec aliquam velit vel metus fermentum dictum sodales metus condimentum. Nullam id massa quis nulla molestie ultrices eget sed nulla. Cras feugiat odio at tellus euismod lacinia.
									
								</p>
							</div>

                            </form>
						</div><!--end tab-content-->
					</div><!--end product-tab-->


					<div class="related-product">
						<div class="titleHeader clearfix">
							<h3>Related Product</h3>
						</div><!--end titleHeader-->

						<div class="row">
						<ul class="hProductItems clearfix">
							<li class="span3 clearfix">
								<div class="thumbnail">
									<a href=""><img src="img/212x192.jpg" alt=""></a>
								</div>
								<div class="thumbSetting">
									<div class="thumbTitle">
										<a href="#" class="invarseColor">
											Foliomania the designer portfolio brochure
										</a>
									</div>
									<div class="thumbPrice">
										<span>$150.00</span>
									</div>

									<div class="thumbButtons">
										<button class="btn btn-primary btn-small" data-title="+To Cart" data-placement="top" data-toggle="tooltip">
											<i class="icon-shopping-cart"></i>
										</button>
										<button class="btn btn-small" data-title="+To WishList" data-placement="top" data-toggle="tooltip">
											<i class="icon-heart"></i>
										</button>
									
										<button class="btn btn-small" data-title="+To Compare" data-placement="top" data-toggle="tooltip">
											<i class="icon-refresh"></i>
										</button>
									</div>

									<ul class="rating">
										<li><i class="star-on"></i></li>
										<li><i class="star-on"></i></li>
										<li><i class="star-on"></i></li>
										<li><i class="star-on"></i></li>
										<li><i class="star-off"></i></li>
									</ul>
								</div>
							</li>
							<li class="span3 clearfix">
								<div class="thumbnail">
									<a href=""><img src="img/212x192.jpg" alt=""></a>
								</div>
								<div class="thumbSetting">
									<div class="thumbTitle">
										<a href="#" class="invarseColor">
											Foliomania the designer portfolio brochure
										</a>
									</div>
									<div class="thumbPrice">
										<span>$150.00</span>
									</div>

									<div class="thumbButtons">
										<button class="btn btn-primary btn-small" data-title="+To Cart" data-placement="top" data-toggle="tooltip">
											<i class="icon-shopping-cart"></i>
										</button>
										<button class="btn btn-small" data-title="+To WishList" data-placement="top" data-toggle="tooltip">
											<i class="icon-heart"></i>
										</button>
									
										<button class="btn btn-small" data-title="+To Compare" data-placement="top" data-toggle="tooltip">
											<i class="icon-refresh"></i>
										</button>
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
							<li class="span3 clearfix">
								<div class="thumbnail">
									<a href=""><img src="img/212x192.jpg" alt=""></a>
								</div>
								<div class="thumbSetting">
									<div class="thumbTitle">
										<a href="#" class="invarseColor">
											Foliomania the designer portfolio brochure
										</a>
									</div>
									<div class="thumbPrice">
										<span>$150.00</span>
									</div>

									<div class="thumbButtons">
										<button class="btn btn-primary btn-small" data-title="+To Cart" data-placement="top" data-toggle="tooltip">
											<i class="icon-shopping-cart"></i>
										</button>
										<button class="btn btn-small" data-title="+To WishList" data-placement="top" data-toggle="tooltip">
											<i class="icon-heart"></i>
										</button>
									
										<button class="btn btn-small" data-title="+To Compare" data-placement="top" data-toggle="tooltip">
											<i class="icon-refresh"></i>
										</button>
									</div>
								</div>
							</li>
						</ul>
						</div><!--end row-->
					</div><!--end related-product-->

				</div><!--end span9-->


				<aside class="span3">
				<div class="aside-inner" id="product-aside">
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
									<a href=""><img src="img/212x192.jpg" alt=""></a>
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




				</div><!--end aside-inner-->
				</aside><!--end span3-->

			</div><!--end row-->

		</div><!--end conatiner-->
</asp:Content>
