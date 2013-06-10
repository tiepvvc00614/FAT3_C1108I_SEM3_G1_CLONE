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
                Dictionary<string, object> listKV = new Dictionary<string,object>();
                listKV.Add("@order_id", orderid);
                SqlDataReader reader = DatabaseFactory.DataReader(System.Data.CommandType.StoredProcedure, "GetOrderByOrderId", listKV, DatabaseFactory.GetConnection(DatabaseFactory.SQL_TYPE_MSSQL).GetConnection());
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
                Dictionary<string, object> listKV = new Dictionary<string,object>();
                listKV.Add("@order_id", this.orderForAccess.OrderId.ToString());
                SqlDataReader reader = DatabaseFactory.DataReader(System.Data.CommandType.StoredProcedure, "GetOrderDetail", listKV, this.connectionForAccess);

                List<OrderDetails> listReturn = new List<OrderDetails>();
                while (reader.Read())
                {
                    OrderDetails odTmp = new OrderDetails(Product.GetProduct(reader.GetInt32(2)), reader.GetInt32(1));
                    odTmp.OrderDetailId = reader.GetInt32(0);
                    listReturn.Add(odTmp);
                }
                return listReturn;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public BillingAddress GetBilling()
        {
            try
            {
                Dictionary<string, object> listKV = new Dictionary<string,object>();
                listKV.Add("@order_id", this.orderForAccess.OrderId.ToString());

                BillingAddress billingTmp = null;

                SqlDataReader reader = DatabaseFactory.DataReader(System.Data.CommandType.StoredProcedure, "GetBilling", listKV, this.connectionForAccess);
                if (reader.Read())
                {
                    billingTmp.AddressId = reader.GetInt32(0);
                    billingTmp.Firstname = reader.GetString(1);
                    billingTmp.Lastname = reader.GetString(2);
                    billingTmp.State = reader.GetString(3);
                    billingTmp.ZipCode = reader.GetString(4);
                    billingTmp.City = reader.GetString(5);
                    billingTmp.OrderId = this.orderForAccess.OrderId;
                }

                return billingTmp;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public ShippingAddress GetShipping()
        {
            try
            {
                Dictionary<string, object> listKV = new Dictionary<string, object>();
                listKV.Add("@order_id", this.orderForAccess.OrderId.ToString());

                ShippingAddress shippingTmp = null;

                SqlDataReader reader = DatabaseFactory.DataReader(System.Data.CommandType.StoredProcedure, "GetShipping", listKV, this.connectionForAccess);

                if (reader.Read())
                {
                    shippingTmp = new ShippingAddress();
                    
                }
                return shippingTmp;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}