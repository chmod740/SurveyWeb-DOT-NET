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


        if (username.Value.Equals("admin") || password.Value.Equals("123"))
        {
            Response.Redirect("http://www.baidu.com");
        }
    }

    private void doLogin(string username , string password) 
    {
        MySqlConnection conn = new MySqlConnection(Config.sqlUrl);
        conn.Open();
        String sql = "select * from user where username=@username and password=@password;";
        MySqlCommand comm = new MySqlCommand(sql, conn);
        comm.Parameters.Add("username", username);
        comm.Parameters.Add("password", password);

        MySqlDataReader sdr = comm.ExecuteReader();
        if (sdr.Read())
        {
            Session["us"]
        }
        else 
        {
 
        }
        conn.Close();
    }
}