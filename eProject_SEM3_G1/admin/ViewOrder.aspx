<%@ Page Title="" Language="C#" MasterPageFile="~/Master Page/AdminPage.Master" AutoEventWireup="true" CodeBehind="ViewOrder.aspx.cs" Inherits="eProject_SEM3_G1.admin.ViewOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderAppend" runat="server">
    <script src="theme/scripts/chart_data_loader/order_details_loader.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="heading-buttons">
	<h3 class="glyphicons adress_book" id="orderIdText" ><i></i> View Order: Loading. . . </h3>
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
         <img src="theme/images/ajax-loader.gif" id="ajaxLoader" align="center" style="display: block;margin-left: auto; margin-right: auto; margin-top:30px; margin-bottom:auto;" />
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
