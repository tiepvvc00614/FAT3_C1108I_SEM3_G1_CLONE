using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using eProject_SEM3_G1.Model.DataAccess;
using eProject_SEM3_G1.Utilities.Cryptography;

namespace eProject_SEM3_G1.Model
{
    
    public class User : Customer
    {
        public static int STATUS_UNACTIVE = 0;
        public static int STATUS_ACTIVE = 1;
        public static int STATUS_BANNED = 2;
        public static string USER_SESSION_KEY = "session_bs_email_login";
        public static string USER_COOKIE_EMAIL_KEY = "bs_email_login";
        public static string USER_COOKIE_PASSWORD_KEY = "bs_password_login";

        private int userId;
        private string username;
        private string password;
        private int status;
        private string userEmail;
        private string firstname;
        private string lastname;       
        private DateTime dateRegister;
        List<AddressBook> addressbooks;
        private UserDAO userDataAccess;

        public User()
        {
            this.userDataAccess = new UserDAO(this);
        }
        public User(string email, string password)
        {

            this.userEmail = email;
            this.password = MD5Encrypt.GetMd5(password);
            this.status = STATUS_ACTIVE;
            this.dateRegister = DateTime.Now;
            this.userDataAccess = new UserDAO(this);
        }
        public string Firstname
        {
            get { return firstname; }
            set { firstname = value; }
        }
        public string Lastname
        {
            get { return lastname; }
            set { lastname = value; }
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
            set
            {
                this.username = value;
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
                    this.password = MD5Encrypt.GetMd5(value);
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


        public bool Register() 
        {
            return this.userDataAccess.Register();
        }

        public static User Login(string email, string password)
        {
            return UserDAO.Login(email, password);
        }

        public void SaveAddressBook()
        {

        }
    }
}