<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SubmitSurvey.aspx.cs" Inherits="SubmitSurvey" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>投票结果</title>
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
       
    </script>
</head>

<body>

    <div style="padding-bottom: 50px;">
        <div align="center">

        </div>
        <ol type="1" class="inner">
            <%if (survey == null)
                { %>
            <h1>您已经参加过此投票或者此投票不存在</h1>
            <%}
                else
                {%>

           <h1>感谢您的参与</h1>
            <%} %>
        </ol>
        
    </div>

    <script src="dist/js/vendor/video.js"></script>
    <script src="dist/js/flat-ui.min.js"></script>
    <script src="docs/assets/js/application.js"></script>
    <script src="js/model.js"></script>
    

</body>
</html>
