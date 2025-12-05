using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;

namespace WebApplication1
{
    public partial class ViewEmployees_click : System.Web.UI.Page

    {
        protected GridView GridView;
        protected void ViewEmployees_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["sherket-el-mor3ebeen-el-ma7dooda"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("SELECT * FROM Employee", conn);

            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            GridView1.DataSource = rdr;
            GridView1.DataBind();
            conn.Close();
        }
    }
}