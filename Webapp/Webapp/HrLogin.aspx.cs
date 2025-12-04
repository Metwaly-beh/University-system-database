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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void login(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["sherket-el-mor3ebeen-el-ma7dooda"].ToString();

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                using (SqlCommand loginproc = new SqlCommand("SELECT dbo.HRLoginValidation(@employee_ID, @password)", conn))
                {
                    loginproc.CommandType = CommandType.Text;

                    int id = Int16.Parse(username.Text);
                    String pass = password.Text;

                    loginproc.Parameters.Add(new SqlParameter("@employee_ID", id));
                    loginproc.Parameters.Add(new SqlParameter("@password", pass));

                    conn.Open();
                    object result = loginproc.ExecuteScalar();

                    if (result != null && Convert.ToBoolean(result))
                    {
                        Response.Write("تم");
                        //Response.Redirect();

                    }
                    else
                    {
                        Response.Write("Login failed. Invalid credentials or not an HR employee.");
                    }
                }
            }
        }
    }
}