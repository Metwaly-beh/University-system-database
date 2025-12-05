using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace WebApplication1
{
    public partial class AddHoliday : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void AddHoliday_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["sherket-el-mor3ebeen-el-ma7dooda"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd1 = new SqlCommand("Create_Holiday", conn);
            cmd1.CommandType = CommandType.StoredProcedure;
            conn.Open();
            cmd1.ExecuteNonQuery();

            SqlCommand cmd2 = new SqlCommand("Add_Holiday", conn);
            cmd2.CommandType = CommandType.StoredProcedure;
            cmd2.Parameters.AddWithValue("@holiday_name", txtHolidayName.Text);
            cmd2.Parameters.AddWithValue("@from_date", DateTime.Parse(From.Text));
            cmd2.Parameters.AddWithValue("@to_date", DateTime.Parse(To.Text));
            cmd2.ExecuteNonQuery();

            conn.Close();
        }
    }
}