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

    public string msg = "";
    public string admin_email = Config.adminEmail;

    public void login(object sender, EventArgs e)
    {


        if (UserService.doLogin(username.Value,password.Value))
        {
            User user = UserService.getUserByUserName(username.Value);
            Session["username"] = username.Value;
            Session["password"] = password.Value;
            Session["id"] = user.id;
            Session["privilege"] = user.privilege;
            LoginLog login_log = new LoginLog();
            login_log.user_id = user.id;
            login_log.ip = Request.UserHostAddress;
            login_log.time = DateTime.Now;
            LoginLogService.insert(login_log);
            Response.Redirect("Index.aspx");
        }
        else
        {
            msg = "alert('用户名或者密码错误')";
        }
    }
}