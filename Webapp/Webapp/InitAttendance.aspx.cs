using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace WebApplication1
{
    public partial class InitAttendance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnInit_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["sherket-el-mor3ebeen-el-ma7dooda"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("Initiate_Attendance", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}