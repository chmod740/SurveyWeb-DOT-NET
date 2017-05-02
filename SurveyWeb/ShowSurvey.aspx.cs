using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShowSurvey : System.Web.UI.Page
{
    public Survey survey;

    protected void Page_Load(object sender, EventArgs e)
    {
        String key = Request.Params["key"];
        survey = SurveyService.getSurveyByKey(key);
    }
}