<%@ Page Title="" Language="C#" MasterPageFile="~/Master Page/AdminPage.Master" AutoEventWireup="true" CodeBehind="ViewOrder.aspx.cs" Inherits="eProject_SEM3_G1.admin.ViewOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderAppend" runat="server">
    <script src="theme/scripts/chart_data_loader/order_details_loader.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="heading-buttons">
	<h3 class="glyphicons adress_book"><i></i> View Order: #7575</h3>
	<div class="clearfix"></div>
</div>
<div class="separator" style="height: 5px;">&nbsp;</div>
<div class="widget widget-2 widget-tabs widget-tabs-2 tabs-right border-bottom-none">
	<div class="widget-head">
		<ul>
			<li class="active"><a class="glyphicons settings" href="#order-details" data-toggle="tab"><i></i>Order Details</a></li>
			<li><a class="glyphicons user" href="#update-order" data-toggle="tab"><i></i>Update order</a></li>
		</ul>
	</div>
</div>
<div class="tab-content" style="padding: 0;">
    <div class="tab-pane active" id="order-details">
        <div class="widget widget-2" style="margin-top: -1px;">
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
                    <table class="table table-bordered table-condensed" style="border-radius:0px;">
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
    </div>
    <div class="tab-pane" id="update-order">
        <div class="widget widget-2" style="margin-top: -1px;">
            <div class="widget-head">
		        <h4 class="heading glyphicons calendar"><i></i> 
			        Update order
		        </h4>
	        </div>
            <div class="widget-body">
                <div class="row-fluid">
                    <div class="span12">
                        <div class="control-group">
						    <label class="control-label">Status</label>
						    <div class="controls">
							    <select class="span12">
								    <option>Completed</option>
								    <option>Cancelled</option>
							    </select>
						    </div>
					    </div>
                        <div class="control-group">
						    <label class="control-label">Tracking link</label>
						    <div class="controls">
							    <input type="text" placeholder="http://example.com/tracking/trackingId=895498744" class="span12" />
						    </div>
					    </div>
                        <div class="form-actions" style="margin: 0; padding-right: 0;">
						    <button type="submit" class="btn btn-icon btn-primary glyphicons circle_ok pull-right"><i></i>Save changes</button>
					    </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

</asp:Content>
