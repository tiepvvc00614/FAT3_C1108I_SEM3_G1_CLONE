<%@ Page Title="" Language="C#" MasterPageFile="~/Master Page/AdminPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="eProject_SEM3_G1.admin.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderAppend" runat="server">
    <script src="theme/scripts/page.customization/login.page.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
		<div id="login">
	<form class="form-signin" id="login-admin-form" method="post" action="/admin/Ajax/Login.aspx">
		<div class="widget widget-4">
			<div class="widget-head">
				<h4 class="heading">Restricted area</h4>
			</div>
		</div>
		<h2 class="glyphicons unlock form-signin-heading"><i></i> Please sign in</h2>
		<div class="uniformjs">
			<input class="input-block-level text" name="username" placeholder="Username" type="text"/> 
			<input class="input-block-level password" name="password" placeholder="Password" type="password"/> 
		</div>
		<button class="btn btn-large btn-primary" type="submit">Sign in</button>
	</form>	
				
	
</div>
</asp:Content>
