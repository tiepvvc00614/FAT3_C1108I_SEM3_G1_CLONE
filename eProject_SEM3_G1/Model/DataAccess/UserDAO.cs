using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using eProject_SEM3_G1.Utilities.DatabaseConnection;
using eProject_SEM3_G1.Utilities.Cryptography;

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
                User user = null; 
                password = MD5Encrypt.GetMd5(password);
                SqlConnection con = DatabaseFactory.GetConnection(DatabaseFactory.SQL_TYPE_MSSQL).GetConnection();
                SqlCommand command = new SqlCommand();
                command.Connection = con;
                command.CommandText = "Login";
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@username", username);
                command.Parameters.AddWithValue("@password", password);

                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    user = new User(reader.GetString(0),reader.GetString(1));
                    user.UserEmail = reader.GetString(2);
                    user.DateRegister = reader.GetDateTime(3);
                    user.UserID = reader.GetInt32(4);
                }
                return user;
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
                SqlConnection con= DatabaseFactory.GetConnection(DatabaseFactory.SQL_TYPE_MSSQL).GetConnection() ;
                SqlCommand command = new SqlCommand();
                command.Connection = con;
                command.CommandText = "RegisterUser";
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@bs_User_username", user.Username);
                command.Parameters.AddWithValue("@bs_User_password", user.Password);
                command.Parameters.AddWithValue("@bs_User_status", user.Status);
                command.Parameters.AddWithValue("@bs_User_email", user.UserEmail);
                command.Parameters.AddWithValue("@bs_User_date", user.DateRegister);
                int result=command.ExecuteNonQuery();                
                return result == 1;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool ChangePassword(string newPassword)
        {
            try
            {
                newPassword = MD5Encrypt.GetMd5(newPassword);
                SqlCommand command = new SqlCommand();
                command.Connection = this.connectionForAccess;
                command.CommandText = "ChangePassword";
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@bs_User_userid", this.userForAccess.UserID);
                command.Parameters.AddWithValue("@bs_User_password", newPassword);

                return command.ExecuteNonQuery() == 1;
            }
            catch (Exception ex)
            {
                
                throw ex;
            }
           
        }

        public override void Delete()
        {
            try
            {
                SqlCommand command = new SqlCommand();
                command.Connection = this.connectionForAccess;
                command.CommandText = "DeleteUser";
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@bs_User_userid", this.userForAccess.UserID);
                command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                
                throw ex;
            }
        }
        public override void Update()
        {
            try
            {
                if( this.userForAccess.UserID == 0)
                    throw new Exception("User ID not exits");
                if (this.userForAccess.UserEmail == null)
                    throw new Exception("Email of User is not null");
                if (this.userForAccess.DateRegister == null)
                    throw new Exception("Date is not format");
                SqlCommand command = new SqlCommand();
                command.Connection = this.connectionForAccess;
                command.CommandText = "UpdateUser";
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@bs_User_userid", this.userForAccess.UserID);
                command.Parameters.AddWithValue("@bs_User_useremail", this.userForAccess.UserEmail);
                command.Parameters.AddWithValue("@bs_User_userdateregis", this.userForAccess.DateRegister);
                command.Parameters.AddWithValue("@bs_User_username", this.userForAccess.Username);
                command.Parameters.AddWithValue("@bs_User_password", this.userForAccess.Password);
                command.Parameters.AddWithValue("@bs_User_status", this.userForAccess.Status);
                command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }
        public override void Add()
        {
            throw new NotImplementedException("Not implemented");
        }
    }
}