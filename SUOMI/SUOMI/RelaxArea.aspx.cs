using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SUOMI
{
    public partial class RelaxArea : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogoutDesktop_Click(object sender, EventArgs e)
        {
            BE.User.UtenteCorrente = null;
            Response.Redirect("Login.aspx");
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Homepage.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Label1.Text = "You!";
            Button2.Visible = false;
            Button3.Visible = true;
            Button4.Visible = true;
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            Label1.Text = "";
            Button2.Visible = true;
            Button3.Visible = false;
            Button4.Visible = false;
        }
        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("RelaxAreaStore.aspx");
        }
    }
}