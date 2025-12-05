using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace GUC_Projet
{
    public partial class AcademicPart2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null) Session["user_id"] = 1;
        }

        void doProc(string procedureName, Action<SqlCommand> populateParams)
        {
            string str = WebConfigurationManager.ConnectionStrings["sherket-el-mor3ebeen-el-ma7dooda"].ToString();
            using (SqlConnection con = new SqlConnection(str))
            {
                SqlCommand cmd = new SqlCommand(procedureName, con);
                cmd.CommandType = CommandType.StoredProcedure;
                populateParams(cmd);
                con.Open();
                cmd.ExecuteNonQuery();
                lbl.Text = "Done";
            }
        }

        protected void applyAcc(object s, EventArgs e)
        {
            doProc("ApplyAccidentalLeave", c => {
                c.Parameters.AddWithValue("@EmpID", Session["user_id"]);
                c.Parameters.AddWithValue("@StartDate", tA1.Text);
                c.Parameters.AddWithValue("@EndDate", tA2.Text);
            });
        }

        protected void applyMed(object s, EventArgs e)
        {
            doProc("ApplyMedicalLeave", c => {
                c.Parameters.AddWithValue("@EmpID", Session["user_id"]);
                c.Parameters.AddWithValue("@StartDate", tM1.Text);
                c.Parameters.AddWithValue("@EndDate", tM2.Text);
                c.Parameters.AddWithValue("@Type", dM.SelectedValue);
            });
        }

        protected void applyUnp(object s, EventArgs e)
        {
            doProc("ApplyUnpaidLeave", c => {
                c.Parameters.AddWithValue("@EmpID", Session["user_id"]);
                c.Parameters.AddWithValue("@StartDate", tU1.Text);
                c.Parameters.AddWithValue("@EndDate", tU2.Text);
            });
        }

        protected void applyCom(object s, EventArgs e)
        {
            doProc("ApplyCompensationLeave", c => {
                c.Parameters.AddWithValue("@EmpID", Session["user_id"]);
                c.Parameters.AddWithValue("@OriginalWorkDate", tC1.Text);
                c.Parameters.AddWithValue("@Reason", tC2.Text);
            });
        }

        protected void doAction(object s, EventArgs e)
        {
            doProc("ApproveRejectLeave", c => {
                c.Parameters.AddWithValue("@AdminID", Session["user_id"]);
                c.Parameters.AddWithValue("@LeaveID", tLID.Text);
                c.Parameters.AddWithValue("@Status", dA.SelectedValue);
            });
        }

        protected void doEval(object s, EventArgs e)
        {
            doProc("EvaluateEmployee", c => {
                c.Parameters.AddWithValue("@DeanID", Session["user_id"]);
                c.Parameters.AddWithValue("@TargetEmpID", tEID.Text);
                c.Parameters.AddWithValue("@Rating", tR.Text);
                c.Parameters.AddWithValue("@Semester", tSem.Text);
                c.Parameters.AddWithValue("@Comment", tCom.Text);
            });
        }
    }
}