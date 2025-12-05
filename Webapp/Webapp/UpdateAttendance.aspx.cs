using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace WebApplication1
{
    public partial class UpdateAttendance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                string connStr = WebConfigurationManager.ConnectionStrings["sherket-el-mor3ebeen-el-ma7dooda"].ToString();
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("Update_Attendance", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Employee_id", int.Parse(txtEmployeeID.Text));

                        if (!string.IsNullOrEmpty(txtCheckIn.Text))
                            cmd.Parameters.AddWithValue("@check_in_time", TimeSpan.Parse(txtCheckIn.Text));
                        else
                            cmd.Parameters.AddWithValue("@check_in_time", DBNull.Value);

                        if (!string.IsNullOrEmpty(txtCheckOut.Text))
                            cmd.Parameters.AddWithValue("@check_out_time", TimeSpan.Parse(txtCheckOut.Text));
                        else
                            cmd.Parameters.AddWithValue("@check_out_time", DBNull.Value);

                        cmd.ExecuteNonQuery();
                    }

                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = "Attendance updated successfully";

                    txtEmployeeID.Text = "";
                    txtCheckIn.Text = "";
                    txtCheckOut.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Error: " + ex.Message;
            }
        }
    }
}