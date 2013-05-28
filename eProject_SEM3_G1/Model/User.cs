using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using eProject_SEM3_G1.Model.DataAccess;

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
        private string userEmail;
        private DateTime dateRegister;
        List<AddressBook> addressbooks;
        private UserDAO userDataAccess;

        public User(string username, string password)
        {

            this.username = username;
            this.password = password;
            this.status = STATUS_ACTIVE;
            this.dateRegister = DateTime.Now;
            this.userDataAccess = new UserDAO(this);
        }

        public string UserEmail
        {
            get
            {
                return this.userEmail;
            }
            set
            {
                this.userEmail = value;
            }
        }

        public string Username
        {
            get
            {
                return this.username;
            }
        }

        public string Password
        {
            get
            {
                return this.password;
            }
            set
            {
                if (this.password != value)
                {
                    this.password = value;
                    this.userDataAccess.ChangePassword(value);
                }
            }
        }

        public int UserID
        {
            get
            {
                return this.userId;
            }
            set
            {
                this.userId = value;
            }
        }

        public int Status
        {
            get
            {
                return this.status;
            }
            set
            {
                this.status = value;
            }
        }
        public DateTime DateRegister
        {
            get
            {
                return this.dateRegister;
            }
            set
            {
                this.dateRegister = value;
            }
        }




        public void SaveAddressBook()
        {

        }
    }
}