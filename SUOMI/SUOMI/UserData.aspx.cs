using SUOMI.BE;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SUOMI
{
    public partial class UserData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {

            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            BE.User.UtenteCorrente.Age = int.Parse(txtAge.Text);
            BE.User.UtenteCorrente.Gender = txtGender.Text;
            BE.User.UtenteCorrente.Height = double.Parse(txtHeight.Text);
            BE.User.UtenteCorrente.Weight = double.Parse(txtWeight.Text);
            BE.User.UtenteCorrente.Heart_rate = int.Parse(txtHeartRate.Text);
            BE.User.UtenteCorrente.BMI = double.Parse(txtWeight.Text) /
                ((double.Parse(txtHeight.Text) / 100) * (double.Parse(txtHeight.Text) / 100));
            BLL.GestioneUsers.InsertUserData(BE.User.UtenteCorrente);
            Response.Redirect("Homepage.aspx");
        }
    }
}