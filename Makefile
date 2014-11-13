@using Neusta.Cottonserver.Constants
@using Neusta.Cottonserver.Constants.Enumerations
@model Neusta.Cottonserver.DataModels.Order.IOrderHeadDetailData

<script>
	function loadPartners() {
		$('#sellers').data("kendoDropDownList").dataSource = new kendo.data.DataSource({
			type: "json",
			data: "~/SelectionItem/GetPartners"
		});
	}
</script>

<div id="firstBlock" class="col-md-7">
	<div class="form-group">
		@Html.LabelFor(m => m.OrderNo, new { @class = "col-md-2 control-label" })
		<div class="col-md-10">
			@Html.TextBoxFor(x => x.OrderNo, new { @readonly = "true", @class = "form-control" })
			@Html.ValidationMessageFor(m => m.OrderNo, "", new { @class = "text-danger" })
		</div>
	</div>

	<div class="form-group">
		@Html.LabelFor(m => m.SellerId, new { @class = "col-md-2 control-label" })
		<div class="col-md-4">
		    @(Html.Kendo().ComboBoxFor(m => m.SellerId)
		          .Text(Model.Seller)
		          .DataValueField("PkID")
		          .DataTextField("Name")
		          .Name("sellers")
		          .Filter(FilterType.Contains)
		          .HtmlAttributes(new { style = "width: 400px" })
		          //.OptionLabel(new { PkID = -1, Name = "Select.." })
		          .Template("<span class=\"col-md-4 k-state-default\">#: data.Name #</span>" +
		                    "<span class=\"col-md-4 k-state-default\">#: data.City #</span>" +
		                    "<span class=\"col-md-4 k-state-default\">#: data.Country #</span>")
		          .DataSource(
		              source => 
		              source.Read(read => read.Url(@Url.Content(@"~/Api/PartnerDetailData/GetSelectionItems"))
		                  )
		                  .ServerFiltering(true)
		          )
		          .AutoBind(false))
		    @Html.ValidationMessageFor(m => m.SellerId, "", new { @class = "text-danger" })
		</div>
	</div>

	<div class="form-group">
		@Html.LabelFor(m => m.BuyerId, new { @class = "col-md-2 control-label" })
		<div class="col-md-4">
			@(Html.Kendo().DropDownListFor(m => m.BuyerId)
			  .Name("BuyerId")
		      .Text(Model.Buyer)
			  .DataValueField("PkID")
			  .DataTextField("Name")
			  .HtmlAttributes(new { style = "width: 400px" })
			  .OptionLabel(new { PkID = -1, Name = TextConstants.DropdownSelect })
			  .Template("<span class=\"col-md-4 k-state-default\">#: data.Name #</span>" +
						"<span class=\"col-md-4 k-state-default\">#: data.City #</span>" +
						"<span class=\"col-md-4 k-state-default\">#: data.Country #</span>")
					//.BindTo(Model.Partners)
			  .DataSource(source => source.Read(read => read.Url(@Url.Content(@"~/Api/PartnerDetailData/GetSelectionItems"))
								  )
							  )
			  .AutoBind(false)
			)
			@Html.ValidationMessageFor(m => m.BuyerId, "", new { @class = "text-danger" })
		</div>
	</div>
	<div class="form-group">
		@Html.LabelFor(m => m.InvoiceRecipient, new { @class = "col-md-2 control-label" })
		<div class="col-md-2">
			@(Html.RadioButtonFor(m => m.InvoiceRecipient, InvoiceRecipient.Seller)) Seller
		</div>
		<div class="col-md-2">
			@(Html.RadioButtonFor(m => m.InvoiceRecipient, InvoiceRecipient.Buyer)) Buyer
		</div>
		@Html.ValidationMessageFor(m => m.InvoiceRecipient, "", new { @class = "text-danger" })
	</div>
	<div class="form-group">
		@Html.LabelFor(m => m.SellersAgentId, new { @class = "col-md-2 control-label" })
		<div class="col-md-10">
			@(Html.Kendo().DropDownListFor(m => m.SellersAgentId)
			          .Name("SellersAgentId")
					  .Text(Model.SellersAgent)
					  .DataValueField("PkID")
					  .DataTextField("Name")
					  .HtmlAttributes(new { style = "width: 400px" })
					  .OptionLabel(new { PkID = 0, Name = TextConstants.DropdownSelect })
					  .Template("<span class=\"col-md-4 k-state-default\">#: data.Name #</span>" +
						"<span class=\"col-md-4 k-state-default\">#: data.City #</span>" +
						"<span class=\"col-md-4 k-state-default\">#: data.Country #</span>")
					  .DataSource(source => source.Read(read => read.Url(@Url.Content(@"~/Api/PartnerDetailData/GetSelectionItems"))))
					  .AutoBind(false)
			)
			@Html.ValidationMessageFor(m => m.SellersAgentId, "", new { @class = "text-danger" })
		</div>
	</div>

	<div class="form-group">
		@Html.LabelFor(m => m.NotifyPartnerId, new { @class = "col-md-2 control-label" })
		<div class="col-md-10">
			@(Html.Kendo().DropDownListFor(m => m.NotifyPartnerId)
			          .Name("NotifyPartnerId")
					  .Text(Model.NotifyPartner)
					  .DataValueField("PkID")
					  .DataTextField("Name")
					  .HtmlAttributes(new { style = "width: 400px" })
					  .OptionLabel(new { PkID = -1, Name = "Select.." })
					  .Template("<span class=\"col-md-4 k-state-default\">#: data.Name #</span>" +
						"<span class=\"col-md-4 k-state-default\">#: data.City #</span>" +
						"<span class=\"col-md-4 k-state-default\">#: data.Country #</span>")
					  .DataSource(source => source.Read(read => read.Url(@Url.Content(@"~/Api/PartnerDetailData/GetSelectionItems"))
								  )
							  )
					  .AutoBind(false)
			)
			@Html.ValidationMessageFor(m => m.NotifyPartnerId, "", new { @class = "text-danger" })
		</div>
	</div>

	<div class="form-group">
		@Html.LabelFor(m => m.ContactPersonId, new { @class = "col-md-2 control-label" })
		<div class="col-md-10">
			@(Html.Kendo().DropDownListFor(m => m.ContactPersonId)
					  .Name("ContactPersonId")
					  .Text(Model.ContactPerson)
					  .DataValueField("PkID")
					  .DataTextField("Name")
					  .HtmlAttributes(new { style = "width: 400px" })
					  .OptionLabel(new { PkID = -1, Name = "Select.." })
					  .Template("<span class=\"col-md-4 k-state-default\">#: data.Name #</span>" +
								"<span class=\"col-md-4 k-state-default\">#: data.City #</span>" +
								"<span class=\"col-md-4 k-state-default\">#: data.Country #</span>")
					  .DataSource(source => source.Read(read => read.Url(@Url.Content(@"~/Api/UserDetailData/GetSelectionItems"))))
					  .AutoBind(false)
			)
			@Html.ValidationMessageFor(m => m.ContactPersonId, "", new { @class = "text-danger" })
		</div>
	</div>
