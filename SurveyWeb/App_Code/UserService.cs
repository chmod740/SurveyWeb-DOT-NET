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
        
	}


    public static bool doLogin(string username,string password)
    {
        MySqlConnection conn = new MySqlConnection(Config.sqlUrl);
        conn.Open();
        String sql = "select * from user where username=@username and password=@password;";
        MySqlCommand comm = new MySqlCommand(sql, conn);
        comm.Parameters.Add("username", username);
        comm.Parameters.Add("password", password);

        MySqlDataReader sdr = comm.ExecuteReader();
        bool flag = false;
        if (sdr.Read())
        {
            flag = true;
        }
        else
        {
            flag = false;
        }
        sdr.Close();
        comm.Clone();
        conn.Close();
        return flag;
    }

    public static User getUserById(int id) 
    {

        MySqlConnection conn = new MySqlConnection(Config.sqlUrl);
        conn.Open();
        String sql = "select * from user where id=@id";
        MySqlCommand comm = new MySqlCommand(sql, conn);
        comm.Parameters.Add("id", id);

        MySqlDataReader sdr = comm.ExecuteReader();
        bool flag = false;
        User user = null;
        if (sdr.Read())
        {
            user = new User();
            user.id = sdr.GetInt32("id");
            user.username = sdr.GetString("username");
            user.password = sdr.GetString("password");
            user.privilege = sdr.GetInt32("privilege");
        }
        sdr.Close();
        comm.Clone();
        conn.Close();
        return user;
    }

    public static User getUserByUserName(string username)
    {

        MySqlConnection conn = new MySqlConnection(Config.sqlUrl);
        conn.Open();
        String sql = "select * from user where username=@username";
        MySqlCommand comm = new MySqlCommand(sql, conn);
        comm.Parameters.Add("username", username);

        MySqlDataReader sdr = comm.ExecuteReader();
        bool flag = false;
        User user = null;
        if (sdr.Read())
        {
            user = new User();
            user.id = sdr.GetInt32("id");
            user.username = sdr.GetString("username");
            user.password = sdr.GetString("password");
            user.privilege = sdr.GetInt32("privilege");
        }
        sdr.Close();
        comm.Clone();
        conn.Close();
        return user;
    }

    public static bool updateUser(User user)
    {
        MySqlConnection conn = new MySqlConnection(Config.sqlUrl);
        conn.Open();
        String sql = "update user set username=@username,password=@password,privilege=@privilege where id=@id";
        MySqlCommand comm = new MySqlCommand(sql, conn);
        comm.Parameters.Add("id", user.id);
        comm.Parameters.Add("username", user.username);
        comm.Parameters.Add("password", user.password);
        comm.Parameters.Add("privilege", user.privilege);
        comm.ExecuteNonQuery();
        comm.Clone();
        conn.Close();
        return true; 
    }
}