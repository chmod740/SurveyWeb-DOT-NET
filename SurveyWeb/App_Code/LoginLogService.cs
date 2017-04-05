using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data;
using MySql.Data.MySqlClient;

/// <summary>
///LoginLogService 的摘要说明
/// </summary>
public class LoginLogService
{
	public LoginLogService()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}

    public static bool insert(LoginLog login_log)
    {
        if(login_log == null)
        {
            return false;
        }
        try
        {
            MySqlConnection conn = new MySqlConnection(Config.sqlUrl);
            conn.Open();
            String sql = "insert into login_log (user_id, ip, time) values (@user_id,@ip,@time)";
            MySqlCommand comm = new MySqlCommand(sql, conn);

            comm.Parameters.Add("user_id", login_log.user_id);
            comm.Parameters.Add("ip", login_log.ip);
            comm.Parameters.Add("time", login_log.time);
            comm.ExecuteNonQuery();
            comm.Clone();
            conn.Close();
        }
        catch
        {
            return false;
        }
        return true;
    }

    public static LoginLog getUserLastLoginLog(int user_id){
        LoginLog login_log = null;

        MySqlConnection conn = new MySqlConnection(Config.sqlUrl);
        conn.Open();
        String sql = "select * from login_log where user_id=@user_id order by id desc;";
        MySqlCommand comm = new MySqlCommand(sql, conn);
        comm.Parameters.Add("user_id", user_id);

        MySqlDataReader sdr = comm.ExecuteReader();
        bool flag = false;

        sdr.Read();
        if (sdr.Read())
        {
            login_log = new LoginLog();
            login_log.id = sdr.GetInt32("id");
            login_log.user_id = sdr.GetInt32("user_id");
            login_log.ip = sdr.GetString("ip");
            login_log.time = sdr.GetDateTime("time");
        }
        sdr.Close();
        comm.Clone();
        conn.Close();

        return login_log;
    }
}