</div>

<div id="infoBox" class="col-md-5">
	<div class="form-group">
		@Html.LabelFor(m => m.Status, new { @class = "col-md-2 control-label" })
		<div class="col-md-10">
			@(Html.Kendo().DropDownListFor(m => m.Status)
				  .DataValueField("PkID")
				  .DataTextField("Name")
				  .HtmlAttributes(new { style = "width: 400px" })
				  .OptionLabel(new { PkID = -1, Name = "Select.." })
				  .DataSource(source => source.Read(read => read.Url(@Url.Content(@"~/Api/SelectionItem/GetStatusSelectionItems"))))
			)
			@Html.ValidationMessageFor(m => m.Status, "", new { @class = "text-danger" })
		</div>
	</div>


	<div class="form-group">
		@Html.LabelFor(m => m.ResponsibleHeadOfficeId, new { @class = "col-md-2 control-label" })
		<div class="col-md-10">
			@(Html.Kendo().DropDownListFor(m => m.ResponsibleHeadOfficeId)
				  .Text(Model.ResponsibleHeadOffice)
				  .DataValueField("PkID")
				  .DataTextField("Name")
				  .HtmlAttributes(new { style = "width: 400px" })
				  .OptionLabel(new { PkID = -1, Name = "Select.." })
				  .DataSource(source => source.Read(read => read.Url(@Url.Content(@"~/Api/UserDetailData/GetSelectionItems"))))
			)
			@Html.ValidationMessageFor(m => m.ResponsibleHeadOffice, "", new { @class = "text-danger" })
		</div>
	</div>


	<div class="form-group">
		@Html.LabelFor(m => m.ResponsibleAgentId, new { @class = "col-md-2 control-label" })
		<div class="col-md-10">
			@(Html.Kendo().DropDownListFor(m => m.ResponsibleAgentId)
			      .Text(Model.ResponsibleAgent)
				  .DataValueField("PkID")
				  .DataTextField("Name")
				  .HtmlAttributes(new { style = "width: 400px" })
				  .OptionLabel(new { PkID = -1, Name = "Select.." })
				  .DataSource(source => source.Read(read => read.Url(@Url.Content(@"~/Api/UserDetailData/GetSelectionItems"))))
			)
			@Html.ValidationMessageFor(m => m.ResponsibleAgentId, "", new { @class = "text-danger" })
		</div>
	</div>
</div>

