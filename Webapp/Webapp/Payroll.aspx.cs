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
    public partial class Payroll : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void GeneratePayRoll(object sender, EventArgs e)
        {
            String connStr= WebConfigurationManager.ConnectionStrings["sherket-el-mor3ebeen-el-ma7dooda"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int empID = Int16.Parse(TextBox1.Text);
            DateTime from = DateTime.Parse(TextBox2.Text);
            DateTime to = DateTime.Parse(TextBox3.Text);
            SqlCommand cmd = new SqlCommand("Add_Payroll", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@employee_ID", empID));
            cmd.Parameters.Add(new SqlParameter("@from", from));
            cmd.Parameters.Add(new SqlParameter("@to", to));

            conn.Open();
            cmd.ExecuteNonQuery();



            SqlCommand getData = new SqlCommand("SELECT * FROM Payroll WHERE emp_ID = @emp_ID", conn);
            getData.Parameters.Add(new SqlParameter("@emp_ID", empID));
            SqlDataReader rdr = getData.ExecuteReader();

            while (rdr.Read())
            {
                Label display = new Label();
                display.Text = "ID: " + rdr["ID"].ToString() +
                           " | Employee: " + rdr["emp_ID"].ToString() +
                           " | Final Salary: " + rdr["final_salary_amount"].ToString() +
                           " | Bonus: " + rdr["bonus_amount"].ToString() +
                           " | Deductions: " + rdr["deductions_amount"].ToString() +
                           " | Comments: " + rdr["comments"].ToString() +
                           " | Payment Date: " + rdr["payment_date"].ToString() + "<br/>";
                form1.Controls.Add(display);
            }

            conn.Close();
            Response.Write("done");





        }

    }
}