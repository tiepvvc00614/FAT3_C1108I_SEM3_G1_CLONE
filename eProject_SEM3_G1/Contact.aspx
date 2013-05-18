<%@ Page Title="" Language="C#" MasterPageFile="~/Master Page/MainMP.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="eProject_SEM3_G1.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleTextContentPlaceHolder" runat="server">
- Contact Us
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderAppend" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
<div class="container">

			<div class="row">

				<div class="span4">
					<div class="contact-info">
						<div class="titleHeader clearfix">
							<h3>Contact Information</h3>
						</div><!--end titleHeader-->

						<address>
						   <strong><i class="icon-pushpin"></i> Address Info:</strong><br>
						   <strong>ShopFine, Inc.</strong><br>
						    795 Folsom Ave, Suite 600<br>
						    San Francisco, CA 94107<br>
						    <abbr title="Phone">P:</abbr> (123) 456-7890
						</address>

						<address>
						   <strong><i class="icon-volume-up"></i> Give Us a call on:</strong><br>
						    (123) 456-7890 OR (526) 666-7892
						</address>

						<address>
						   <strong><i class="icon-envelope-alt"></i> E-Mail Us on:</strong><br>
						    <abbr title="Phone">foe Support:</abbr> <a href="mailto:example@example.com">shopfine_no1@shopfine.com</a><br>
						    <abbr title="Phone">for Sales:</abbr> <a href="mailto:example22@example.com">shopfine_no2@shopfine.com</a>
						</address>
						
					</div><!--end contact-info-->
				</div><!--end span4-->


				<div class="span8">
					<div class="google-map">
						<iframe height="246" src="http://maps.google.com.eg/maps?f=q&amp;source=s_q&amp;hl=ar&amp;geocode=&amp;q=Tahrir,+%D9%82%D8%B5%D8%B1+%D8%A7%D9%84%D8%AF%D9%88%D8%A8%D8%A7%D8%B1%D8%A9,+%D9%82%D8%B5%D8%B1+%D8%A7%D9%84%D9%86%D9%8A%D9%84,+Al-Qahira&amp;aq=0&amp;oq=tahr&amp;sll=30.044133,31.235161&amp;sspn=0.200606,0.363579&amp;ie=UTF8&amp;hq=&amp;hnear=%D9%85%D9%8A%D8%AF%D8%A7%D9%86+%D8%A7%D9%84%D8%AA%D8%AD%D8%B1%D9%8A%D8%B1&amp;t=m&amp;z=14&amp;ll=30.0451,31.235428&amp;output=embed"></iframe>
					</div><!--end google-map-->


					<div class="contact-us-form">
						<div class="titleHeader clearfix">
							<h3>Send Us Message</h3>
						</div><!--end titleHeader-->

						<form method="post" action="page">
							<div class="controls controls-row">
							   <input class="span4" type="text" placeholder="Your Name - Required">
							   <input class="span4" type="text" placeholder="Your E-Mail - Required">
							</div>
							<div class="controls">
							   <textarea class="span8" placeholder="You Message..."></textarea>
							</div>
							<div class="controls">
							   <button type="submit" class="btn btn-primary pull-right">Send It</button>
							</div>
						</form><!--end form-->
					</div><!--end contact-us-form-->

				</div><!--end span8-->
				
			</div><!--end row-->

		</div><!--end conatiner-->
</asp:Content>
