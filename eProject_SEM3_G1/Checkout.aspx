<%@ Page Title="" Language="C#" MasterPageFile="~/Master Page/MainMP.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="eProject_SEM3_G1.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleTextContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderAppend" runat="server">
    <script src="js/page.customization/checkout.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
<div class="container">
	<div class="row">
		<div class="span12">
            <div id="wizard" class="wizard-default-style js">
		        <ul class="steps">
			        <li>1. Login</li>
			        <li>2. Address Information</li>
			        <li>3. Delivery options</li>
                    <li>4. Payment Information</li>
                    <li>5. Review Order</li>
                    <li>6. Complete</li>
		        </ul>
		
		        <div class="step_content">
			
			        <!-- Wizard - Step 1 -->
			        <div id="step-1" class="step one_column">
				
				        <div class="checkout-content">
							<div class="login">
								<table>
									<tr>
										<td>
											<h3>New Customer</h3>
                                            <form id="optChooseCheckout">
                                                <label class="radio">
												  <input type="radio" name="optionsRadios" value="1" checked>
												      Registeration Account.
												    </label>
												    <label class="radio">
												      <input type="radio" name="optionsRadios" value="2">
												      Continue as guest account.
												    </label>
											    <p>By creating an account you will be able to shop faster, be up to date on an order's status, and keep track of the orders you have previously made.</p>
                                                <button class="btn"><span>Next Step</span></button>
                                            </form>
												
										</td>

										<td>
											<h3>Returning Customer</h3>
											<form id="loginForm">
												<div class="controls">
													<label>Your E-Mail: <span class="text-error">*</span></label>
													<input type="text" name="" value="" placeholder="example@example.com" typeValid="email" id="emailLogin">
                                                     <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
												</div>
												<div class="controls">
													<label>Your Password: <span class="text-error">*</span></label>
													<input type="password" name="" value="" placeholder="**************" id="passwordLogin">
                                                     <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
												</div>
												<div class="controls">
													<label class="checkbox">
												      <input type="checkbox" id="rememberLogin"> Remember me?
												    </label>
                                                    <input type="submit" name="btnLoginSubmit" value="Login" class="btn" />
												</div>
											</form><!--end form-->
										</td>
									</tr>
								</table>
							</div><!--end login-->
						</div><!--end checkout-content-->
				
			        </div>
			        <!-- </Wizard - Step 1 -->
			
			        <!-- Wizard - Step 2 -->
			        <div id="step-2" class="step one_column">
				        <div class="column_one">
                        <form action="/Ajax/CheckoutValidate.aspx" class="defaultRequest" method="post" id="checkout-address-validate">
					        <div class="checkout-content">
							<div class="login">
								<table>
									<tr>
										<td>
											<h3>Billing Information</h3>
								                <div class="control-group">
								                    <label class="control-label" for="inputFirstName">First Name: <span class="text-error">*</span></label>
								                    <div class="controls">
								                      <input type="text" id="first-name-billing" name="first-name-billing" placeholder="John">
                                                      <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
								                    </div>
								                </div><!--end control-group-->

								                <div class="control-group">
								                    <label class="control-label" for="inputLastName">Last Name: <span class="text-error">*</span></label>
								                    <div class="controls">
								                      <input type="text" id="last-name-billing" name="last-name-billing" placeholder="Doe">
                                                      <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
								                    </div>
								                </div><!--end control-group-->

                                                <div class="control-group">
								                    <label class="control-label" for="inputLastName">Email: <span class="text-error">*</span></label>
								                    <div class="controls">
								                      <input type="text" id="email-contact" name="email-contact" placeholder="example@example.com" typeValid="email" />
                                                      <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
								                    </div>
								                </div><!--end control-group-->

								                <div class="control-group">
								                    <label class="control-label" for="inputCompany">Company:</label>
								                    <div class="controls">
								                      <input type="text" name="company-billing" id="company-billing" placeholder="Shopfine, INC">
								                    </div>
								                </div><!--end control-group-->

								                <div class="control-group">
								                    <label class="control-label" for="inputFirstAdd">First Address: <span class="text-error">*</span></label>
								                    <div class="controls">
								                      <input type="text" name="first-address-billing" id="first-address-billing" placeholder="3st el-hakim">
                                                      <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
								                    </div>
								                </div><!--end control-group-->

								                <div class="control-group">
								                    <label class="control-label" for="inputSecondAdd">Second Address:</label>
								                    <div class="controls">
								                      <input type="text" name="second-address-billing" id="second-address-billing" placeholder="6st el-hakim">
                                                      <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
								                    </div>
								                </div><!--end control-group-->

								                <div class="control-group">
								                    <label class="control-label" for="inputCity">City: <span class="text-error">*</span></label>
								                    <div class="controls">
								                      <input type="text" name="city-billing" id="city-billing" placeholder="Ex: New York">
                                                      <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
								                    </div>
								                </div><!--end control-group-->

								                <div class="control-group">
								                    <label class="control-label" for="inputPostCode">Post Code: <span class="text-error">*</span></label>
								                    <div class="controls">
								                      <input type="text" name="post-code-billing" id="post-code-billing" placeholder="Ex: 55421">
                                                      <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
								                    </div>
								                </div><!--end control-group-->
                                                <div class="control-group">
								                    <label class="control-label" for="inputPostCode">Phone Number: <span class="text-error">*</span></label>
								                    <div class="controls">
								                      <input type="text" name="phone-billing" id="phone-billing" placeholder="Ex: 55421">
                                                      <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
								                    </div>
								                </div><!--end control-group-->

								                <div class="control-group">
								                    <div class="control-label">Country: <span class="text-error">*</span></div>
								                    <div class="controls">
								                      <select name="country-billing">
								      	                <option>-- Select Country --</option>
								      	                <option>Vietnam</option>
								      	                <option>United State</option>
								      	                <option>United Kingdom</option>
								      	                <option>Australia</option>
								                      </select>
                                                      <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
								                    </div>
								                </div><!--end control-group-->

								                <div class="control-group">
								                    <div class="control-label">Region/Stats: <span class="text-error">*</span></div>
								                    <div class="controls">
								                      <select name="region-billing">
								      	                <option>-- Select Region --</option>
								      	                <option>New South Wales</option>
								      	                <option>South Australia</option>
								      	                <option>Victoria</option>
								      	                <option>Queenlands</option>
								      	                <option>Western Australia</option>
								                      </select>
                                                      <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
								                    </div>
								                </div><!--end control-group-->
										</td>

										<td>
											<h3>Shipping Information</h3>

								                <div class="control-group">
								                    <label class="control-label" for="inputFirstName">First Name: <span class="text-error">*</span></label>
								                    <div class="controls">
								                      <input type="text" name="first-name-shipping" id="first-name-shipping" placeholder="John">
                                                      <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
								                    </div>
								                </div><!--end control-group-->

								                <div class="control-group">
								                    <label class="control-label" for="inputLastName">Last Name: <span class="text-error">*</span></label>
								                    <div class="controls">
								                      <input type="text" name="last-name-shipping" id="last-name-shipping" placeholder="Doe">
                                                      <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
								                    </div>
								                </div><!--end control-group-->

								                <div class="control-group">
								                    <label class="control-label" for="inputCompany">Company:</label>
								                    <div class="controls">
								                      <input type="text" name="company-shipping" id="company-shipping" placeholder="Shopfine, INC">
                                                      <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
								                    </div>
								                </div><!--end control-group-->

								                <div class="control-group">
								                    <label class="control-label" for="inputFirstAdd">First Address: <span class="text-error">*</span></label>
								                    <div class="controls">
								                      <input type="text" name="first-address-shipping" id="first-address-shipping" placeholder="3st el-hakim">
                                                      <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
								                    </div>
								                </div><!--end control-group-->

								                <div class="control-group">
								                    <label class="control-label" for="inputSecondAdd">Second Address:</label>
								                    <div class="controls">
								                      <input type="text" name="second-address-shipping" id="second-address-shipping" placeholder="6st el-hakim">
                                                      <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
								                    </div>
								                </div><!--end control-group-->

								                <div class="control-group">
								                    <label class="control-label" for="inputCity">City: <span class="text-error">*</span></label>
								                    <div class="controls">
								                      <input type="text" name="city-shipping" id="city-shipping" placeholder="Cairo">
                                                      <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
								                    </div>
								                </div><!--end control-group-->

								                <div class="control-group">
								                    <label class="control-label" for="inputPostCode">Post Code: <span class="text-error">*</span></label>
								                    <div class="controls">
								                      <input type="text" name="post-code-shipping" id="post-code-shipping" placeholder="12345">
                                                      <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
								                    </div>
								                </div><!--end control-group-->
                                                <div class="control-group">
								                    <label class="control-label" for="inputPostCode">Phone Number: <span class="text-error">*</span></label>
								                    <div class="controls">
								                      <input type="text" name="phone-shipping" id="phone-shipping" placeholder="Ex: 55421">
                                                      <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
								                    </div>
								                </div><!--end control-group-->

								                <div class="control-group">
								                    <div class="control-label">Country: <span class="text-error">*</span></div>
								                    <div class="controls">
								                      <select name="country-shipping">
								      	                <option>-- Select Country --</option>
								      	                <option>Vietnam</option>
								      	                <option>United State</option>
								      	                <option>United Kingdom</option>
								      	                <option>Australia</option>
								                      </select>
                                                      <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
								                    </div>
								                </div><!--end control-group-->

								                <div class="control-group">
								                    <div class="control-label">Region/Stats: <span class="text-error">*</span></div>
								                    <div class="controls">
								                      <select name="region-shipping">
								      	                <option>-- Select Region --</option>
								      	                <option>New South Wales</option>
								      	                <option>South Australia</option>
								      	                <option>Victoria</option>
								      	                <option>Queenlands</option>
								      	                <option>Western Australia</option>
								                      </select>
                                                      <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
								                    </div>
								                </div><!--end control-group-->
							               <!--end form-->
										</td>
                                        <td>
											<h3>Review Information</h3>

								                <div class="control-group">
								                    <div class="controls" id="review-address">
								                      <p class="span3"><b>Shipping Information:<br /></b></p>
                                                      <p class="span3"><b>Billing Information:<br /></b></p>
								                    </div>
								                </div><!--end control-group-->
                                                <button class="btn btn-primary" id="submit-validate-address">Continue</button>
										</td>
                                        
                                        </form>
									</tr>
								</table>
							</div><!--end login-->

						</div><!--end checkout-content-->
                        
				        </div>

				
			        </div>
			        <!-- </Wizard - Step 2 -->
			
			        <!-- Wizard - Step 3 -->
			        <div id="step-3" class="step one_column">
				        <div class="column_one">
                            <form action="/Ajax/CheckoutValidate.aspx" class="defaultRequest" method="post" id="payment">
					            <div class="checkout-content">
							        <div class="login">
                                        <table>
                                            <tr>
                                                <td class="span3">
                                                        <h3>Choose payment option</h3>

								                        <div class="control-group" >
								                            <div class="controls" style="cursor:pointer;">
                                                                <input type="radio" name="paymentOptions" value="cc" />&nbsp;Credit card<br /><br />
                                                            </div>
                                                            <div class="controls" style="cursor:pointer;">
                                                                <input type="radio" name="paymentOptions" value="pp" />&nbsp;Paypal<br /><br />
                                                            </div>
                                                            <div class="controls" style="cursor:pointer;">
                                                                <input type="radio" name="paymentOptions" value="cq" />&nbsp;Checkque
								                            </div>
								                        </div><!--end control-group-->
											            
                                                </td>
                                                <td>
                                                    <h3>Payment data</h3>
                                                        <div class="control-group">
								                            <label class="control-label" for="inputFirstName">Credit number: <span class="text-error">*</span></label>
								                            <div class="controls">
								                              <input type="text" name="first-name-shipping" id="Text1">
                                                              <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
								                            </div>
                                                            <label class="control-label" for="inputFirstName">Expire date: <span class="text-error">*</span></label>
								                            <div class="controls">
								                                <div class="controls">
								                                  <select style="width:80px;" name="exp-month">
								      	                            <option>01</option>
                                                                    <option>02</option>
                                                                    <option>03</option>
                                                                    <option>04</option>
                                                                    <option>05</option>
                                                                    <option>06</option>
                                                                    <option>07</option>
                                                                    <option>08</option>
                                                                    <option>09</option>
                                                                    <option>10</option>
                                                                    <option>11</option>
                                                                    <option>12</option>
								                                  </select>
                                                                  <select style="width:80px;" name="exp-month">
								      	                            <option>2013</option>
                                                                    <option>2014</option>
                                                                    <option>2015</option>
                                                                    <option>2016</option>
                                                                    <option>2017</option>
                                                                    <option>2018</option>
                                                                    <option>2019</option>
                                                                    <option>2020</option>
                                                                    <option>2021</option>
                                                                    <option>2022</option>
                                                                    <option>2023</option>
                                                                    <option>2024</option>
								                                  </select>
                                                                  <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
								                                </div>
								                            </div>
                                                            <label class="control-label" for="inputFirstName">CCV/CSC: <span class="text-error">*</span></label>
								                            <div class="controls">
								                              <input type="text" name="first-name-shipping" style="width:50px;" id="Text2">
                                                              <span class="help-inline" style="display:none;"><i class="icon-remove"></i> Invalid input!</span>
								                            </div>
								                        </div><!--end control-group-->
                                                </td>
                                                <td>
											        <h3>Review Information</h3>

								                        <div class="control-group">
								                            <div class="controls" id="Div1">
								                              <p class="span3"><b>Payment data:<br /></b></p>
								                            </div>
								                        </div><!--end control-group-->
                                                        <button class="btn btn-primary" id="Button1">Continue</button>
										        </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </form>
				        </div>
				
			        </div>
			        <!-- </Wizard - Step 3 -->
			
			        <!-- Wizard - Step 4 -->
			        <div id="step-4" class="step one_column">
				
				        <div class="column_one">
					        <h3>Success!</h3>
					
					        <p>WordPress has been installed. Were you expecting more steps? Sorry to disappoint.</p>
					
					        <p><button><span>Log In</span></button></p>
				        </div>
				
			        </div>
			        <!-- </Wizard - Step 4 -->
                    <!-- Wizard - Step 5 -->
			        <div id="step-5" class="step one_column">
				
				        <div class="column_one">
					        <h3>Success!</h3>
					
					        <p>WordPress has been installed. Were you expecting more steps? Sorry to disappoint.</p>
					
					        <p><button><span>Log In</span></button></p>
				        </div>
				
			        </div>
			        <!-- </Wizard - Step 5 -->
                    <!-- Wizard - Step 6 -->
			        <div id="step-6" class="step one_column">
				
				        <div class="column_one">
					        <h3>Success!</h3>
					
					        <p>WordPress has been installed. Were you expecting more steps? Sorry to disappoint.</p>
					
					        <p><button><span>Log In</span></button></p>
				        </div>
				
			        </div>
			        <!-- </Wizard - Step 6 -->
                    <!-- Wizard - Step 7 -->
			        <div id="step-7" class="step one_column">
				
				        <div class="column_one">
					        <h3>Success!</h3>
					
					        <p>WordPress has been installed. Were you expecting more steps? Sorry to disappoint.</p>
					
					        <p><button><span>Log In</span></button></p>
				        </div>
				
			        </div>
			        <!-- </Wizard - Step 7 -->
			
		        </div>
		
		        <div class="no_javascript">
			        <img src="assets/img/warning.png" alt="Javascript Required" />
			        <p>Javascript is required in order to use this wizard. <br />
			        <a href="https://www.google.com/support/adsense/bin/answer.py?answer=12654">How to enable javascript</a>
			        -
			        <a href="http://www.mozilla.com/firefox/">Upgrade Browser</a></p>
		        </div>
	        </div>
		</div><!--end span12-->
	</div><!--end row-->
</div><!--end conatiner-->
</asp:Content>
