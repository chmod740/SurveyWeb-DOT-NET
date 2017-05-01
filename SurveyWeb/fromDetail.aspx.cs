using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class fromDetail : System.Web.UI.Page
{
    public Survey survey = null;


    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["username"] == null)
        {
            Response.Redirect("Login.aspx");
        }

        int id = int.Parse(Request.Params["id"]);
        survey = SurveyService.getSurveyById(id);

    }
}