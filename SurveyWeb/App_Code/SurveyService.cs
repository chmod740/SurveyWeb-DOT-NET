using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data;
using MySql.Data.MySqlClient;

/// <summary>
///SurveyService 的摘要说明
/// </summary>
public class SurveyService
{
	public SurveyService()
	{
        
	}

    public static int addSurvey(string survey)
    {

        try
        {
            MySqlConnection conn = new MySqlConnection(Config.sqlUrl);
            conn.Open();
            String sql = "insert into survey (theme) values (@theme)";
            MySqlCommand comm = new MySqlCommand(sql, conn);

            comm.Parameters.Add("theme", survey);
            comm.ExecuteNonQuery();

            sql = "select * from survey order by id desc";
            comm = new MySqlCommand(sql, conn);

            MySqlDataReader sdr = comm.ExecuteReader();
            if (sdr.Read())
            {
                return sdr.GetInt32("id");
            }
            sdr.Close();
            comm.Clone();
            conn.Close();
        }
        catch
        {
            
        }

        return 0;
    }

    public static int addQuestion(int surveyId,String title, String type, int num)
    {
        try
        {
            MySqlConnection conn = new MySqlConnection(Config.sqlUrl);
            conn.Open();
            String sql = "insert into question (survey_id,title,type,num) values (@survey_id,@title,@type,@num)";
            MySqlCommand comm = new MySqlCommand(sql, conn);

            comm.Parameters.Add("survey_id", surveyId);
            comm.Parameters.Add("title", title);
            if(type.Equals("f")){
                comm.Parameters.Add("type", 1);
            }else{
                comm.Parameters.Add("type", 0);
            }
            comm.Parameters.Add("num", num);
            comm.ExecuteNonQuery();

            sql = "select * from question order by id desc";
            comm = new MySqlCommand(sql, conn);

            MySqlDataReader sdr = comm.ExecuteReader();
            if (sdr.Read())
            {
                return sdr.GetInt32("id");
            }
            sdr.Close();
            comm.Clone();
            conn.Close();
        }
        catch
        {

        }

        return 0;
    }

    public static int addOption(int question_id,string text){
        try
        {
            MySqlConnection conn = new MySqlConnection(Config.sqlUrl);
            conn.Open();
            String sql = "insert into opt (question_id,text,click) values (@question_id,@text,0)";
            MySqlCommand comm = new MySqlCommand(sql, conn);

            comm.Parameters.Add("question_id", question_id);
            comm.Parameters.Add("text", text);


            comm.ExecuteNonQuery();
            
            sql = "select * from opt order by id desc";
            comm = new MySqlCommand(sql, conn);

            MySqlDataReader sdr = comm.ExecuteReader();
            if (sdr.Read())
            {
                return sdr.GetInt32("id");
            }
            sdr.Close();
            comm.Clone();
            conn.Close();
        }
        catch
        {

        }
        return 0;
    }


    public static Option getOptionById(int id)
    {
        try
        {
            Option option = new Option();
            MySqlConnection conn = new MySqlConnection(Config.sqlUrl);
            conn.Open();
            String sql = "select * from opt where id=@id";
            MySqlCommand comm = new MySqlCommand(sql, conn);
            comm.Parameters.Add("id", id);

            MySqlDataReader sdr = comm.ExecuteReader();
            
            if (sdr.Read())
            {

                option.id = sdr.GetInt32("id");
                option.question_id = sdr.GetInt32("question_id");
                option.text = sdr.GetString("text");
                option.click = sdr.GetInt32("click");
            }
            else
            {
                return null;
            }
            sdr.Close();
            comm.Clone();
            conn.Close();
            return option;

        }catch(Exception e){
            return null;
        }
    }

    public static List<Option> getOptionByQuestionId(int question_id)
    {
        try
        {
            List<Option> list = new List<Option>();
           
            MySqlConnection conn = new MySqlConnection(Config.sqlUrl);
            conn.Open();
            String sql = "select * from opt where question_id=@question_id";
            MySqlCommand comm = new MySqlCommand(sql, conn);
            comm.Parameters.Add("question_id", question_id);

            MySqlDataReader sdr = comm.ExecuteReader();

            while (sdr.Read())
            {
                Option option = new Option();
                option.id = sdr.GetInt32("id");
                option.question_id = sdr.GetInt32("question_id");
                option.text = sdr.GetString("text");
                option.click = sdr.GetInt32("click");
                list.Add(option);
            }
            
            sdr.Close();
            comm.Clone();
            conn.Close();
            return list;

        }
        catch (Exception e)
        {
            return null;
        }
    }

    public static Question getQuestionById(int id)
    {
        try
        {
            Question question = new Question();
            MySqlConnection conn = new MySqlConnection(Config.sqlUrl);
            conn.Open();
            String sql = "select * from question where id=@id";
            MySqlCommand comm = new MySqlCommand(sql, conn);
            comm.Parameters.Add("id", id);

            MySqlDataReader sdr = comm.ExecuteReader();

            if (sdr.Read())
            {

                question.id = sdr.GetInt32("id");
                question.survey_id = sdr.GetInt32("survey_id");
                question.title = sdr.GetString("title");
                question.type = sdr.GetInt32("type");
                question.num = sdr.GetInt32("num");
                question.options = getOptionByQuestionId(question.id);
                int clickCount = 0;
                foreach (Option option in question.options)
                {
                    clickCount += option.click;
                }
                if (clickCount == 0)
                {
                    clickCount = 1;
                }
                question.click_count = clickCount;
            }
            else
            {
                return null;
            }
            sdr.Close();
            comm.Clone();
            conn.Close();
            return question;

        }
        catch (Exception e)
        {
            return null;
        }
    }

