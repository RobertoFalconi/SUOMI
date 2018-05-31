using SUOMI.BE;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SUOMI
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLoginNew_Click(object sender, EventArgs e)
        {
            User nuovoUser = new User(txtNicknameNew.Text, txtPasswordNew.Text);
            BLL.GestioneUsers.InsertUser(nuovoUser);
            BE.User.UtenteCorrente = nuovoUser;
            Response.Redirect("UserData.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            BE.User.UtenteCorrente = BLL.GestioneUsers.GetUser(txtNickname.Text);
            Response.Redirect("Homepage.aspx");
        }
    }
}