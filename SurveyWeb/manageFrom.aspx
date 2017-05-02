<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manageFrom.aspx.cs" Inherits="manageFrom" %>

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
    <script src="../dist/js/vendor/html5shiv.js"></script>
    <script src="../dist/js/vendor/respond.min.js"></script>
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
      <br><br>
      <div class="row">
      <%foreach (Survey survey in list){ %>

      
        <div class="col-sm-6 col-md-6">

          <div class="thumbnail">
            <!-- <img src="..." alt="..."> -->
            <div class="caption">
              <h3><%=survey.theme %></h3>

              <p></p>
              <p>
                <a href="fromDetail.aspx?id=<%=survey.id %>" class="btn btn-primary" role="button">查看结果</a> 
                <a href="#" class="btn btn-primary" role="button" data-toggle="modal" data-target="#Modal_<%=survey.id %>">生成二维码</a> 
                <a href="#" class="btn btn-default" role="button" data-toggle="modal" data-target="#myModal_<%=survey.id %>">删除此项目</a>
              </p>
            </div>
          </div>

        </div>
		<%} %>
		



    



        
        

      </div>


    </div>


	<!-- Modal -->
    <%foreach (Survey survey in list){ %>
    <div class="modal fade" id="myModal_<%=survey.id %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">删除此项目</h4>
          </div>
          <div class="modal-body">
            <p>您确认要删除“<%=survey.theme %>”投票项目吗？注意！此操作无法撤销！</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="window.location.href='DeleteSurvey.ashx?id=<%=survey.id %>'">删除</button>
          </div>
        </div>
      </div>
    </div>


    <div class="modal fade" id="Modal_<%=survey.id %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">生成二维码</h4>
          </div>
          <div class="modal-body">
            <p>请输入您要生成的二维码的数量！</p>
            <input  id="input_<%=survey.id %>"/>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="gen_code(<%=survey.id %>,<%=survey.id %>)">生成</button>
          </div>
        </div>
      </div>
    </div>
    <%} %>


    <script>
        var navigation = responsiveNav("foo", { customToggle: ".nav-toggle" });

        function gen_code(input_id, id) {
            var count = document.getElementById("input_" + input_id).value;
            window.location.href = "DownloadQrCode.ashx?id=" + id + "&count=" + count + "";

        }
    </script>
  </body>
</html>

