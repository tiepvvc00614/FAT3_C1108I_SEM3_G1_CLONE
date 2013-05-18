using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eProject_SEM3_G1.Utilities;


namespace eProject_SEM3_G1.Master_Page.UserControl
{
    public partial class Footer : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            aboutUsLink.HRef = WebConfiguration.AboutPageURL;
            deliveryLink.HRef = WebConfiguration.DeliveryInfomationPageURL;
            privacyLink.HRef = WebConfiguration.PrivacyPolicyPageURL;
            termLink.HRef = WebConfiguration.TermAndConditionPageURL;
            supportLink.HRef = WebConfiguration.ContactPageURL;
            contactPhoneLink.InnerText = WebConfiguration.PhoneContact;
            contactPhoneLink.HRef = @"./#";
            contactEmailLink.InnerText = WebConfiguration.EmailSupport;
            contactEmailLink.HRef = @"./#";
            contactAddress.InnerText = WebConfiguration.AddressStore;
            copyrightInformation.InnerText = "© Copyrights 2010 - " + DateTime.Now.Year.ToString() + " for " + WebConfiguration.SiteName; 
        }
    }
}