<%@ Page Title="" Language="C#" MasterPageFile="~/Master Page/AdminPage.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="eProject_SEM3_G1.admin.AddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderAppend" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="heading-buttons">
	<h3 class="glyphicons cart_in"><i></i> Add product</h3>
	<div class="buttons pull-right">
		<a href="" class="btn btn-default btn-icon glyphicons share"><i></i> Preview</a>
		<a href="" class="btn btn-primary btn-icon glyphicons ok_2"><i></i> Save</a>
	</div>
	<div class="clearfix"></div>
</div>
<div class="separator"></div>

<div class="widget widget-2 widget-tabs">
	<div class="widget-head">
		<ul>
			<li class="active"><a href="#productDescriptionTab" data-toggle="tab" class="glyphicons font"><i></i>Description</a></li>
			<li><a href="#productPhotosTab" data-toggle="tab" class="glyphicons picture"><i></i>Photos</a></li>
			<li><a href="#productAttributesTab" data-toggle="tab" class="glyphicons adjust_alt"><i></i>Custom Attributes</a></li>
			<li><a href="#productPriceTab" data-toggle="tab" class="glyphicons table"><i></i>Qty & Price</a></li>
			<li><a href="#productSeoTab" data-toggle="tab" class="glyphicons podium"><i></i>SEO</a></li>
		</ul>
	</div>
	<div class="widget-body" style="padding: 10px;">
		<div class="tab-content">
		
			<!-- Description -->
			<div class="tab-pane active" id="productDescriptionTab">
				<div class="row-fluid">
					<div class="span3">
						<strong>Product title</strong>
					</div>
					<div class="span9">
						<label for="inputTitle">Title</label>
						<input type="text" id="inputTitle" class="span6" value="" placeholder="Enter product title ..." />
						<div class="separator"></div>
					</div>
				</div>
				<hr class="separator bottom" />
				<div class="row-fluid">
					<div class="span3">
						<strong>Description</strong>
					</div>
					<div class="span9">
						<label for="textDescription">Description</label>
						<textarea id="textDescription" class="wysihtml5" style="width: 96%;" rows="5">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.</textarea>
					</div>
				</div>
			</div>
			<!-- Description END -->
			
			<!-- Photos -->
			<div class="tab-pane" id="productPhotosTab">
                <div class="widget widget-2">
					<div class="widget-head">
						<h4 class="heading">File upload widget</h4>
					</div>
					<div class="separator"></div>
					<div class="fileupload fileupload-new" data-provides="fileupload">
						<div class="input-append">
						    <div class="uneditable-input span3"><i class="icon-file fileupload-exists"></i> <span class="fileupload-preview"></span></div><span class="btn btn-file"><span class="fileupload-new">Select file</span><span class="fileupload-exists">Change</span><input type="file" /></span><a href="#" class="btn fileupload-exists" data-dismiss="fileupload">Remove</a>
						</div>
					</div>
				</div>
			</div>
			<!-- Photos END -->
			
			<!-- Attributes -->
			<div class="tab-pane" id="productAttributesTab">
                <div class="row-fluid">
			        <div class="span6">
                        <div class="widget widget-2">
				            <div class="widget-head"><h4 class="heading">Key</h4></div>
				            <div class="separator"></div>
				            <div class="row-fluid">
					            <input type="text" value="ISBN" class="span12" />
				            </div>
			            </div>
                    </div>
                    <div class="span6">
                        <div class="widget widget-2">
				            <div class="widget-head"><h4 class="heading">Value</h4></div>
				            <div class="separator"></div>
				            <div class="row-fluid">
					            <input type="text" class="span12" />
				            </div>
			            </div>
                    </div>
                </div>
                <div class="row-fluid">
			        <div class="span6">
                        <div class="widget widget-2">
				            <div class="widget-head"><h4 class="heading">Key</h4></div>
				            <div class="separator"></div>
				            <div class="row-fluid">
					            <input type="text" value="Languague" class="span12" />
				            </div>
			            </div>
                    </div>
                    <div class="span6">
                        <div class="widget widget-2">
				            <div class="widget-head"><h4 class="heading">Value</h4></div>
				            <div class="separator"></div>
				            <div class="row-fluid">
					            <input type="text" class="span12" />
				            </div>
			            </div>
                    </div>
                </div>
                <div class="row-fluid">
			        <div class="span6">
                        <div class="widget widget-2">
				            <div class="widget-head"><h4 class="heading">Key</h4></div>
				            <div class="separator"></div>
				            <div class="row-fluid">
					            <input type="text" value="Page" class="span12" />
				            </div>
			            </div>
                    </div>
                    <div class="span6">
                        <div class="widget widget-2">
				            <div class="widget-head"><h4 class="heading">Value</h4></div>
				            <div class="separator"></div>
				            <div class="row-fluid">
					            <input type="text" class="span12" />
				            </div>
			            </div>
                    </div>
                </div>
                <div class="row-fluid">
			        <div class="span6">
                        <div class="widget widget-2">
				            <div class="widget-head"><h4 class="heading">Key</h4></div>
				            <div class="separator"></div>
				            <div class="row-fluid">
					            <input type="text" value="Country" class="span12" />
				            </div>
			            </div>
                    </div>
                    <div class="span6">
                        <div class="widget widget-2">
				            <div class="widget-head"><h4 class="heading">Value</h4></div>
				            <div class="separator"></div>
				            <div class="row-fluid">
					            <input type="text" class="span12" />
				            </div>
			            </div>
                    </div>
                </div>
                <div class="row-fluid">
			        <div class="span6">
                        <div class="widget widget-2">
				            <div class="widget-head"><h4 class="heading">Key</h4></div>
				            <div class="separator"></div>
				            <div class="row-fluid">
					            <input type="text" value="Other" class="span12" />
				            </div>
			            </div>
                    </div>
                    <div class="span6">
                        <div class="widget widget-2">
				            <div class="widget-head"><h4 class="heading">Value</h4></div>
				            <div class="separator"></div>
				            <div class="row-fluid">
					            <input type="text" class="span12" />
				            </div>
			            </div>
                    </div>
                </div>
			    
			</div>
			<!-- Attributes END -->
			
			<!-- Price -->
			<div class="tab-pane" id="productPriceTab">
			    <div class="widget widget-1 row-fluid">
				    <div class="widget-head"><h4 class="heading">Price</h4></div>
				    <div class="separator"></div>
				    <div class="input-prepend input-append">
					    <span class="add-on">$</span>
					    <input class="span12" id="appendedPrependedInput" type="text" /> 
					    <span class="add-on">.00</span>
				    </div>
			    </div>
                <div class="widget widget-1 row-fluid">
				    <div class="widget-head"><h4 class="heading">Quantity</h4></div>
				    <div class="separator"></div>
				    <div class="input-prepend input-append">
					    <input class="span12" id="Text1" type="text" /> 
				    </div>
			    </div>
			</div>
			<!-- Price END -->
			
			<!-- SEO -->
			<div class="tab-pane" id="productSeoTab">
			    
			</div>
			<!-- SEO END -->
			
		</div>
	</div>
</div>
<div class="heading-buttons">
	<div class="buttons pull-right" style="margin-top: 0;">
		<a href="" class="btn btn-default btn-icon glyphicons share"><i></i> Preview</a>
		<a href="" class="btn btn-primary btn-icon glyphicons ok_2"><i></i> Save</a>
	</div>
	<div class="clearfix"></div>
</div>
</asp:Content>
