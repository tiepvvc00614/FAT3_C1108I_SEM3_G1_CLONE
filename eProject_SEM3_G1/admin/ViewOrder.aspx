<%@ Page Title="" Language="C#" MasterPageFile="~/Master Page/AdminPage.Master" AutoEventWireup="true" CodeBehind="ViewOrder.aspx.cs" Inherits="eProject_SEM3_G1.admin.ViewOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderAppend" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="heading-buttons">
	<h3 class="glyphicons adress_book"><i></i> View Order</h3>
	<div class="clearfix"></div>
</div>
<div class="separator" style="height: 5px;">&nbsp;</div>
<div class="widget widget-2" style="margin-top: -1px;" id="MainContent" runat="server">
    	<div class="widget-head">
		    <h4 class="heading glyphicons calendar"><i></i> 
			    Customer Information
		    </h4>
	    </div>
        <div class="widget-body">
                <table class="table table-condensed">
				<tbody>
					<tr>
						<td style="width: 50%;"><b>Name:</b></td>
						<td style="width: 50%;">Linda E. Crenshaw</td>
					</tr>
					<tr>
						<td><b>Company: </b></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td><b>Customer Email:</b></td>
						<td>admin@bookshop.com</td>
					</tr>
                    <tr>
						<td><b>Phone Contact:</b></td>
						<td>768-574-7849</td>
					</tr>
                    <tr>
						<td><b>Fax:</b></td>
						<td>&nbsp;</td>
					</tr>
				</tbody>
			   </table>
        </div>
        <div class="widget-head">
		    <h4 class="heading glyphicons calendar"><i></i> 
			    Billing Information
		    </h4>
	    </div>
        <div class="widget-body">
                <table class="table table-condensed">
				<tbody>
					<tr>
						<td style="width: 50%;"><b>Billing Address:</b></td>
						<td style="width: 50%;">5095 N. La Canada Dr. 101</td>
					</tr>
					<tr>
						<td style="width: 50%;"><b>Billing Address 2: </b></td>
						<td style="width: 50%;">&nbsp;</td>
					</tr>
					<tr>
						<td style="width: 50%;"><b>Billing City:</b></td>
						<td style="width: 50%;">Tucson</td>
					</tr>
                    <tr>
						<td style="width: 50%;"><b>Billing State:</b></td>
						<td style="width: 50%;">AZ</td>
					</tr>
                    <tr>
						<td style="width: 50%;"><b>Billing Postcode:</b></td>
						<td style="width: 50%;">96848</td>
					</tr>
                    <tr>
						<td style="width: 50%;"><b>Phone Contact:</b></td>
						<td style="width: 50%;">559-674-3758</td>
					</tr>
				</tbody>
			   </table>
        </div>
        <div class="widget-head">
		    <h4 class="heading glyphicons calendar"><i></i> 
			    Shipping Information
		    </h4>
	    </div>
        <div class="widget-body">
            <table class="table table-condensed">
				<tbody>
                    <tr>
						<td style="width: 50%;"><b>Receiver Name:</b></td>
						<td style="width: 50%;">Eduardo Garcia</td>
					</tr>
					<tr>
						<td style="width: 50%;"><b>Shipping Address:</b></td>
						<td style="width: 50%;">8548 nw. 66st.</td>
					</tr>
					<tr>
						<td style="width: 50%;"><b>Shipping Address 2: </b></td>
						<td style="width: 50%;">&nbsp;</td>
					</tr>
					<tr>
						<td style="width: 50%;"><b>Shipping City:</b></td>
						<td style="width: 50%;">Miami</td>
					</tr>
                    <tr>
						<td style="width: 50%;"><b>Shipping State:</b></td>
						<td style="width: 50%;">FL</td>
					</tr>
                    <tr>
						<td style="width: 50%;"><b>Shipping Postcode:</b></td>
						<td style="width: 50%;">33166</td>
					</tr>
                    <tr>
						<td style="width: 50%;"><b>Phone Contact:</b></td>
						<td style="width: 50%;">675-675-6759</td>
					</tr>
				</tbody>
			   </table>
        </div><br />

 
                <table class="table table-bordered table-primary">
				<thead>
					<tr>
						<th style="width: 80%;">Item</th>
						<th style="width:5%;">Quantity</th>
						<th style="width: 15%;">Subtotal</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Da vinci code / ITEM #46472</td>
						<td>1</td>
						<td>$50</td>
					</tr>
					<tr>
						<td><b>TAX</b></td>
						<td>&nbsp;</td>
						<td>$30</td>
					</tr>
					<tr>
						<td><b>HANDLING</b></td>
						<td>&nbsp;</td>
						<td>$3.5</td>
					</tr>
                    <tr>
						<td><b>GRAND TOTAL</b></td>
						<td>&nbsp;</td>
						<td><b>$83.5</b></td>
					</tr>
				</tbody>
			</table>
            
</div>
</asp:Content>
