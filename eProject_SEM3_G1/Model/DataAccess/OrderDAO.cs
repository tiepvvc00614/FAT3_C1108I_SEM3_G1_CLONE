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
                listKV.Add("@id", orderid);
                SqlDataReader reader = DatabaseFactory.DataReader(System.Data.CommandType.StoredProcedure, "GetOrderById", listKV, DatabaseFactory.GetConnection(DatabaseFactory.SQL_TYPE_MSSQL).GetConnection());
                if (reader.Read())
                {
                    orderReturn = new Order();
                    orderReturn.OrderId = reader.GetInt32(0);
                    orderReturn.Email = reader.GetString(1);
                    orderReturn.Status = reader.GetInt32(3);
                    orderReturn.DateOrder = reader.GetDateTime(2);
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
                    OrderDetails odTmp = new OrderDetails(Product.GetProduct(reader.GetInt32(3)), reader.GetInt32(1));
                    odTmp.OrderDetailId = reader.GetInt32(0);
                    listReturn.Add(odTmp);
                }
                reader.Close();
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
                    billingTmp = new BillingAddress();
                    billingTmp.AddressId = reader.GetInt32(0);
                    billingTmp.FullAddress = reader.GetString(1); 
                    billingTmp.FirstName = reader.GetString(4); 
                    billingTmp.LastName = reader.GetString(5); 
                    billingTmp.State = reader.GetString(6); 
                    billingTmp.ZipCode = reader.GetString(7);
                    billingTmp.City = reader.GetString(2);
                    billingTmp.Country = new Country(reader.GetString(3));
                    billingTmp.OrderId = this.orderForAccess.OrderId;
                }
                reader.Close();
                if (billingTmp == null) throw new Exception("Fail to get billing");
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
                    shippingTmp.AddressId = reader.GetInt32(0);
                    shippingTmp.FullAddress = reader.GetString(1);
                    shippingTmp.FirstName = reader.GetString(4);
                    shippingTmp.LastName = reader.GetString(5);
                    shippingTmp.State = reader.GetString(6);
                    shippingTmp.ZipCode = reader.GetString(7);
                    shippingTmp.City = reader.GetString(2);
                    shippingTmp.Phone = reader.GetString(8);
                    shippingTmp.Country = new Country(reader.GetString(3));
                    shippingTmp.OrderId = this.orderForAccess.OrderId;
                }
                reader.Close();
                if (shippingTmp == null) throw new Exception("Fail to get shipping");
                return shippingTmp;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}