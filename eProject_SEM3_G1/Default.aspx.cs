using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eProject_SEM3_G1
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                List<Model.IncomeStatistics> listIncome = Model.DataAccess.StatisticsDAO.GetIncomeByPeriod(new DateTime(2013, 5, 26), new DateTime(2013, 5, 30));
                Response.Write(listIncome.Count.ToString());
            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }
            
        }
    }
}