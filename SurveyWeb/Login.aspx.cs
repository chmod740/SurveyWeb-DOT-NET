using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data;
using MySql.Data.MySqlClient;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    public void login(object sender, EventArgs e)
    {


        if (UserService.doLogin(username.Value,password.Value))
        {


            Session["username"] = username.Value;
            Session["password"] = password.Value;
        }

    }
}