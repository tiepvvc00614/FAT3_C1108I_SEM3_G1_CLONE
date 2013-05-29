<%@ Page Title="" Language="C#" MasterPageFile="~/Master Page/MainMP.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="eProject_SEM3_G1.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleTextContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderAppend" runat="server">
 <script type="text/javascript" src="/js/validate.js"></script> 
    <script type="text/javascript" src="/js/hoverIntent.js"></script> 
    <script type="text/javascript" src="/js/wizardPro.min.js"></script> 
    <script type="text/javascript">
        $(document).ready(function () {
            var wizard = $("#wizard").wizardPro();
            $("#ContactWizard").wizardPro();
            //Remote Next/Prev Step 
            //wizard.openstep(2);

            //Block interaction
            //wizard.interactionBlock(1);
        });
    </script>
<link href="/css/wizardPro.css" media="screen" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
<div class="container">
	<div class="row">
		<div class="span12">
            <div id="wizard" class="wizard-default-style js">
		        <ul class="steps">
			        <li>1. Introduction</li>
			        <li>2. Database Information</li>
			        <li>3. Website Information</li>
			        <li>4. Finish Installation</li>
		        </ul>
		
		        <div class="step_content">
			
			        <!-- Wizard - Step 1 -->
			        <div id="step-1" class="step one_column">
				
				        <div class="column_one">
					        <h3>Step 1 - Introduction</h3>
					
					        <p><strong>Welcome to WordPress. 
					        Before getting started, we need some information on the database. 
					        You will need to know the following items before proceeding.</strong></p>
					
					        <ol>
						        <li>Database name</li>
						        <li>Database username</li>
						        <li>Database password</li>
						        <li>Database host</li>
						        <li>Table prefix (if you want to run more than one WordPress in a single database)</li>
					        </ol>
					
					        <p>If for any reason this automatic file creation doesn't work, don't worry. 
					        All this does is fill in the database information to a configuration file. 
					        You may also simply open wp-config-sample.php in a text editor, fill in your information, 
					        and save it as wp-config.php. </p>
					
					        <p>In all likelihood, these items were supplied to you by your Web Host. 
					        If you do not have this information, then you will need to contact them before you can continue. 
					        If you're all ready...</p>
					        <button class="next"><span>Next Step</span></button>
				        </div>
				
			        </div>
			        <!-- </Wizard - Step 1 -->
			
			        <!-- Wizard - Step 2 -->
			        <div id="step-2" class="step two_column">
				
				        <!-- Helper -->
				        <div id="help-dbname" class="helper">
					        <div class="text">
						        <h3>Database Name</h3>
						        <p>The name of the database you want to run WP in. </p>
					        </div>
				        </div>
				        <!-- </Helper -->
				
				        <!-- Helper -->
				        <div id="help-dbprefix" class="helper">
					        <div class="text">
						        <h3>Table Prefix</h3>
						        <p>If you want to run multiple WordPress installations in a single database, change this.</p>
					        </div>
				        </div>
				        <!-- </Helper -->
				
				        <div class="column_one">
					        <h3>Step 2 - Database Information</h3>

					        <p>On the right side you should enter your database connection details. 
					        If you're not sure about these, contact your host. </p>

					        <p style="color:red;"><strong>Change "root1" into "root" to continue</strong></p>
				        </div>
				
				        <div class="column_two">
					
					        <form action="callback.php?step=2" class="defaultRequest" method="post">
						        <fieldset>
							        <p><label><a href="#help-dbname" class="show_helper"><span>(?)</span> Database Name</a></label>
							        <input type="text" name="dbname" class="required" value="wordpress" /></p>
							
							        <p><label>User Name</label>
							        <input type="text" name="dbuser" value="root" /></p>
							
							        <p><label>Password</label>
							        <input type="text" name="dbpass" value="root1" /></p>
							
							        <p><label>Database Host</label>
							        <input type="text" name="dbhost" value="localhost" /></p>
							
							        <p><label><a href="#help-dbprefix" class="show_helper"><span>(?)</span> Table Prefix</a></label>
							        <input type="text" name="dbprefix" value="wp_" /></p>
						        </fieldset>
						
						        <fieldset>
		     				         <p><label>&nbsp;</label>
		     				         <button type="submit"><span>Next Step</span></button></p>
		    			        </fieldset>
					        </form>

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
					
					        <form action="callback.php?step=3" class="defaultRequest" method="post">
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
