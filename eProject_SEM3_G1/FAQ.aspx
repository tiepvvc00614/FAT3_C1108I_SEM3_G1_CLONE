<%@ Page Title="" Language="C#" MasterPageFile="~/Master Page/MainMP.Master" AutoEventWireup="true" CodeBehind="FAQ.aspx.cs" Inherits="eProject_SEM3_G1.FAQ" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleTextContentPlaceHolder" runat="server">
- Frequently Asked Questions
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderAppend" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

<div class="container">
<div class="row">
    <div class="span12">
        
					<div class="cart-accordain" id="cart-acc">

						<div class="accordion-group">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse" data-parent="#cart-acc" href="#estimate">
									<i class="icon-caret-right"></i> Estimate Shipping &amp; Taxes
								</a>
							</div>
							<div id="estimate" class="accordion-body collapse in">
								<div class="accordion-inner">
									<form class="form-horizontal">
									  <div class="control-group">
									    <div class="control-label">
									    	<strong>Your Country</strong>
									    </div>
									    <div class="controls">
									      <select name="">
									      	<option value="">-- Select Country --</option>
									      	<option value="">Country1</option>
									      	<option value="">Country2</option>
									      	<option value="">Country3</option>
									      	<option value="">Country4</option>
									      	<option value="">Country5</option>
									      	<option value="">Country6</option>
									      </select>
									    </div>
									  </div><!--end control-group-->
									  <div class="control-group">
									    <div class="control-label">
									    	<strong>Your Region</strong>
									    </div>
									    <div class="controls">
									      <select name="">
									      	<option value="">-- Select Region --</option>
									      	<option value="">region1</option>
									      	<option value="">region2</option>
									      	<option value="">region3</option>
									      	<option value="">region4</option>
									      	<option value="">region5</option>
									      	<option value="">region6</option>
									      </select>
									    </div>
									  </div><!--end control-group-->
									  <div class="control-group">
									    <label class="control-label" for="inputpostCode">
									    	<strong>Your Post Code</strong>
									    </label>
									    <div class="controls">
									      <input id="inputpostCode" placeholder="Post Code..." type="text">
									    </div>
									  </div><!--end control-group-->
									  <div class="control-group">
									    <div class="controls">
									      <button type="submit" class="btn btn-primary">Get Quotes</button>
									    </div>
									  </div><!--end control-group-->
									</form>
								</div>
							</div>
						</div><!--end accordion-group-->

						<div class="accordion-group">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse" data-parent="#cart-acc" href="#discount-code">
									<i class="icon-caret-right"></i> Apply Discount Code
								</a>
							</div>
							<div id="discount-code" class="accordion-body collapse">
								<div class="accordion-inner">
									<form class="form-horizontal">
									  <div class="control-group">
									    <label class="control-label" for="inputDiscount">
									    	<strong>Discount Code</strong>
									    	</label>
									    <div class="controls">
									      <input id="inputDiscount" placeholder="Inter Discount Code..." type="text">
									    </div>
									  </div><!--end control-group-->
									  <div class="control-group">
									    <div class="controls">
									      <button type="submit" class="btn btn-primary">Apply Coupon</button>
									    </div>
									  </div><!--end control-group-->
									</form>
								</div>
							</div>
						</div><!--end accordion-group-->

						<div class="accordion-group">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse" data-parent="#cart-acc" href="#gift-voucher">
									<i class="icon-caret-right"></i> Use Gift Voucher
								</a>
							</div>
							<div id="gift-voucher" class="accordion-body collapse">
								<div class="accordion-inner">
									<form class="form-horizontal">
									  <div class="control-group">
									    <label class="control-label" for="inputVoucher">
									    	<strong>Voucher Code</strong>
									    	</label>
									    <div class="controls">
									      <input id="inputVoucher" placeholder="Inter Voucher Code..." type="text">
									    </div>
									  </div><!--end control-group-->
									  <div class="control-group">
									    <div class="controls">
									      <button type="submit" class="btn btn-primary">Apply Voucher </button>
									    </div>
									  </div><!--end control-group-->
									</form>
								</div>
							</div>
						</div><!--end accordion-group-->

					</div><!--end cart-accordain-->
				
    </div>
</div>
</div>

</asp:Content>
