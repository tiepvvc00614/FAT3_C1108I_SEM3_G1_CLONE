using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace eProject_SEM3_G1.Model
{
    public class Address
    {
        public IAddress delegateObj;

        private int addressId;
        private string address;
        private string firstName;
        private string lastName;
        private string city;
        private string states;
        private string zipcode;

        private Country country;

        private void AddressDidChange()
        {
            //save to sql when address did change
            this.delegateObj.AddressChanged(this);
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
                    AddressDidChange();
                }
            }
        }

        public string Address
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
                    AddressDidChange();
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
                    AddressDidChange();
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
                    AddressDidChange();
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
                    AddressDidChange();
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
                    AddressDidChange();
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
                    AddressDidChange();
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
                    AddressDidChange();
                }
            }
        }

    }
}