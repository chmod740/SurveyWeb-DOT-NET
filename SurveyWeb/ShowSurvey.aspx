<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowSurvey.aspx.cs" Inherits="ShowSurvey" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title><%=survey.theme %></title>
    <meta name="description" content="" />

    <meta name="viewport" content="width=1000, initial-scale=1.0, maximum-scale=1.0">

    <!-- Loading Bootstrap -->
    <link href="dist/css/vendor/bootstrap.min.css" rel="stylesheet">

    <!-- Loading Flat UI -->
    <link href="dist/css/flat-ui.css" rel="stylesheet">
    <link href="docs/assets/css/demo.css" rel="stylesheet">

    <link rel="shortcut icon" href="img/favicon.ico">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
    <!--[if lt IE 9]>
      <script src="dist/js/vendor/html5shiv.js"></script>
      <script src="dist/js/vendor/respond.min.js"></script>
    <![endif]-->
    
    <script src="dist/js/vendor/jquery.min.js"></script>
    <script type="text/javascript">
        function submit() {
            <% int i = 1;%>
            <% foreach (var question in survey.questions)
               {
            %>
            if (document.getElementById('q_<%=question.id%>').value == "0") {
                document.getElementById("msg_div").style.display = "";
                document.getElementById("msg").innerText = "你还没回答第<%=i%>个问题";
                return;
            }
            <%
                i++;
               } %>
            document.getElementById("question").submit();
        }

        function change_flag(id) {
            console.log("q_" + id);
            //alert(document.getElementById("q_" + id).value);
            
            document.getElementById("q_" + id).value = "1";

        }
    </script>
</head>

<body>

    <div style="padding-bottom: 50px;">
        <div align="center">
            <h3><%=survey.theme %></h3>
        </div>
        <ol type="1" class="inner">
            <%if (survey == null)
                { %>
            <h1>您已经参加过此投票或者此投票不存在</h1>
            <%}
                else
                {%>

            <form id="question" method="post" action="SubmitSurvey.aspx">
                <input type="hidden" name="code" value="<%=code %>"/>
                <%foreach (var question in survey.questions)
                    { %>
                <input type="hidden" id="q_<%=question.id %>" value="0"/>
                <li style="margin-bottom: 40px; background: #eeeeee; padding: 20px;">
                    <ol type="A" class="inner">
                        <h5><%=question.title%></h5>
                        <%foreach (var option in question.options)
                            { %>
                        <li>
                            <label class="checkbox">
                                <input onclick="change_flag(<%=question.id%>)" type="radio"  id="<%=question.id %>" name="<%=question.id %>" value="<%=option.id %>" data-toggle="checkbox" class="custom-checkbox">
                                <p><%=option.text%></p>
                            </label>
                        </li>
                        <%} %>
                    </ol>
                </li>
                <%} %>
            </form>
            <%} %>
        </ol>
        <div id="msg_div" style="display: none" class="alert alert-danger" role="alert">
            <span class="sr-only">Error:</span>
            <p id="msg">Enter a valid email address</p>
        </div>
        <div align="center">
            <button class="btn btn-primary btn-lg" style="width: 250px" onclick="submit()">提交</button>
        </div>
    </div>

    <script src="dist/js/vendor/video.js"></script>
    <script src="dist/js/flat-ui.min.js"></script>
    <script src="docs/assets/js/application.js"></script>
    <script src="js/model.js"></script>
    

</body>
</html>
