<%@ Page Title="" Language="C#" MasterPageFile="~/Master Page/AdminPage.Master" AutoEventWireup="true" CodeBehind="OrderStatistic.aspx.cs" Inherits="eProject_SEM3_G1.admin.OrderStatistic" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderAppend" runat="server">
    <script src="theme/scripts/chart_data_loader/order_loader.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="heading-buttons">
	<h3 class="glyphicons adress_book"><i></i> Bookings</h3>
	<div class="buttons pull-right">
		<a href="" class="btn btn-primary btn-icon glyphicons circle_plus"><i></i> Add booking</a>
	</div>
	<div class="clearfix"></div>
    </div>
<div class="separator" style="height: 5px;">&nbsp;</div>

<div class="filter-bar filter-bar-2 margin-bottom-none">
	<form>
		<div class="lbl glyphicons cogwheel"><i></i>Filter</div>
		<div>
			<label>From:</label>
			<div class="input-append">
				<input type="text" name="from" id="dateRangeFrom" class="input-mini" value="08/05/13" style="width: 53px;" />
				<span class="add-on glyphicons calendar"><i></i></span>
			</div>
		</div>
		<div>
			<label>To:</label>
			<div class="input-append">
				<input type="text" name="to" id="dateRangeTo" class="input-mini" value="08/18/13" style="width: 53px;" />
				<span class="add-on glyphicons calendar"><i></i></span>
			</div>
		</div>
		<div>
			<label>Select:</label>
			<select name="from" style="width: 80px;">
				<option>Some option</option>
				<option>Other option</option>
				<option>Some other option</option>
			</select>
		</div>
		<div class="clearfix"></div>
	</form>
</div>

<div class="widget widget-2" style="margin-top: -1px;" id="MainContent" runat="server">
	<div class="widget-head">
		<h4 class="heading glyphicons calendar"><i></i> Friday, 14 December 2012</h4>
	</div>
	<div class="widget-body">
		<div class="separator bottom form-inline small">
			<span class="pull-right">
				<label class="strong">Sort by:</label>
				<select class="selectpicker" data-style="btn-default btn-small">
					<option>Date</option>
					<option>Status</option>
					<option>Amount</option>
				</select>
			</span>
		</div>
		<table class="table table-bordered table-condensed table-striped table-primary table-vertical-center checkboxs">
			<thead>
				<tr>
					<th style="width: 1%;" class="uniformjs"><input type="checkbox" /></th>
					<th class="center">Order Id</th>
					<th class="center">Time</th>
					<th class="center">Customer name</th>
					<th class="center">Amount</th>
					<th class="center" style="width: 90px;">Actions</th>
				</tr>
			</thead>
			<tbody>
			<tr class="selectable">
					<td class="center uniformjs"><input type="checkbox" /></td>
					<td class="center">1</td>
					<td class="center">11:00</td>
					<td><strong>David Beckham</strong></td>
					<td class="center">$1438</td>
					<td class="center">
						<a href="#" class="btn-action glyphicons eye_open btn-info"><i></i></a>
						<a href="#" class="btn-action glyphicons pencil btn-success"><i></i></a>
						<a href="#" class="btn-action glyphicons remove_2 btn-danger"><i></i></a>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="separator top form-inline small">
			<div class="pull-left checkboxs_actions hide">
				<label class="strong">With selected:</label>
				<select class="selectpicker" data-style="btn-default btn-small">
					<option>Action</option>
					<option>Action</option>
					<option>Action</option>
				</select>
			</div>
			<div class="pagination pagination-small pull-right" style="margin: 0;">
				<ul>
					<li class="disabled"><a href="#">&laquo;</a></li>
					<li class="active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">&raquo;</a></li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<div class="innerLR">
<div class="row-fluid">
	<div class="span4">
		<div class="widget widget-3">
			<div class="widget-head">
				<h4 class="heading"><span class="glyphicons coins"><i></i></span>Total amount</h4>
			</div>
			<div class="widget-body large">
				&euro;15,368.50
			</div>
			<div class="widget-footer align-right">
				<a href="#" class="glyphicons print"><i></i> Print</a>
				<a href="#" class="glyphicons list"><i></i> View</a>
			</div>
		</div>
	</div>
	<div class="span4">
		<div class="widget widget-3">
			<div class="widget-head">
				<h4 class="heading"><span class="glyphicons user_add"><i></i></span>New clients</h4>
			</div>
			<div class="widget-body large">
				21
			</div>
			<div class="widget-footer">
				<a href="#" class="glyphicons print"><i></i> Print</a>
				<a href="#" class="glyphicons list"><i></i> View</a>
			</div>
		</div>
	</div>
	<div class="span4">
		<div class="widget widget-3">
			<div class="widget-head">
				<h4 class="heading"><span class="glyphicons user_remove"><i></i></span>Cancellations</h4>
			</div>
			<div class="widget-body large cancellations">
				4 
				<span>
					<span>Lost</span>
					<span>&euro;89.00</span>
				</span>
			</div>
			<div class="widget-footer align-center">
				<a href="#" class="glyphicons print"><i></i> Print</a>
				<a href="#" class="glyphicons list"><i></i> View</a>
			</div>
		</div>
	</div>
</div>
</div>
</asp:Content>
