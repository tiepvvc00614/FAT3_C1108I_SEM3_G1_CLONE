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
                command.Parameters.AddWithValue("@date_from", start);
                command.Parameters.AddWithValue("@date_to", end);
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
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
                
                throw ex;
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
                return listProductReturn;
            }
            catch (Exception ex)
            {
                
                throw ex;
            }
        }

        public static List<OrderStatistics> GetOrderByPeriod(DateTime start, DateTime end)
        {
            try
            {
                List<OrderStatistics> listOrderReturn = new List<OrderStatistics>();
                SqlConnection con = DatabaseFactory.GetConnection(DatabaseFactory.SQL_TYPE_MSSQL).GetConnection();
                SqlCommand command = new SqlCommand();
                command.Connection = con;
                command.CommandText = "Statistics_order";
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@date_from", start);
                command.Parameters.AddWithValue("@date_to", end);
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    OrderStatistics order = new OrderStatistics();
                    order.OrderDate = reader.GetDateTime(0);
                    order.CountOrder = reader.GetInt32(1);
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