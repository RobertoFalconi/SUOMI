using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SUOMI.BE;

namespace SUOMI
{
    public partial class Homepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblWelcome.Text = BE.User.UtenteCorrente.Nickname;
            if (BE.User.UtenteCorrente.BMI >= 25)
            {
                lblBMI.Text = "higher than 25 (a bit overweight).";
            }
            else if (BE.User.UtenteCorrente.BMI < 25 && BE.User.UtenteCorrente.BMI > 15)
            {
                lblBMI.Text = "between 25 and 15 (normal weight).";
            }
            else
            {
                lblBMI.Text = "lower than 15 (low weight).";
            }

            if (BE.User.UtenteCorrente.Heart_rate > 100)
            {
                lblHR.Text = "higher than 100 (a bit of tachycardia).";
            }
            else
            {
                lblHR.Text = "lower than 100 (no tachycardia detected).";
            }
        }
      

        protected void btnLogoutDesktop_Click(object sender, EventArgs e)
        {
            BE.User.UtenteCorrente = null;
            Response.Redirect("Login.aspx");
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("RelaxArea.aspx");
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Spa.aspx");
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Tool.aspx");
        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Tea.aspx");
        }
    }
}