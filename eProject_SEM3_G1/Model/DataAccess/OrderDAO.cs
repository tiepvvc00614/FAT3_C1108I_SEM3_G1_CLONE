using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using eProject_SEM3_G1.Utilities.DatabaseConnection;

namespace eProject_SEM3_G1.Model.DataAccess
{
    public class OrderDAO : DataAccessObject
    {
        private Order orderForAccess;
        public OrderDAO(Order order) : base()
        {
            this.orderForAccess = order;
        }
        public override void Delete()
        {
            
        }

        public override void Update()
        {
            try
            {
                SqlCommand command = new SqlCommand();
                command.Connection = this.connectionForAccess;
                command.CommandText = "UpdateOrder";
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@Status_Order", this.orderForAccess.Status);
                command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {

                throw new Exception("You can't Update Order ");
            }
            
        }

        public override void Add()
        {
            
        }

        public static Order GetOrderByOrderId(int orderid)
        {
            try
            {
                Order orderReturn = null;
                SqlConnection con = DatabaseFactory.GetConnection(DatabaseFactory.SQL_TYPE_MSSQL).GetConnection();
                SqlCommand command = new SqlCommand();
                command.Connection = con;
                command.CommandText = "GetOrderByOrderId";
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@orderid", orderid);
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    orderReturn = new Order();
                    orderReturn.OrderId = reader.GetInt32(0);
                    orderReturn.Email = reader.GetString(1);
                    orderReturn.Status = reader.GetInt32(2);
                    orderReturn.DateOrder = reader.GetDateTime(3);
                    reader.Close();
                }
                else
                {
                    throw new Exception("Order ID is not exits");
                }
                return orderReturn;
                
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<OrderDetails> GetOrderDetails()
        {
            try
            {
                return null;
            }
            catch (Exception ex)
            {
                throw ex;
            }
      
        }
    }
}