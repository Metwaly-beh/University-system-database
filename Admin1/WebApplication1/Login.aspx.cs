using System;

namespace WebApplication1
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void signin_Click(object sender, EventArgs e)
        {
            string hardcodedAdminId = "admin";
            string hardcodedPassword = "admin123";

            if (adminId.Text == hardcodedAdminId && Password.Text == hardcodedPassword)
            {
                Response.Redirect("AdminHome.aspx");
            }
        }
    }
}