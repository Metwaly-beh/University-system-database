using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Project
{
    public partial class AdminPart2 : System.Web.UI.Page
    {
        string connStr = WebConfigurationManager.ConnectionStrings["sherket-el-mor3ebeen-el-ma7dooda"].ToString();

        protected void btnYesterday_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(connStr);
            SqlDataAdapter da = new SqlDataAdapter("EXEC FetchYesterdayAttendance", conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gridYesterday.DataSource = dt;
            gridYesterday.DataBind();
        }

        protected void btnWinter_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(connStr);
            SqlDataAdapter da = new SqlDataAdapter("EXEC FetchWinterPerformance", conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gridWinter.DataSource = dt;
            gridWinter.DataBind();
        }

        protected void btnRemoveHoliday_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("EXEC RemoveHolidayAttendance", conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            lblMsg.Text = "Done";
        }

        protected void btnRemoveDayoff_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("EXEC RemoveUnattendedDayOff @id", conn);
            cmd.Parameters.AddWithValue("@id", txtDayoffID.Text);
            conn.Open();
            cmd.ExecuteNonQuery();
            lblMsg.Text = "Done";
        }

        protected void btnRemoveApproved_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("EXEC RemoveApprovedLeavesFromAttendance", conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            lblMsg.Text = "Done";
        }

        protected void btnReplace_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("EXEC ReplaceEmployee @old,@new", conn);
            cmd.Parameters.AddWithValue("@old", txtOldEmp.Text);
            cmd.Parameters.AddWithValue("@new", txtNewEmp.Text);
            conn.Open();
            cmd.ExecuteNonQuery();
            lblMsg.Text = "Done";
        }

        protected void btnUpdateStatus_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("EXEC UpdateEmploymentStatusDaily", conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            lblMsg.Text = "Done";
        }
    }
}