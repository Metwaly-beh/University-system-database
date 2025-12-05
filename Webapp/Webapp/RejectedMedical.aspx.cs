using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class RejectedMedical : System.Web.UI.Page
    {
        protected void RejectedMedical_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["sherket-el-mor3ebeen-el-ma7dooda"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("SELECT * FROM Leave WHERE LeaveType='Medical' AND Status='Rejected'", conn);

            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            GridView1.DataSource = rdr;
            GridView1.DataBind();
            conn.Close();
        }
    }
}