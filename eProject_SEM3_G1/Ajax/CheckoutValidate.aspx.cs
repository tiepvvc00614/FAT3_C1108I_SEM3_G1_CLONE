using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eProject_SEM3_G1.Ajax
{
    public partial class CheckoutValidate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(5000);
            Response.ContentType = "application/json";
            try
            {
                string firstNameBilling = (Request.Params["first-name-billing"] == null || Request.Params["first-name-billing"] == "") ? null : Request.Params["first-name-billing"].ToString();
                string lastNameBilling = (Request.Params["last-name-billing"] == null || Request.Params["last-name-billing"] == "") ? null : Request.Params["last-name-billing"].ToString();
                string emailContact = (Request.Params["email-contact"] == null || Request.Params["email-contact"] == "") ? null : Request.Params["email-contact"].ToString();
                string companyBilling = (Request.Params["company-billing"] == null || Request.Params["company-billing"] == "") ? null : Request.Params["company-billing"].ToString();
                string firstAddressBilling = (Request.Params["first-address-billing"] == null || Request.Params["first-address-billing"] == "") ? null : Request.Params["first-address-billing"].ToString();
                string secondAddressBilling = (Request.Params["second-address-billing"] == null || Request.Params["second-address-billing"] == "") ? null : Request.Params["second-address-billing"].ToString();
                string cityBilling = (Request.Params["city-billing"] == null || Request.Params["city-billing"] == "") ? null : Request.Params["city-billing"].ToString();
                string postCodeBilling = (Request.Params["post-code-billing"] == null || Request.Params["post-code-billing"] == "") ? null : Request.Params["post-code-billing"].ToString();
                string phoneBilling = (Request.Params["phone-billing"] == null || Request.Params["phone-billing"] == "") ? null : Request.Params["phone-billing"].ToString();
                string countryBilling = (Request.Params["country-billing"] == null || Request.Params["country-billing"] == "") ? null : Request.Params["country-billing"].ToString();
                string regionBilling = (Request.Params["region-billing"] == null || Request.Params["region-billing"] == "") ? null : Request.Params["region-billing"].ToString();


                string firstNameShipping = (Request.Params["first-name-shipping"] == null || Request.Params["first-name-shipping"] == "") ? null : Request.Params["first-name-shipping"].ToString();
                string lastNameShipping = (Request.Params["last-name-shipping"] == null || Request.Params["last-name-shipping"] == "") ? null : Request.Params["last-name-shipping"].ToString();
                string companyShipping = (Request.Params["company-shipping"] == null || Request.Params["company-shipping"] == "") ? null : Request.Params["company-shipping"].ToString();
                string firstAddressShipping = (Request.Params["first-address-shipping"] == null || Request.Params["first-address-shipping"] == "") ? null : Request.Params["first-address-shipping"].ToString();
                string secondAddressShipping = (Request.Params["second-address-shipping"] == null || Request.Params["second-address-shipping"] == "") ? null : Request.Params["second-address-shipping"].ToString();
                string cityShipping = (Request.Params["city-shipping"] == null || Request.Params["city-shipping"] == "") ? null : Request.Params["city-shipping"].ToString();
                string postCodeShipping = (Request.Params["post-code-shipping"] == null || Request.Params["post-code-shipping"] == "") ? null : Request.Params["post-code-shipping"].ToString();
                string phoneShipping = (Request.Params["phone-shipping"] == null || Request.Params["phone-shipping"] == "") ? null : Request.Params["phone-shipping"].ToString();
                string countryShipping = (Request.Params["country-shipping"] == null || Request.Params["country-shipping"] == "") ? null : Request.Params["country-shipping"].ToString();
                string regionShipping = (Request.Params["region-shipping"] == null || Request.Params["region-shipping"] == "") ? null : Request.Params["region-shipping"].ToString();

                if (firstNameBilling == null) throw new ArgumentException("First name billing is blank");
                if (lastNameBilling == null) throw new ArgumentException("Last name billing is blank");
                if (emailContact == null) throw new ArgumentException("Email contact is blank");
                if (firstAddressBilling == null) throw new ArgumentException("First Address is blank");
                if (cityBilling == null) throw new ArgumentException("City billing is blank");
                if (postCodeBilling == null) throw new ArgumentException("Postcode billing is blank");
                if (phoneBilling == null) throw new ArgumentException("Phone billing is blank");
                if (countryBilling == null) throw new ArgumentException("Country billing is blank");
                if (regionBilling == null) throw new ArgumentException("Region billing is blank");

                if (firstNameShipping == null) throw new ArgumentException("First name shipping is blank");
                if (lastNameShipping == null) throw new ArgumentException("Last name shipping is blank");
                if (firstAddressShipping == null) throw new ArgumentException("First address shipping is blank");
                if (cityShipping == null) throw new ArgumentException("City shipping is blank");
                if (postCodeShipping == null) throw new ArgumentException("Postcode shipping is blank");
                if (phoneShipping == null) throw new ArgumentException("Phone shipping is blank");
                if (countryShipping == null) throw new ArgumentException("Country shipping is blank");
                if (regionShipping == null) throw new ArgumentException("Region shipping is blank");

                Response.Write("{\"response\": true}");
            }
            catch (Exception ex)
            {
                Response.Write("{\"response\": false, \"message\": \""+ex.Message+"\"}");
            }
      
            
        }
    }
}