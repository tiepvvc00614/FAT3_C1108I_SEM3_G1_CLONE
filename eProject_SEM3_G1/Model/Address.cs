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


        public string FullName
        {
            get
            {
                return this.firstName + " " + this.lastName;
            }
        }

        public int AddressId
        {
            get
            {
                return addressId;
            }
            set
            {
                if (addressId != value)
                {
                    addressId = value;
                }
            }
        }

        public string FullAddress
        {
            get
            {
                return address;
            }
            set
            {
                if (address != value)
                {
                    address = value;
                }
            }
        }

        public string FirstName
        {
            get
            {
                return firstName;
            }
            set
            {
                if (firstName != value)
                {
                    firstName = value;
                }
            }
        }

        public string LastName
        {
            get
            {
                return lastName;
            }
            set
            {
                if (lastName != value)
                {
                    lastName = value;
                }
            }
        }

        public string City
        {
            get
            {
                return city;
            }
            set
            {
                if (city != value)
                {
                    city = value;
                }
            }
        }

        public string State
        {
            get
            {
                return states;
            }
            set
            {
                if (states != value)
                {
                    states = value;
                }
            }
        }

        public string ZipCode
        {
            get
            {
                return zipcode;
            }
            set
            {
                if (zipcode != value)
                {
                    zipcode = value;
                }
            }
        }

        public Country Country
        {
            get
            {
                return country;
            }
            set
            {
                if (country != value)
                {
                    country = value;
                }
            }
        }

    }
}