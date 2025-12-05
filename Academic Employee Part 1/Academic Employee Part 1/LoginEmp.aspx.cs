using System;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Academic_Employee_Part_1
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void signin_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["MyDatabase"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            try
            {
                int id = int.Parse(loginID.Text);
                string pass = loginPassword.Text;
                SqlCommand cmd = new SqlCommand("SELECT dbo.EmployeeLoginValidation(@id, @pass)", conn);
                cmd.Parameters.Add(new SqlParameter("@id", id));
                cmd.Parameters.Add(new SqlParameter("@pass", pass));
                conn.Open();
                object result = cmd.ExecuteScalar();

                if (result.ToString() == "True")
                {
                    Session["user_id"] = id;
                    Response.Redirect("Home.aspx");
                    lblMessage.Text = "Login Successful!";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblMessage.Text = "Invalid Login Credentials.";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
            finally
            {
                conn.Close();
            }
        }
    }
}