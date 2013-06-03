<%@ Page Title="" Language="C#" MasterPageFile="~/Master Page/AdminPage.Master" AutoEventWireup="true" CodeBehind="IncomeStatistic.aspx.cs" Inherits="eProject_SEM3_G1.admin.IncomeStatistic" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderAppend" runat="server">
<script src="theme/scripts/flot/jquery.flot.js" type="text/javascript"></script>
<script src="theme/scripts/flot/jquery.flot.pie.js" type="text/javascript"></script>
<script src="theme/scripts/flot/jquery.flot.tooltip.js" type="text/javascript"></script>
<script src="theme/scripts/flot/jquery.flot.selection.js"></script>
<script src="theme/scripts/flot/jquery.flot.resize.js" type="text/javascript"></script>
<script src="theme/scripts/flot/jquery.flot.orderBars.js" type="text/javascript"></script>
<script src="theme/scripts/flot/jquery.flot.orderBars.js" type="text/javascript"></script>
<script src="theme/scripts/chart_data_loader/income_loader.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="innerLR">
	<div class="widget widget-gray widget-body-white">
		<div class="widget-head">
			<h4 class="heading">Income statistic</h4>
		</div>
        <div class="widget-body" style="padding: 10px 0 0;">
            <form id="show-income">
                <div class="row-fluid">
			        <div class="span6">
			
			        <div class="widget widget-4">
				        <div class="widget-head"><h4 class="heading">From date</h4></div>
				        <div class="separator"></div>
				        <div class="row-fluid">
                        <div class="control-group">
                            <input type="text" id="dateRangeFrom" value="" class="span12" />
                            </div>
				        </div>
			        </div>
			        </div>
			        <div class="span6">
			
			        <div class="widget widget-4 row-fluid">
				        <div class="widget-head"><h4 class="heading">From date</h4></div>
				        <div class="separator"></div>
				        <div class="row-fluid">
                        <div class="input-append">
				  	        <input class="span6" id="dateRangeTo" type="text" />
				  	        <button class="btn" type="submit">Show</button>
				        </div>
				
			            </div>
                    </div>
			
			        </div>
			        </div>
                    <div id="chart_lines_fill_nopoints" style="height: 250px;">
                        <img src="theme/images/ajax-loader.gif" align="center" style="display: block;margin-left: auto; margin-right: auto; margin-top:auto; margin-bottom:auto;" />
                    </div>
            </form>
			
		</div>
        


</div>
</asp:Content>
