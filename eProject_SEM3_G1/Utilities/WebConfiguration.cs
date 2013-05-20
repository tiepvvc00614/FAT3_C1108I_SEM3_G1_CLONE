using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace eProject_SEM3_G1.Utilities
{
    public class WebConfiguration
    {
        private static string adminEmail;
        private static string siteName;
        private static string siteURL;
        private static string faviconURL;

        public static string AdminEmail
        {
            get
            {
                if (adminEmail == null) ReloadData();
                return adminEmail;
            }
        }

        public static string SiteName
        {
            get
            {
                if (siteName == null) ReloadData();
                return siteName;
            }
        }

        public static string SiteURL
        {
            get
            {
                if (siteURL == null) ReloadData();
                return siteURL;
            }
        }

        public static string FaviconURL
        {
            get
            {
                if (faviconURL == null) ReloadData();
                return faviconURL;
            }
        }

        public static string AboutPageURL
        {
            get
            {
                return @"/AboutUs.aspx";
            }
        }
        public static string DeliveryInfomationPageURL
        {
            get
            {
                return @"/Delivery.aspx";
            }
        }
        public static string PrivacyPolicyPageURL
        {
            get
            {
                return @"/PrivacyPolicy.aspx";
            }
        }

        public static string TermAndConditionPageURL
        {
            get
            {
                return @"/Condition.aspx";
            }
        }
        public static string ContactPageURL
        {
            get
            {
                return @"/Contact.aspx";
            }
        }
        public static string LoginPageURL
        {
            get
            {
                return @"/Login.aspx";
            }
        }
        public static string RegisterPageURL
        {
            get
            {
                return @"/Register.aspx";
            }
        }

        public static string CartPageURL
        {
            get
            {
                return @"/Cart.aspx";
            }
        }

        public static string CheckoutPageURL
        {
            get
            {
                return @"/Checkout.aspx";
            }
        }
        public static string ClientAreaPageURL
        {
            get
            {
                return @"/MyAccount.aspx";
            }
        }

        public static string PhoneContact
        {
            get
            {
                return @"364-471-3933";
            }
        }
        public static string EmailSupport
        {
            get
            {
                return @"support@bookstore.com";
            }
        }
        public static string AddressStore
        {
            get
            {
                return @"22 Avenue Park, LA 33618, United States";
            }
        }

        public static string SESSION_USERNAME_KEY = @"bs_username";
        


        private static void ReloadData()
        {
            //get admin settings in here

            adminEmail = @"admin@bookstore.com";
            siteName = @"Bookfine";
            siteURL = @"bookstore.com";
            faviconURL = @"images/favicon.ico";
        }

    }
}