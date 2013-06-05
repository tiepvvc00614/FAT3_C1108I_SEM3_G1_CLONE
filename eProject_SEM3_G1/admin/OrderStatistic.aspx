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

<div class="widget widget-2 order-statistic-content" style="margin-top: -1px;" id="MainContent" runat="server">
    <img src="theme/images/ajax-loader.gif" align="center" style="display: block;margin-left: auto; margin-right: auto; margin-top:20px; margin-bottom:20px;" />
</div>
</asp:Content>
