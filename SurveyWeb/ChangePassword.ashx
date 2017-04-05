<%@ WebHandler Language="C#" Class="ChangePassword" %>

using System;
using System.Web;

public class ChangePassword : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        ///context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");    
        string username = (string)context.Session["username"];
        if(username == null){
            context.Response.Redirect("Login.aspx");
            return;
        }
        string oldPass = context.Request["old_pass"];
        string newPass = context.Request["new_pass"];
        bool result = UserService.doLogin(username, oldPass);
        string s = null;
        if (result)
        {
            User user = UserService.getUserByUserName(username);
            user.password = newPass;
            UserService.updateUser(user);
            s = getResult(0, "密码修改成功");
        }
        else {
            s = getResult(0, "密码修改失败");
        }
        context.Response.Write(s);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }
    
    private string getResult(int code, string msg) 
    {
        string json = "";
        json = "{\"code\":" + code + ",\"msg\":\""+ msg + "\"}";
        return json;
    }
}