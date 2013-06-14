<%@ Page Title="" Language="C#" MasterPageFile="~/Master Page/MainMP.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="eProject_SEM3_G1.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleTextContentPlaceHolder" runat="server">
- Register new account
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderAppend" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
<div class="container">

			<div class="row">

				<div class="span12">
					<div class="register">

						<div class="titleHeader clearfix">
							<h3>Create New Account</h3>
						</div><!--end titleHeader-->

						<form id="registerForm" class="form-horizontal">

							<h4>&nbsp;&nbsp;&nbsp;&nbsp;1. Personal Informations</h4>

							<div class="control-group">
							    <label class="control-label" for="inputFirstName">First Name: <span class="text-error">*</span></label>
							    <div class="controls">
							      <input type="text" name="firstName" id="inputFirstName" placeholder="John">
							      <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
							    </div>
							</div><!--end control-group-->

							<div class="control-group">
							    <label class="control-label" for="inputLastName">Last Name: <span class="text-error">*</span></label>
							    <div class="controls">
							      <input type="text" name="lastName" id="inputLastName" placeholder="Doe">
							      <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
							    </div>
							</div><!--end control-group-->

							<div class="control-group">
							    <label class="control-label" for="inputEMAdd">E-Mail Address: <span class="text-error">*</span></label>
							    <div class="controls">
							      <input type="text" name="email" id="inputEMAdd" typeValid="email" placeholder="example@example.com">
                                  <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
							    </div>
							</div><!--end control-group-->

							<div class="control-group">
							    <label class="control-label" for="inputTele">Telephone: <span class="text-error">*</span></label>
							    <div class="controls">
							      <input type="text" name="phone" id="inputTele" typeValid="phone" placeholder="0957182748">
                                  <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
							    </div>
							</div><!--end control-group-->

							<div class="control-group">
							    <label class="control-label" for="inputFAX">FAX:</label>
							    <div class="controls">
							      <input type="text" name="fax" id="inputFAX" placeholder="478-986-14">
                                  <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
							    </div>
							</div><!--end control-group-->

							<h4>&nbsp;&nbsp;&nbsp;&nbsp;2. Delivery Informations</h4>

							<div class="control-group">
							    <label class="control-label" for="inputCompany">Company:</label>
							    <div class="controls">
							      <input type="text" name="company" id="inputCompany" placeholder="Google, INC">
                                  <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
							    </div>
							</div><!--end control-group-->

							<div class="control-group">
							    <label class="control-label" for="inputFirstAdd">First Address: <span class="text-error">*</span></label>
							    <div class="controls">
							      <input type="text" name="firstAddress" id="inputFirstAdd" placeholder="3st el-hikem">
                                  <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
							    </div>
							</div><!--end control-group-->

							<div class="control-group">
							    <label class="control-label" for="inputSecondAdd">Second Address:</label>
							    <div class="controls">
							      <input type="text" name="secondAddress" id="inputSecondAdd" placeholder="6st el-hikem">
                                  <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
							    </div>
							</div><!--end control-group-->

							<div class="control-group">
							    <label class="control-label" for="inputCity">City: <span class="text-error">*</span></label>
							    <div class="controls">
							      <input type="text" name="city" id="inputCity" placeholder="New York">
                                  <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
							    </div>
							</div><!--end control-group-->

							<div class="control-group">
							    <label class="control-label" for="inputPostCode">Post Code: <span class="text-error">*</span></label>
							    <div class="controls">
							      <input type="text" name="zipcode" id="inputPostCode" placeholder="43331">
                                  <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
							    </div>
							</div><!--end control-group-->

							<div class="control-group">
							    <div class="control-label">Country: <span class="text-error">*</span></div>
							    <div class="controls">
							      <select name="country" id="inputCountry">
							      	<option value="">-- Select Contury --</option>
							      	<option value="VN">Vietnam</option>
							      	<option value="US">United States</option>
							      	<option value="UK">United Kingdom</option>
							      	<option value="AU">Australia</option>
							      </select>
                                  <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
							    </div>

							</div><!--end control-group-->

							<div class="control-group">
							    <div class="control-label">Region/State: <span class="text-error">*</span></div>
							    <div class="controls">
							      <select name="state" id="inputRegion">
							      	<option value="#">-- Select Region --</option>
							      	<option value="OH">Ohio</option>
							      	<option value="TX">Texas</option>
							      	<option value="NY">New York</option>
							      	<option value="CA">California</option>
							      	<option value="OK">Okhalma</option>
							      </select>
                                  <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
							    </div>
							</div><!--end control-group-->

							<h4>&nbsp;&nbsp;&nbsp;&nbsp;3. Set Your Password</h4>

							<div class="control-group">
							    <label class="control-label" for="inputPass">Password: <span class="text-error">*</span></label>
							    <div class="controls">
							      <input type="password" name="password" id="inputPass" placeholder="**********">
                                  <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
							    </div>
							</div><!--end control-group-->

							<div class="control-group">
							    <label class="control-label" for="inputConPass">Re-Type Password: <span class="text-error">*</span></label>
							    <div class="controls">
							      <input type="password" name="repassword" id="inputConPass" placeholder="**********">
                                  <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
							    </div>
							</div><!--end control-group-->

							<hr>

							<div class="control-group">
							    <div class="controls">
							        <label class="checkbox">
								      <input type="checkbox" name="agreeTerm" id="inputAgreeTerm"> I'v read and agreed on <a href="#">Terms &amp; Condations</a>
                                      
								    </label>
								    <br/>
								    <button type="submit" class="btn btn-primary">Register</button>
							    </div>
							</div><!--end control-group-->

						</form><!--end form-->

					</div><!--end register-->
				</div><!--end span9-->
			</div><!--end row-->

		</div><!--end conatiner-->
</asp:Content>
