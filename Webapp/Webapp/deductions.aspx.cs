using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Webapp
{
    public partial class deductions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["sherket-el-mor3ebeen-el-ma7dooda"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("SELECT attendance_ID, date, check_in_time, check_out_time, total_duration, status, emp_ID FROM Attendance", conn);
            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                Label display = new Label();
                display.Text = rdr["attendance_ID"].ToString() + "    " +
                                  rdr["date"].ToString() + "    " +
                                rdr["check_in_time"].ToString() + "    " +
                                  rdr["check_out_time"].ToString() + "    " +
                                  rdr["total_duration"].ToString() + "    " +
                                  rdr["status"].ToString() + "   empID: " +
                                  rdr["emp_ID"].ToString() + "</br>";
                form1.Controls.Add(display);
            }
        }



        protected void DeductHoursP(object sender, EventArgs e) 
        {
            string connStr = WebConfigurationManager.ConnectionStrings["sherket-el-mor3ebeen-el-ma7dooda"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int empID = Int16.Parse(TextBox1.Text);

            SqlCommand cmd = new SqlCommand("Deduction_hours", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@employee_ID", empID));


            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Write("done");


        }

        protected void DeductDaysP(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["sherket-el-mor3ebeen-el-ma7dooda"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int empID = Int16.Parse(TextBox1.Text);

            SqlCommand cmd = new SqlCommand("Deduction_days", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@employee_ID", empID));


            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Write("done1");


        }

        protected void DeductUnpaidP(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["sherket-el-mor3ebeen-el-ma7dooda"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int empID = Int16.Parse(TextBox1.Text);

            SqlCommand cmd = new SqlCommand("Deduction_unpaid", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@employee_ID", empID));


            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Write("done2");


        }
    }
}