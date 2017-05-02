﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowSurvey.aspx.cs" Inherits="ShowSurvey" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>${survey.theme }</title>
    <meta name="description" content=""/>

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
  </head>
  <script src="js/jquery.min.js"></script>
  <script type="text/javascript">
      function submit() {
          window.document.forms[question].submit();
      }
  </script>
  <body>
   <h3>${survey.theme }</h3>
    <ol type="1" class="inner">
    <form id="question" method="post" action="submitSurvey.action">
  	<%for(int i=0;i<list.size();i++){ %>
  		<%ShowModel showModel = list.get(i); %>
	
      <li style="margin-bottom: 40px; background:#eeeeee; padding: 20px;">
          <ol type="A" class="inner">
            <h5><%=showModel.getQuestion().getTitle() %></h5>
            <%for(int j=0;j<showModel.getOptList().size();j++){ %>
            <li>
              <label class="checkbox">
                <input type="checkbox" name="id" value="<%=showModel.getOptList().get(j).getOptionId() %>" data-toggle="checkbox" class="custom-checkbox">
                <p><%=showModel.getOptList().get(j).getText() %></p>
              </label>
            </li>
            <%} %>
          </ol>
        </li>
    
	<%} %>
	</form>
      </ol>
    <button onclick="$('#question').submit()">提交</button>
    <script src="dist/js/vendor/video.js"></script>
    <script src="dist/js/flat-ui.min.js"></script>
    <script src="docs/assets/js/application.js"></script>
    <script src="js/model.js"></script>
  </body>
</html>