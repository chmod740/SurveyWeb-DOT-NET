<%@ Page Language="C#" AutoEventWireup="true" CodeFile="fromDetail.aspx.cs" Inherits="fromDetail" %>

<!DOCTYPE html> 
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>二维码投票系统</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">

    <!--[if lte IE 8]><link rel="stylesheet" href="css/responsive-nav.css"><![endif]-->
    <!--[if gt IE 8]><!--><link rel="stylesheet" href="css/styles.css"><!--<![endif]-->
    <script src="js/responsive-nav.js"></script>

    <!-- Loading Bootstrap -->
    <script src="dist/js/vendor/jquery.min.js"></script>
    <script type="text/javascript" src="dist/bootstrap/js/bootstrap.min.js"></script>
    <link href="dist/css/vendor/bootstrap.min.css" rel="stylesheet">

    <!-- Loading Flat UI -->
    <link href="dist/css/flat-ui.css" rel="stylesheet">
    <link href="docs/assets/css/demo.css" rel="stylesheet">


    <!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
    <!--[if lt IE 9]>
    <script src="dist/js/vendor/html5shiv.js"></script>
    <script src="dist/js/vendor/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>

    <div role="navigation" id="foo" class="nav-collapse">
      <ul>
        <li><a href="Index.aspx">主页</a></li>
        <li class="active"><a href="manageFrom.aspx">投票管理</a></li>
        <li><a href="AddSurvey.aspx">添加投票</a></li>
        <li><a href="about.aspx">关于系统</a></li>
      </ul>
    </div>


    <div role="main" class="main">
      <a href="#nav" class="nav-toggle">Menu</a>
      

      <ol class="breadcrumb">
        <li><a href="manageFrom.aspx">投票管理</a></li>
        <li class="active">投票结果信息</li>
      </ol>
      
      
      <div class="panel panel-default">
        <div class="panel-heading">
          <h3 class="panel-title"><%=survey.theme%>-投票结果</h3>
        </div>

        <% foreach (Question question in survey.questions){ %>
        <hr>
        <div class="panel-body">
          <%=question.title %>
        </div>
        <% int i = 0; %>
        <%foreach(Option option in question.options){ %>
        <% 
           string style = null;
           if( i % 4 == 0){
               style = "progress-bar-success";
           }
           if (i % 4 == 1)
           {
               style = "progress-bar-info";
           }
           if (i % 4 == 2)
           {
               style = "progress-bar-warning";
           }
           if (i % 4 == 3)
           {
               style = "progress-bar-danger";
           }   
           
           i ++;
        %>

        <div class="progress">
          <div class="progress-bar <%=style %>" role="progressbar" aria-valuenow="<%=(int)(option.click*100.0 / question.click_count)  %>" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
            <%=option.text %><span class="sr-only"><%=(int)(option.click*100.0 / question.click_count)  %>% Complete (success)</span>
          </div>
        </div>
        <%} %>


        <%} %>

        


      </div> 



    </div>

    <script>
        var navigation = responsiveNav("foo", { customToggle: ".nav-toggle" });
    </script>
  </body>
</html>
