<%@ Page Title="" Language="C#" MasterPageFile="~/Master Page/AdminPage.Master" AutoEventWireup="true" CodeBehind="IncomeStatistic.aspx.cs" Inherits="eProject_SEM3_G1.admin.IncomeStatistic" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderAppend" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="innerLR">
	<div class="widget widget-gray widget-body-white">
		<div class="widget-head">
			<h4 class="heading">Lines chart with fill & without points</h4>
		</div>
		<div class="widget-body">
			<div id="chart_lines_fill_nopoints" style="height: 250px;"></div>
		</div>
	</div>
</div>
</asp:Content>
