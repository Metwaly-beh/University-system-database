using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Academic_Employee_Part_1
{
    public partial class ViewLeaveStatus : System.Web.UI.Page
    {
        protected void btnStatus_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["MyDatabase"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            try
            {
                int id = (int)Session["user_id"];
                SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.status_leaves(@id)", conn);
                cmd.Parameters.Add(new SqlParameter("@id", id));

                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gridLeaves.DataSource = dt;
                gridLeaves.DataBind();
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