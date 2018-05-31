using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SUOMI
{
    public partial class Spa : System.Web.UI.Page
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
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Label1.Text = "";
            Button2.Visible = true;
            Button3.Visible = false;
        }
        protected void Button4_Click(object sender, EventArgs e)
        {
            Label2.Text = "You!";
            Button4.Visible = false;
            Button5.Visible = true;
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Label2.Text = "";
            Button4.Visible = true;
            Button5.Visible = false;
        }
        protected void Button6_Click(object sender, EventArgs e)
        {
            Label3.Text = "You!";
            Button6.Visible = false;
            Button7.Visible = true;
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Label3.Text = "";
            Button6.Visible = true;
            Button7.Visible = false;
        }
        protected void Button8_Click(object sender, EventArgs e)
        {
            Label4.Text = "You!";
            Button8.Visible = false;
            Button9.Visible = true;
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            Label4.Text = "";
            Button8.Visible = true;
            Button9.Visible = false;
        }
    }
}