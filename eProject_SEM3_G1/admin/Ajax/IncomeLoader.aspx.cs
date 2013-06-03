using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eProject_SEM3_G1.admin.Ajax
{
    public partial class IncomeLoader : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Response.ContentType = "application/json";
                if (Request.Params["fromDate"] != null &&
                    Request.Params["toDate"] != null)
                {
                    DateTime fromDate = DateTime.Parse(Request.Params["fromDate"].ToString());
                    DateTime toDate = DateTime.Parse(Request.Params["toDate"].ToString());

                    List<Model.IncomeStatistics> listIncome = Model.DataAccess.StatisticsDAO.GetIncomeByPeriod(fromDate, toDate);

                    Response.Write(Model.IncomeStatistics.ToJSONString(listIncome));


                }
                else
                {

                    /*DateTime toDate = DateTime.Now;
                    DateTime fromDate = DateTime.Now.AddDays(-7);
                    List<Model.IncomeStatistics> listIncome = Model.DataAccess.StatisticsDAO.GetIncomeByPeriod(fromDate, toDate);
                    Response.Write(Model.IncomeStatistics.ToJSONString(listIncome));*/
                    string dateString = "4/1/2008 8:30:52 AM";
                    DateTime date1 = DateTime.Parse(dateString,
                                              System.Globalization.CultureInfo.InvariantCulture);
                    dateString = "4/2/2008 8:30:52 AM";
                    DateTime date2 = DateTime.Parse(dateString,
                                              System.Globalization.CultureInfo.InvariantCulture);
                    dateString = "4/3/2008 8:30:52 AM";
                    DateTime date3 = DateTime.Parse(dateString,
                                              System.Globalization.CultureInfo.InvariantCulture);
                    dateString = "4/4/2008 8:30:52 AM";
                    DateTime date4 = DateTime.Parse(dateString,
                                              System.Globalization.CultureInfo.InvariantCulture);
                    dateString = "4/5/2008 8:30:52 AM";
                    DateTime date5 = DateTime.Parse(dateString,
                                              System.Globalization.CultureInfo.InvariantCulture);
                    dateString = "4/6/2008 8:30:52 AM";
                    DateTime date6 = DateTime.Parse(dateString,
                                              System.Globalization.CultureInfo.InvariantCulture);
                    dateString = "4/7/2008 8:30:52 AM";
                    DateTime date7 = DateTime.Parse(dateString,
                                              System.Globalization.CultureInfo.InvariantCulture);
                    dateString = "4/8/2008 8:30:52 AM";
                    DateTime date8 = DateTime.Parse(dateString,
                                              System.Globalization.CultureInfo.InvariantCulture);
                    dateString = "4/9/2008 8:30:52 AM";
                    DateTime date9 = DateTime.Parse(dateString,
                                              System.Globalization.CultureInfo.InvariantCulture);

                    List<Model.IncomeStatistics> listIncome = new List<Model.IncomeStatistics>();
                    Model.IncomeStatistics i1 = new Model.IncomeStatistics();
                    i1.DetailTotal = 4500;
                    i1.OrderDate = date1;

                    Model.IncomeStatistics i2 = new Model.IncomeStatistics();
                    i2.DetailTotal = 2700;
                    i2.OrderDate = date2;

                    Model.IncomeStatistics i3 = new Model.IncomeStatistics();
                    i3.DetailTotal = 6719;
                    i3.OrderDate = date3;

                    Model.IncomeStatistics i4 = new Model.IncomeStatistics();
                    i4.DetailTotal = 3727;
                    i4.OrderDate = date4;

                    Model.IncomeStatistics i5 = new Model.IncomeStatistics();
                    i5.DetailTotal = 4100;
                    i5.OrderDate = date5;

                    Model.IncomeStatistics i6 = new Model.IncomeStatistics();
                    i6.DetailTotal = 5422;
                    i6.OrderDate = date6;

                    Model.IncomeStatistics i7 = new Model.IncomeStatistics();
                    i7.DetailTotal = 2839;
                    i7.OrderDate = date7;

                    Model.IncomeStatistics i8 = new Model.IncomeStatistics();
                    i8.DetailTotal = 4900;
                    i8.OrderDate = date8;

                    Model.IncomeStatistics i9 = new Model.IncomeStatistics();
                    i9.DetailTotal = 2233;
                    i9.OrderDate = date9;

                    listIncome.Add(i1);
                    listIncome.Add(i2);
                    listIncome.Add(i3);
                    listIncome.Add(i4);
                    listIncome.Add(i5);
                    listIncome.Add(i6);
                    listIncome.Add(i7);
                    listIncome.Add(i8);
                    listIncome.Add(i9);

                    Response.Write(Model.IncomeStatistics.ToJSONString(listIncome));
                }


            }
            catch (Exception ex)
            {
                Response.Write("{\"message\": \""+ ex.Message +"\"}");
            }
      
            
        }
    }
}