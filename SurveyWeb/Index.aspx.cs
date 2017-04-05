using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Index : System.Web.UI.Page
{
    public string username;
    public string login_time;
    public string ip;
    public string privilege_str;

    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["username"] == null)
        {
            Response.Redirect("Login.aspx");
        }

        username = (string)Session["username"];
        LoginLog login_log = LoginLogService.getUserLastLoginLog((int)Session["id"]);

        if(intSession[])

        if (login_log != null)
        {
            login_time = get_format_time(login_log.time);
            ip = login_log.ip;
        }
        else
        {
            login_time = "无记录";
            ip = "无记录";
        }
    }

    private string get_format_time(DateTime time)
    {
        return time.ToString("yyyy-MM-dd HH:mm:ss");
    }
}