    public static List<Question> getQuestionBySurveyId(int survey_id)
    {
        try
        {
            List<Question> list = new List<Question>();
            MySqlConnection conn = new MySqlConnection(Config.sqlUrl);
            conn.Open();
            String sql = "select * from question where survey_id=@id";
            MySqlCommand comm = new MySqlCommand(sql, conn);
            comm.Parameters.Add("id", survey_id);

            MySqlDataReader sdr = comm.ExecuteReader();

            while (sdr.Read())
            {
                Question question = new Question();
                question.id = sdr.GetInt32("id");
                question.survey_id = sdr.GetInt32("survey_id");
                question.title = sdr.GetString("title");
                question.type = sdr.GetInt32("type");
                question.num = sdr.GetInt32("num");
                question.options = getOptionByQuestionId(question.id);
                int clickCount = 0;
                foreach(Option option in question.options){
                    clickCount += option.click;
                }
                if(clickCount == 0){
                    clickCount = 1;
                }
                question.click_count = clickCount;
                list.Add(question);
            }

            sdr.Close();
            comm.Clone();
            conn.Close();
            return list;

        }
        catch (Exception e)
        {
            return null;
        }
    }

    public static Survey getSurveyById(int id)
    {
        try
        {
            Survey survey = new Survey();
            MySqlConnection conn = new MySqlConnection(Config.sqlUrl);
            conn.Open();
            String sql = "select * from survey where id=@id";
            MySqlCommand comm = new MySqlCommand(sql, conn);
            comm.Parameters.Add("id", id);

            MySqlDataReader sdr = comm.ExecuteReader();

            if (sdr.Read())
            {

                survey.id = sdr.GetInt32("id");
                survey.theme = sdr.GetString("theme");
                survey.questions = getQuestionBySurveyId(survey.id);
            }
            else
            {
                return null;
            }
            sdr.Close();
            comm.Clone();
            conn.Close();
            return survey;

        }
        catch (Exception e)
        {
            return null;
        }
    }


    public static Survey getSurveyByKey(string key)
    {
        try
        {
  
            MySqlConnection conn = new MySqlConnection(Config.sqlUrl);
            conn.Open();
            String sql = "select * from array where code=@key and status = 1";
            MySqlCommand comm = new MySqlCommand(sql, conn);
            comm.Parameters.Add("key", key);

            MySqlDataReader sdr = comm.ExecuteReader();

            if (sdr.Read())
            {

                int id = sdr.GetInt32("survey_id");
                
                return getSurveyById(id);
            }
            else
            {
                return null;
            }
            sdr.Close();
            comm.Clone();
            conn.Close();


        }
        catch (Exception e)
        {
            return null;
        }
    }


    public static List<Survey> getAllSurvey()
    {
        try
        {
            List<Survey> list = new List<Survey>();
            MySqlConnection conn = new MySqlConnection(Config.sqlUrl);
            conn.Open();
            String sql = "select * from survey";
            MySqlCommand comm = new MySqlCommand(sql, conn);
            MySqlDataReader sdr = comm.ExecuteReader();
            while (sdr.Read())
            {
                Survey survey = new Survey();
                survey.id = sdr.GetInt32("id");
                survey.theme = sdr.GetString("theme");
                survey.questions = getQuestionBySurveyId(survey.id);
                list.Add(survey);
            }
           
            sdr.Close();
            comm.Clone();
            conn.Close();
            return list;

        }
        catch (Exception e)
        {
            return null;
        }
    }


    public static void addSurveyArray(int survey_id,string key){
        try
        {
            MySqlConnection conn = new MySqlConnection(Config.sqlUrl);
            conn.Open();
            String sql = "insert into array (survey_id,code,status) values (@survey_id,@code,@status)";
            MySqlCommand comm = new MySqlCommand(sql, conn);

            comm.Parameters.Add("survey_id", survey_id);
            comm.Parameters.Add("code", key);
            comm.Parameters.Add("status", 1);
            comm.ExecuteNonQuery();
            
            comm.Clone();
            conn.Close();
        }
        catch(Exception e)
        {
            Console.WriteLine(e.Message);
        }
    }

    public static string GetRandomString(int length, bool useNum, bool useLow, bool useUpp, bool useSpe, string custom)
    {
        byte[] b = new byte[4];
        new System.Security.Cryptography.RNGCryptoServiceProvider().GetBytes(b);
        Random r = new Random(BitConverter.ToInt32(b, 0));
        string s = null, str = custom;
        if (useNum == true) { str += "0123456789"; }
        if (useLow == true) { str += "abcdefghijklmnopqrstuvwxyz"; }
        if (useUpp == true) { str += "ABCDEFGHIJKLMNOPQRSTUVWXYZ"; }
        if (useSpe == true) { str += "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"; }
        for (int i = 0; i < length; i++)
        {
            s += str.Substring(r.Next(0, str.Length - 1), 1);
        }
        return s;
    } 
}