<p />
<div id="processingData" class="col-md-7">
	<div class="form-group">
		@Html.LabelFor(m => m.ExecutingAgentId, new { @class = "col-md-2 control-label" })
		<div class="col-md-10">
			@(Html.Kendo().DropDownListFor(m => m.ExecutingAgentId)
				  .Text(Model.ExecutingAgent)
		 		  .DataValueField("PkID")
				  .DataTextField("Name")
				  .HtmlAttributes(new { style = "width: 400px" })
				  .OptionLabel(new { PkID = -1, Name = "Select.." })
				  .Template("<span class=\"col-md-4 k-state-default\">#: data.Name #</span>" +
							"<span class=\"col-md-4 k-state-default\">#: data.City #</span>" +
							"<span class=\"col-md-4 k-state-default\">#: data.Country #</span>")
				  .DataSource(source => source.Read(read => read.Url(@Url.Content(@"~/Api/PartnerDetailData/GetSelectionItems"))
					  )
				  )
				  .AutoBind(false)
			)
			@Html.ValidationMessageFor(m => m.ExecutingAgentId, "", new { @class = "text-danger" })
		</div>
	</div>
	<div class="form-group">
		@Html.LabelFor(m => m.ContractNo, new { @class = "col-md-2 control-label" })
		<div class="col-md-10">
			@Html.TextBoxFor(x => x.ContractNo, new { @class = "form-control" })
			@Html.ValidationMessageFor(m => m.ContractNo, "", new { @class = "text-danger" })
		</div>
	</div>

	<div class="form-group">
		@Html.LabelFor(m => m.InvoiceNo, new { @class = "col-md-2 control-label" })
		<div class="col-md-10">
			@Html.TextBoxFor(x => x.InvoiceNo, new { @class = "form-control" })
			@Html.ValidationMessageFor(m => m.InvoiceNo, "", new { @class = "text-danger" })
		</div>
	</div>
</div>

<div id="ProductInformation" class="col-md-5">
	<div class="form-group">
		@Html.LabelFor(m => m.Quantity, new { @class = "col-md-2 control-label" })
		<div class="col-md-4">
			@Html.TextBoxFor(x => x.Quantity, new { @class = "form-control" })
			@Html.ValidationMessageFor(m => m.Quantity, "", new { @class = "text-danger" })
		</div>
		<div class="col-md-2">
			@Html.RadioButtonFor(x => x.PackagingUnit, PackingUnit.Bales) Bales
		</div>
		<div class="col-md-2">
			@Html.RadioButtonFor(x => x.PackagingUnit, PackingUnit.Colli) Colli
		</div>
		@Html.ValidationMessageFor(m => m.PackagingUnit, "", new { @class = "text-danger" })
	</div>

	<div class="form-group">
		@Html.LabelFor(m => m.Product, new { @class = "col-md-2 control-label" })
		<div class="col-md-4">
			@Html.TextBoxFor(x => x.Product, new { @class = "form-control" })
			@Html.ValidationMessageFor(m => m.Product, "", new { @class = "text-danger" })
		</div>
	</div>
	<div class="form-group">
		@Html.LabelFor(m => m.GrowthCountryId, new { @class = "col-md-2 control-label" })
		<div class="col-md-8">
			@(Html.Kendo().DropDownListFor(m => m.GrowthCountryId)
			      .Name("GrowthCountryId")
				  .Text(Model.GrowthCountry)
				  .DataValueField("PkID")
				  .DataTextField("Name")
				  .HtmlAttributes(new { style = "width: 400px" })
				  .OptionLabel(new { PkID = -1, Name = "Select.." })
				  .Template("<span class=\"col-md-4 k-state-default\">#: data.Name #</span>" +
							"<span class=\"col-md-4 k-state-default\">#: data.Code #</span>")
				  .DataSource(source => source.Read(read => read.Url(@Url.Content(@"~/Api/CountryDetailData/GetSelectionItems"))
					  )
				  )
				  .AutoBind(false)
			)
			@Html.ValidationMessageFor(m => m.GrowthCountryId, "", new { @class = "text-danger" })
		</div>
	</div>
</div>


<style>
    #SellerId-list .k-item > span,  
	#BuyerId-list .k-item > span, 
	#SellersAgentId-list .k-item > span, 
	#NotifyPartnerId-list .k-item > span, 
	#ContactPersonId-list .k-item > span {
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        display: inline-block;
        /*border-style: solid;
        border-width: 0 0 1px 1px;*/
        vertical-align: top;
		/*min-height: 30px;*/
		width: 30%;
        /*padding: .6em 0 0 .6em;*/
    }
	
    #GrowthCountryId-list .k-item > span{
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        display: inline-block;
        /*border-style: solid;
        border-width: 0 0 1px 1px;*/
        vertical-align: top;
        width: 20%;
        /*padding: .6em 0 0 .6em;*/
    }

	 #GrowthCountry-list .k-item > span:first-child{
        width: 79%;
        border-left-width: 0;
        padding: .6em 0 0 0;
    }


</style>

