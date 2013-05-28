using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace eProject_SEM3_G1.Model.DataAccess
{
    public class UserDAO : DataAccessObject
    {
        private User userForAccess;
        public UserDAO(User user)
        {
            this.userForAccess = user;
        }

        public static User Login(string username, string password)
        {
            try
            {
                return new User(username, password);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static bool Register(User user)
        {
            try
            {
                return false;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool ChangePassword(string newPassword)
        {
            return false;
        }

        public override void Delete()
        {

        }
        public override void Update()
        {

        }
        public override void Add()
        {

        }
    }
}