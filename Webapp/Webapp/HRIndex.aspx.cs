using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Webapp
{
    public partial class HrIndex : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void b1(object sender, EventArgs e)
        {
            Response.Redirect("HrLogin.aspx");
        }
        protected void b2(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }
    }
}