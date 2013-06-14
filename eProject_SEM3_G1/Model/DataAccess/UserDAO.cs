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

        public static User Login(string email, string password)
        {
            
            try
            {
                User user = null; 
                password = MD5Encrypt.GetMd5(password);
                SqlConnection con = DatabaseFactory.GetConnection(DatabaseFactory.SQL_TYPE_MSSQL).GetConnection();
                SqlCommand command = new SqlCommand();
                command.Connection = con;
                command.CommandText = "LoginPROC";
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@email_login", email);
                command.Parameters.AddWithValue("@password_login", password);

                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    user = new User();
                    user.UserEmail = reader.GetString(0);
                    user.UserID = reader.GetInt32(1);
                    user.Firstname = reader.GetString(2);
                    user.Lastname = reader.GetString(3);
                    user.Status = reader.GetInt32(4);
                    user.Username = reader.GetString(5);
                    user.DateRegister = reader.GetDateTime(6);
                }
                return user;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool Register()
        {
            try
            {
                Dictionary<string, object> listKV = new Dictionary<string, object>();
                listKV.Add("@email", this.userForAccess.UserEmail);
                listKV.Add("@firstname", this.userForAccess.Firstname);
                listKV.Add("@lastname", this.userForAccess.Lastname);
                listKV.Add("@status", this.userForAccess.Status);
                listKV.Add("@username", this.userForAccess.UserEmail);
                listKV.Add("@password", this.userForAccess.Password);
                listKV.Add("@date", DateTime.Now);
                int result = DatabaseFactory.DataUpdate(System.Data.CommandType.StoredProcedure, "Regiter", DatabaseFactory.GetConnection(DatabaseFactory.SQL_TYPE_MSSQL).GetConnection(), listKV);

                return result == 1;
            }
            catch (Exception ex)
            {
                if (ex.Message.Contains("Violation of UNIQUE KEY constraint")) throw new Exception("Email has been exist");
                else throw ex;
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
                command.Parameters.AddWithValue("@password_login", this.userForAccess.Password);
                command.Parameters.AddWithValue("@email_login", this.userForAccess.UserEmail);
                command.Parameters.AddWithValue("@new_password", newPassword);

                return command.ExecuteNonQuery() == 1;
            }
            catch (Exception ex)
            {

                throw new Exception("User ID  wrong, please check again !!!!! ");
            }
           
        }

        public override void Delete()
        {
                /*SqlCommand command = new SqlCommand();
                command.Connection = this.connectionForAccess;
                command.CommandText = "DeleteUser";
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@bs_User_userid", this.userForAccess.UserID);
                command.ExecuteNonQuery();*/
                throw new NotImplementedException("Not supported");
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
                command.CommandText = "ChangeStatus";
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@user_id", this.userForAccess.UserID);
                command.Parameters.AddWithValue("@new_status", this.userForAccess.Status);
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