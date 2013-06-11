<%@ Page Title="" Language="C#" MasterPageFile="~/Master Page/MainMP.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="eProject_SEM3_G1.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleTextContentPlaceHolder" runat="server">
- Search in site
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderAppend" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
<div class="container">

			<div class="row">

				<div class="span3">
					<div class="search">
						<div class="titleHeader clearfix">
							<h3>Search</h3>
						</div>

						<form method="get" action="page">
						  	<input name="" type="text" class="span3" placeholder="Type Search Term...">
						    <select name="" class="span3">
						  	  <option>--Select Category--</option>
						   	  <option value="1">Put Category1</option>
						  	  <option value="2">Put Category2</option>
						  	  <option value="3">Put Category3</option>
						  	  <option value="4">Put Category4</option>
						    </select>

						    <label class="checkbox">
						      <input type="checkbox"> Search in subcategories
						    </label>
						    <label class="checkbox">
						      <input type="checkbox"> Search in product descriptions
						    </label>
						    <br>
						    <button type="submit" class="btn btn-primary"><i class="icon-search"></i> Start Searching</button>
						</form><!--end form-->

					</div><!--end search-->
				</div><!--end span3-->


				<div class="span9">
					<div class="alert alert-error">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<h4>Oh, We're So Sorry</h4>
						There is no product that matches the search criteria.
					</div><!--end alert-->


					<div class="titleHeader clearfix">
						<h3>Search Result</h3>
					</div><!--end titleHeader-->

					<div class="productFilter clearfix">

						<div class="sortBy inline pull-left">
							Sort By
							<select name="">
								<option value="Default">Default</option>
								<option value="">Name (A-A)</option>
								<option value="">Name (Z-A)</option>
								<option value="">Price (Low-Hight)</option>
								<option value="">Price (Height-Low)</option>
								<option value="">Highest Rating</option>
								<option value="">Lowest Rating</option>
								<option value="">Model (A-Z)</option>
								<option value="">Model (Z-A)</option>
							</select>
						</div>

						<div class="showItem inline pull-left">
							Show
							<select name="">
								<option value="15">15</option>
								<option value="25">25</option>
								<option value="50">50</option>
								<option value="75">75</option>
								<option value="100">100</option>
							</select>
						</div><!--end sortBy-->

						<div class="compareItem inline pull-left">
							<button class="btn">Product Compare (4)</button>
						</div><!--end compareItem-->

						<div class="displaytBy inline pull-right">
							Display
							<div class="btn-group">
								<button class="btn btn-primary active"><i class="icon-th"></i></button>
								<button class="btn"><i class="icon-list"></i></button>
							</div>
						</div><!--end displaytBy-->

					</div><!--end productFilter-->


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
										<li><i class="star-off"></i></li>
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
										<li><i class="star-on"></i></li>
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
										<li><i class="star-off"></i></li>
										<li><i class="star-off"></i></li>
										<li><i class="star-off"></i></li>
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

					<div class="pagination pagination-right">
						<span class="pull-left">Showing 9 of 20 pages:</span>
						<ul>
							<li><a class="invarseColor" href="">Prev</a></li>
							<li class="active"><a class="invarseColor" href="">1</a></li>
							<li><a class="invarseColor" href="">2</a></li>
							<li><a class="invarseColor" href="">2</a></li>
							<li><a class="invarseColor" href="">3</a></li>
							<li><a class="invarseColor" href="">Next</a></li>
						</ul>
					</div><!--end pagination-->

				</div><!--end span9-->

			</div><!--end row-->

		</div><!--end conatiner-->
</asp:Content>
