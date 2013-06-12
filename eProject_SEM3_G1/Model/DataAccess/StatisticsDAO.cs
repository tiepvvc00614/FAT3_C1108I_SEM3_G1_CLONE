using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using eProject_SEM3_G1.Utilities.DatabaseConnection;

namespace eProject_SEM3_G1.Model.DataAccess
{
    public class StatisticsDAO : DataAccessObject
    {
        public override void Delete()
        {

        }
        public override void Update()
        {

        }
        public override void Add()
        {

        }
        public static List<IncomeStatistics> GetIncomeByPeriod(DateTime start, DateTime end)
        {
            try
            {
                SqlConnection con = DatabaseFactory.GetConnection(DatabaseFactory.SQL_TYPE_MSSQL).GetConnection();
                List<IncomeStatistics> listIncSReturn = new List<IncomeStatistics>();
                SqlCommand command = new SqlCommand();
                command.Connection = con;
                command.CommandText = "Statistics_income";
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@date_from", new System.Data.SqlTypes.SqlDateTime(start));
                command.Parameters.AddWithValue("@date_to", new System.Data.SqlTypes.SqlDateTime(end));
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    //throw new Exception(reader.GetType().ToString());
                    IncomeStatistics incs = new IncomeStatistics();
                    incs.OrderDate = reader.GetDateTime(0);
                    incs.DetailTotal = float.Parse(reader.GetValue(1).ToString());
                    listIncSReturn.Add(incs);
                }
                reader.Close();
                return listIncSReturn;
            }
            catch (Exception ex)
            {

                throw new Exception("Date Start or Date End wrong, please check again !!!!! ");
            }
        }

        public static List<ProductStatistic> GetHotProduct(int currentPage)
        {
            try
            {
                SqlConnection con = DatabaseFactory.GetConnection(DatabaseFactory.SQL_TYPE_MSSQL).GetConnection();
                List<ProductStatistic> listProductReturn = new List<ProductStatistic>();
                SqlCommand command = new SqlCommand();
                command.Connection = con;
                command.CommandText = "Statistics_hotproduct";
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@number", currentPage);
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    ProductStatistic product = new ProductStatistic(reader.GetInt32(2));
                    product.ProductName = reader.GetString(0);
                    product.ProductId = reader.GetInt32(1);
                    listProductReturn.Add(product);
                }
                reader.Close();
                return listProductReturn;
            }
            catch (Exception ex)
            {

                throw new Exception("Current page isnt exit, please check again !!!!! ");
            }
        }

        /*public static List<OrderStatistics> GetOrderByPeriod(DateTime start, DateTime end)
        {
            try
            {
                List<OrderStatistics> listOrderReturn = new List<OrderStatistics>();
                SqlConnection con = DatabaseFactory.GetConnection(DatabaseFactory.SQL_TYPE_MSSQL).GetConnection();
                SqlCommand command = new SqlCommand();
                command.Connection = con;
                command.CommandText = "Statistics_order";
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@date_from", new System.Data.SqlTypes.SqlDateTime(start));
                command.Parameters.AddWithValue("@date_to", new System.Data.SqlTypes.SqlDateTime(end));
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    OrderStatistics order = new OrderStatistics();
                    order.OrderDate = reader.GetDateTime(0);
                    order.CountOrder = reader.GetInt32(1);
                    listOrderReturn.Add(order);
                }
                reader.Close();
                return listOrderReturn;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }*/

        public static List<Order> GetOrder(DateTime start, DateTime end)
        {
            try
            {
                List<Order> listOrderReturn = new List<Order>();
                SqlConnection con = DatabaseFactory.GetConnection(DatabaseFactory.SQL_TYPE_MSSQL).GetConnection();
                SqlCommand command = new SqlCommand();
                command.Connection = con;
                command.CommandText = "SearchOrderByTime";
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@date_from", new System.Data.SqlTypes.SqlDateTime(start));
                command.Parameters.AddWithValue("@date_to", new System.Data.SqlTypes.SqlDateTime(end));
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    Order order = Order.GetOrder(reader.GetInt32(0));
                    listOrderReturn.Add(order);
                }
                return listOrderReturn;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<Order> GetOrder(DateTime start, DateTime end, int status)
        {
            try
            {
                Dictionary<string, object> listKV = new Dictionary<string, object>();
                listKV.Add("@date_from", start);
                listKV.Add("@date_to", end);
                listKV.Add("@status", status);
                List<Order> listOrderReturn = new List<Order>();
                SqlDataReader reader = DatabaseFactory.DataReader(System.Data.CommandType.StoredProcedure, "SearchOrderByStatus", listKV, DatabaseFactory.GetConnection(DatabaseFactory.SQL_TYPE_MSSQL).GetConnection());

                while (reader.Read())
                {
                    Order order = Order.GetOrder(reader.GetInt32(0));
                    listOrderReturn.Add(order);
                }
                return listOrderReturn;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

       
    }
}