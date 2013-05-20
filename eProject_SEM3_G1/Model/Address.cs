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

    }
}