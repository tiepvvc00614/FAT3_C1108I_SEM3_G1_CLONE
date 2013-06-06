<%@ Page Title="" Language="C#" MasterPageFile="~/Master Page/MainMP.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="eProject_SEM3_G1.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleTextContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderAppend" runat="server">
 <script type="text/javascript" src="/js/validate.js"></script> 
    <script type="text/javascript" src="/js/hoverIntent.js"></script> 
    <script type="text/javascript" src="/js/wizardPro.min.js"></script> 
<link href="/css/wizardPro.css" media="screen" rel="stylesheet" type="text/css" />
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
								                      <input type="text" id="first-name-billing" placeholder="John">
								                    </div>
								                </div><!--end control-group-->

								                <div class="control-group">
								                    <label class="control-label" for="inputLastName">Last Name: <span class="text-error">*</span></label>
								                    <div class="controls">
								                      <input type="text" id="last-name-billing" placeholder="Doe">
								                    </div>
								                </div><!--end control-group-->

								                <div class="control-group">
								                    <label class="control-label" for="inputCompany">Company:</label>
								                    <div class="controls">
								                      <input type="text" id="company-billing" placeholder="Shopfine, INC">
								                    </div>
								                </div><!--end control-group-->

								                <div class="control-group">
								                    <label class="control-label" for="inputFirstAdd">First Address: <span class="text-error">*</span></label>
								                    <div class="controls">
								                      <input type="text" id="first-address-billing" placeholder="3st el-hakim">
								                    </div>
								                </div><!--end control-group-->

								                <div class="control-group">
								                    <label class="control-label" for="inputSecondAdd">Second Address:</label>
								                    <div class="controls">
								                      <input type="text" id="second-address-billing" placeholder="6st el-hakim">
								                    </div>
								                </div><!--end control-group-->

								                <div class="control-group">
								                    <label class="control-label" for="inputCity">City: <span class="text-error">*</span></label>
								                    <div class="controls">
								                      <input type="text" id="city-billing" placeholder="Ex: New York">
								                    </div>
								                </div><!--end control-group-->

								                <div class="control-group">
								                    <label class="control-label" for="inputPostCode">Post Code: <span class="text-error">*</span></label>
								                    <div class="controls">
								                      <input type="text" id="post-code-billing" placeholder="Ex: 55421">
								                    </div>
								                </div><!--end control-group-->
                                                <div class="control-group">
								                    <label class="control-label" for="inputPostCode">Phone Number: <span class="text-error">*</span></label>
								                    <div class="controls">
								                      <input type="text" id="phone-billing" placeholder="Ex: 55421">
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
								                    </div>
								                </div><!--end control-group-->
										</td>

										<td>
											<h3>Shipping Information</h3>

								                <div class="control-group">
								                    <label class="control-label" for="inputFirstName">First Name: <span class="text-error">*</span></label>
								                    <div class="controls">
								                      <input type="text" id="first-name-shipping" placeholder="John">
								                    </div>
								                </div><!--end control-group-->

								                <div class="control-group">
								                    <label class="control-label" for="inputLastName">Last Name: <span class="text-error">*</span></label>
								                    <div class="controls">
								                      <input type="text" id="last-name-shipping" placeholder="Doe">
								                    </div>
								                </div><!--end control-group-->

								                <div class="control-group">
								                    <label class="control-label" for="inputCompany">Company:</label>
								                    <div class="controls">
								                      <input type="text" id="company-shipping" placeholder="Shopfine, INC">
								                    </div>
								                </div><!--end control-group-->

								                <div class="control-group">
								                    <label class="control-label" for="inputFirstAdd">First Address: <span class="text-error">*</span></label>
								                    <div class="controls">
								                      <input type="text" id="first-address-shipping" placeholder="3st el-hakim">
								                    </div>
								                </div><!--end control-group-->

								                <div class="control-group">
								                    <label class="control-label" for="inputSecondAdd">Second Address:</label>
								                    <div class="controls">
								                      <input type="text" id="second-address-shipping" placeholder="6st el-hakim">
								                    </div>
								                </div><!--end control-group-->

								                <div class="control-group">
								                    <label class="control-label" for="inputCity">City: <span class="text-error">*</span></label>
								                    <div class="controls">
								                      <input type="text" id="city-shipping" placeholder="Cairo">
								                    </div>
								                </div><!--end control-group-->

								                <div class="control-group">
								                    <label class="control-label" for="inputPostCode">Post Code: <span class="text-error">*</span></label>
								                    <div class="controls">
								                      <input type="text" id="post-code-shipping" placeholder="12345">
								                    </div>
								                </div><!--end control-group-->
                                                <div class="control-group">
								                    <label class="control-label" for="inputPostCode">Phone Number: <span class="text-error">*</span></label>
								                    <div class="controls">
								                      <input type="text" id="phone-shipping" placeholder="Ex: 55421">
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
                                                <button type="submit" class="btn btn-primary">Continue</button>
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
			        <div id="step-3" class="step two_column">
			
				        <!-- Helper -->
				        <div id="help-username" class="helper">
					        <div class="text">
						        <h3>Username</h3>
						        <p>Usernames can have only alphanumeric characters, spaces, 
						        underscores, hyphens, periods and the @ symbol.</p>
					        </div>
				        </div>
				        <!-- </Helper -->
				
				        <!-- Helper -->
				        <div id="help-password" class="helper">
					        <div class="text">
						        <h3>Password</h3>
						        <p><strong>A password will be automatically generated for you if you leave this blank.</strong></p>
						        <p>Hint: The password should be at least seven characters long.
						        To make it stronger, use upper and lower case letters, numbers and symbols like ! " ? $ % ^ &amp; ).</p>
					        </div>
				        </div>
				        <!-- </Helper -->
				
				        <div class="column_one">
					        <h3>Step 3 - Website Information</h3>
					        <p>Welcome to the famous five minute WordPress installation process! 
					        You may want to browse the ReadMe documentation  at your leisure. 
					        Otherwise, just fill in the information below and you’ll be on your way to 
					        using the most extendable and powerful personal publishing platform in the world.</p>
				        </div>
				
				        <div class="column_two">
					
					        <form action="/Ajax/CheckoutValidate.aspx" class="defaultRequest" method="post">
						        <fieldset>
							        <p><label>Site Title</label>
							        <input type="text" name="sitetitle" class="required" value="" /></p>
							
							        <p><label><a href="#help-username" class="show_helper"><span>(?)</span> Username</a></label>
							        <input type="text" name="username" class="required" value="" /></p>
							
							        <p><label><a href="#help-password" class="show_helper"><span>(?)</span> Password</a></label>
							        <input type="password" name="password" value="" /></p>
							
							        <p><label>Your E-mail</label>
							        <input type="text" name="dbhost" class="required email" value="" /></p>
							
							        <p><label>&nbsp;</label>
							        <input type="checkbox" name="blog_public" value="1"  checked='checked' /> Allow my site to appear in search engines like Google and Technorati.</p>
						        </fieldset>
						
						        <fieldset>
		     				         <p><label>&nbsp;</label>
		     				         <button type="submit"><span>Install WordPress</span></button></p>
		    			        </fieldset>
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
