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
    public partial class LeaveApprove : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["sherket-el-mor3ebeen-el-ma7dooda"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            SqlCommand cmd = new SqlCommand("SELECT L.*, CASE   WHEN AL.request_ID IS NOT NULL THEN 'Annual'WHEN AC.request_ID IS NOT NULL THEN 'Accidental'       END AS leave_type FROM Leave L LEFT JOIN Annual_Leave AL ON L.request_ID = AL.request_ID LEFT JOIN Accidental_Leave AC ON L.request_ID = AC.request_ID WHERE L.final_approval_status = 'Pending'  AND (AL.request_ID IS NOT NULL OR AC.request_ID IS NOT NULL)", conn);

            conn.Open();

            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            { 
                Label display=new Label();
                display.Text = rdr["request_ID"].ToString()+"    " + rdr["start_date"].ToString() + "    " +

                    rdr["num_days"].ToString() + "    "+
                    rdr["leave_type"].ToString() + "</br>";
                form1.Controls.Add(display);

            }


        }



        protected void ApproveProcCall(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["sherket-el-mor3ebeen-el-ma7dooda"].ToString();
            SqlConnection conn=new SqlConnection(connStr);

            int rid = Int16.Parse(Request_id.Text);
            int hr = Int16.Parse(HR_ID.Text);

            SqlCommand cmd = new SqlCommand("HR_approval_an_acc", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@request_ID",rid));
            cmd.Parameters.Add(new SqlParameter("@HR_ID", hr));

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Write("done");
        }
    }
}