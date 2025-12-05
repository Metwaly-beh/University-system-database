using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Academic_Employee_Part_1
{
    public partial class ViewDeductions : System.Web.UI.Page
    {
        protected void btnShow_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["MyDatabase"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            try
            {
                int id = (int)Session["user_id"];
                int month = Int32.Parse(txtMonth.Text);
                SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.Deductions_Attendance(@id, @month)", conn);
                cmd.Parameters.Add(new SqlParameter("@id", id));
                cmd.Parameters.Add(new SqlParameter("@month", month));
                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gridDeductions.DataSource = dt;
                gridDeductions.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }
    }
}