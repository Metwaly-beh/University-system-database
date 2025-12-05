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
    public partial class CompApprove : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["sherket-el-mor3ebeen-el-ma7dooda"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("SELECT L.request_ID, L.date_of_request, L.start_date, L.end_date, L.num_days, L.final_approval_status FROM Leave L INNER JOIN Compensation_Leave UL ON L.request_ID = UL.request_ID WHERE L.final_approval_status = 'Pending'", conn);
            conn.Open();

            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                Label display = new Label();
                display.Text = rdr["request_ID"].ToString() + "    from  " + rdr["start_date"].ToString() + "    to  " + rdr["end_date"].ToString() + "</br>";
                form1.Controls.Add(display);

            }

        }

        protected void ApproveProcCall(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["sherket-el-mor3ebeen-el-ma7dooda"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int rid = Int16.Parse(Request_id.Text);
            int hr = Int16.Parse(HR_ID.Text);

            SqlCommand cmd = new SqlCommand("HR_approval_comp", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@request_ID", rid));
            cmd.Parameters.Add(new SqlParameter("@HR_ID", hr));

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Write("done");
        }
    }
}