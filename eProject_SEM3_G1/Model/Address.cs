using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace eProject_SEM3_G1.Model
{
    public class Address
    {
        private int addressId;
        private string address;
        private string firstName;
        private string lastName;
        private string city;
        private string states;
        private string zipcode;

        private Country country;
        
        public string FirstName
        {
            get
            {
                return this.firstName;
            }
            set { this.firstName = value; }
        }

        public string LastName
        {
            get
            {
                return this.lastName;
            }
            set { this.lastName = value; }
        }

        public string FullName
        {
            get
            {
                return this.FirstName + " " + this.LastName;
            }
        }

        public int AddressId
        {
            get
            {
                return this.addressId;
            }
            set
            {
                this.addressId = value;
            }
        }

        public string FullAddress
        {
            get
            {
                return this.address;
            }
            set
            {
                this.address = value;
            }
        }

        public string City
        {
            get
            {
                return this.city;
            }
            set
            {
                this.city = value;
            }
        }

        public string State
        {
            get
            {
                return this.states;
            }
            set
            {
                this.states = value;
            }
        }

        public string ZipCode
        {
            get
            {
                return this.zipcode;
            }
            set
            {
                this.zipcode = value;
            }
        }

        public Country Country
        {
            get
            {
                return this.country;
            }
            set
            {
                this.country = value;
            }
        }

        public string ToJSONString()
        {
            string jsonStr = "";
            jsonStr += "{";
            jsonStr += "\"id\": \""+ this.AddressId +"\",";
            jsonStr += "\"firstName\": \"" + this.FirstName + "\",";
            jsonStr += "\"lastName\": \"" + this.LastName + "\",";
            jsonStr += "\"address\": \"" + this.FullAddress + "\",";
            jsonStr += "\"city\": \"" + this.City + "\",";
            jsonStr += "\"state\": \"" + this.State + "\",";
            jsonStr += "\"zipcode\": \"" + this.ZipCode + "\",";
            jsonStr += "\"country\": \"" + this.Country.CountryName + "\"";
            jsonStr += "}";


            return jsonStr;
        }

    }
}