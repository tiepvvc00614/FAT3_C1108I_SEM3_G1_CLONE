<%@ Page Title="" Language="C#" MasterPageFile="~/Master Page/MainMP.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="eProject_SEM3_G1.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleTextContentPlaceHolder" runat="server">
- Login
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderAppend" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
<div class="container">
			<div class="row">
				<div class="span12">
					<div class="login">
						<table>
							<tr>
								<td>
									<h3>New Customer</h3>
									<p>By creating an account you will be able to shop faster, be up to date on an order's status, and keep track of the orders you have previously made.</p>
									<a href="#" class="btn">Register</a>
								</td>

								<td>
									<h3>Returning Customer</h3>
									<form id="loginForm">
										<div class="controls">
											<label>Your E-Mail: <span class="text-error">*</span></label>
											<input type="text" typeValid="email" id="emailLogin" placeholder="example@example.com">
                                            <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
										</div>
										<div class="controls">
											<label>Your Password: <span class="text-error">*</span></label>
											<input type="password" id="passwordLogin" placeholder="**************">
                                            <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
										</div>
										<div class="controls">
											<label class="checkbox">
										      <input type="checkbox" id="rememberLogin"> Remember me?
										    </label>
										    <button type="submit" class="btn btn-primary">Login</button>
										</div>
									</form><!--end form-->
								</td>
							</tr>
						</table>
					</div><!--end login-->
				</div><!--end span9-->
			</div><!--end row-->

		</div><!--end conatiner-->
</asp:Content>
