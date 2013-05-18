<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Footer.ascx.cs" Inherits="eProject_SEM3_G1.Master_Page.UserControl.Footer" %>
<div class="footerOuter">
			<div class="container">
				<div class="row-fluid">

					<div class="span6">
						<div class="titleHeader clearfix">
							<h3>Usefull Links</h3>
						</div>

						
						<div class="usefullLinks">
							<div class="row-fluid">
								<div class="span6">
									<ul class="unstyled">
										<li><a class="invarseColor" ID="aboutUsLink" runat="server"><i class="icon-caret-right"></i> About Us</a></li>
										<li><a class="invarseColor" ID="deliveryLink" runat="server"><i class="icon-caret-right"></i> Delivery Information</a></li>
										<li><a class="invarseColor" ID="privacyLink" runat="server"><i class="icon-caret-right"></i> Privacy Policy</a></li>
										<li><a class="invarseColor" ID="termLink" runat="server"><i class="icon-caret-right"></i> Terms &amp; Conditions</a></li>
									</ul>
								</div>

								<div class="span6">
									<ul class="unstyled">
										<li><a class="invarseColor" ID="supportLink" runat="server"><i class="icon-caret-right"></i> Customer Support</a></li>
										<li><a class="invarseColor" href="sitemap.xml"><i class="icon-caret-right"></i> Browse Site Map</a></li>
									</ul>
								</div>
							</div>
						</div>

					</div><!--end span6-->

					<div class="span3">
						<div class="titleHeader clearfix">
							<h3>Contact Info</h3>
						</div>

						<div class="contactInfo">
							<ul class="unstyled">
								<li>
									<button class="btn btn-small">
										<i class="icon-volume-up"></i>
									</button>
									Call Us: <a class="invarseColor" ID="contactPhoneLink" runat="server">5246-4697-891</a>
								</li>
								<li>
									<button class="btn btn-small">
										<i class="icon-envelope-alt"></i>
									</button>
									<a class="invarseColor" ID="contactEmailLink" runat="server">shopfine@shopfine.com</a>
								</li>
								<li ID="contactAddress" runat="server">
									<button class="btn btn-small">
										<i class="icon-map-marker"></i>
									</button>
									22 Avenue Park, Los Angeles
								</li>
							</ul>
						</div>

					</div><!--end span3-->

					<div class="span3">
						<div class="titleHeader clearfix">
							<h3>Newslatter</h3>
						</div>

						<div class="newslatter">
							<form method="get" action="page">
								<input class="input-block-level" type="text" name="email" value="" placeholder="Your Name...">
								<input class="input-block-level" type="text" name="email" value="" placeholder="Your E-Mail...">
								<button class="btn btn-block" type="submit" name="">Join Us Now</button>
							</form>
						</div>

					</div><!--end span3-->

				</div><!--end row-fluid-->

			</div><!--end container-->
		</div><!--end footerOuter-->

		<div class="container">
			<div class="row">
				<div class="span12">
					<ul class="payments inline pull-right">
						<li class="visia"></li>
						<li class="paypal"></li>
						<li class="electron"></li>
						<li class="discover"></li>
					</ul>
					<p id="copyrightInformation" runat="server">© Copyrights 2012 for shopfine.com</p>
				</div>
			</div>
		</div>