using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace eProject_SEM3_G1.Model
{
    public class Country
    {
        private int countryId;
        private string countryName;
        private string countryCode;

        public Country() { }
        public Country(string ctrName)
        {
            this.countryName = ctrName;
        }


        public string CountryName
        {
            get
            {
                return countryName;
            }
        }
    }
}