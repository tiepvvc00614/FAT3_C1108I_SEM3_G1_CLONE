using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace eProject_SEM3_G1.Model
{
    
    public class User : Customer
    {
        public static int STATUS_UNACTIVE = 0;
        public static int STATUS_ACTIVE = 1;
        public static int STATUS_BANNED = 2;


        private int userId;
        private string username;
        private string password;
        private int status;
        private DateTime dateRegister;
        List<AddressBook> addressbooks;


        public void SaveAddressBook()
        {

        }
    }
}