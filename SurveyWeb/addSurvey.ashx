<%@ WebHandler Language="C#" Class="addSurvey" %>

using System;
using System.Web;
using System.Text.RegularExpressions;
public class addSurvey : IHttpHandler {

    private int surveyId = 0;
    private int questionId = 0;
    
    public void ProcessRequest (HttpContext context) {

        string keyWord1 = context.Request.Params["keyWord1"];
        keyWord1 = keyWord1.Replace("@#@", "#").Replace("#$#", "$");
        //keyWord1 = solveData(keyWord1);
        Console.WriteLine(keyWord1);
        
        surveyId = saveSurvey(keyWord1.Split('@', '#', '@')[0]);
        for (int i = 2; i < keyWord1.Split('#').Length; i++) {
			Console.WriteLine(keyWord1.Split('#')[i]);
            if (keyWord1.Split('#')[i + 2].Equals(""))
            {
                break;
            }
            questionId = saveQuestion(keyWord1.Split('#')[i + 2], keyWord1.Split('#')[i + 1], int.Parse(keyWord1.Split('#')[i]));
			i = i + 3;
            while (i < keyWord1.Split('#').Length && !keyWord1.Split('#')[i].Equals("$"))
            {
                saveOption(keyWord1.Split('#')[i]);
                Console.WriteLine(keyWord1.Split('#')[i]);
				i++;
			}
		}
        context.Response.ContentType = "text/plain";
        context.Response.Write("Hello World");
        
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }
    
    private int saveSurvey(string title){
        return SurveyService.addSurvey(title);
    }

    private int saveQuestion(String title, String type, int num)
    {
        return SurveyService.addQuestion(surveyId,title,type,num);
    }
    
    private int saveOption(string title){
        return SurveyService.addOption(questionId,title);
    }
    
    private string solveData(string data) {

        Regex reg = new Regex("#$#^[1-9]\\d*$#f######\\$#");
        string resultString = "";
        Match match = reg.Match(data);
        while(reg.IsMatch(data)){
            resultString = match.ToString();
            break;
        }
        if(resultString.Length == 0){
            return data;
        }
        return data.Replace(resultString, "");
    }
}