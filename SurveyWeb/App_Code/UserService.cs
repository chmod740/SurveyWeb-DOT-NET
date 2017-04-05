using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data;
using MySql.Data.MySqlClient;
/// <summary>
///UserService 的摘要说明
/// </summary>
public class UserService
{
	public UserService()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}


    public bool login(string username,string password)
    { 
        MySqlConnection conn = new MySqlConnection(Config.sqlUrl);
        conn.Open();
        string sql = "select * from user where username=@username and password=@password;";
        MySqlCommand comm = new MySqlCommand(sql, conn);
        comm.Parameters.Add("username", username);
        comm.Parameters.Add("password", password);

        MySqlDataReader sdr = comm.ExecuteReader();
        conn.Close();
        return false;
    }
}