using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Academic_Employee_Part_1
{
    public partial class ApplyAnnualLeave : System.Web.UI.Page
    {
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["sherket-el-mor3ebeen-el-ma7dooda"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            try
            {
                int id = (int)Session["user_id"];
                int repId = Int32.Parse(txtReplacement.Text);

                // This will read the text string (e.g., "2025-01-01") and convert it to a Date
                DateTime start = DateTime.Parse(txtStart.Text);
                DateTime end = DateTime.Parse(txtEnd.Text);

                SqlCommand cmd = new SqlCommand("Submit_annual", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@employee_ID", id));
                cmd.Parameters.Add(new SqlParameter("@replacement_emp", repId));
                cmd.Parameters.Add(new SqlParameter("@start_date", start));
                cmd.Parameters.Add(new SqlParameter("@end_date", end));

                conn.Open();
                cmd.ExecuteNonQuery();

                lblMsg.Text = "Leave applied successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
            }
            catch (Exception ex)
            {
                lblMsg.Text = "Error: " + ex.Message;
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
            finally
            {
                conn.Close();
            }
        }
    }
}