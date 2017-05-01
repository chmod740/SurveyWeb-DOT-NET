﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manageFrom.aspx.cs" Inherits="manageFrom" %>

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

      <%foreach (Survey survey in list){ %>

      <div class="row">
        <div class="col-sm-6 col-md-4">
          <div class="thumbnail">
            <!-- <img src="..." alt="..."> -->
            <div class="caption">
              <h3><%=survey.theme %></h3>
              <br>
              <p></p>
              <p>
                <a href="fromDetail.aspx?id=<%=survey.id %>" class="btn btn-primary" role="button">查看结果</a> 
                <a href="DownloadQrCode.aspx?id=<%=survey.id %>" class="btn btn-primary" role="button">下载二维码</a> 
                <a href="#" class="btn btn-default" role="button" data-toggle="modal" data-target="#myModal">删除此项目</a>
              </p>
            </div>
          </div>
        </div>
		<%} %>>
		



    



        <div class="col-sm-6 col-md-4">
          <div class="thumbnail">
            <img src="..." alt="...">
            <div class="caption">
              <h3>Thumbnail label</h3>
              <p>...</p>
              <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
            </div>
          </div>
        </div>

        <div class="col-sm-6 col-md-4">
          <div class="thumbnail">
            <img src="..." alt="...">
            <div class="caption">
              <h3>Thumbnail label</h3>
              <p>...</p>
              <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
            </div>
          </div>
        </div>

        <div class="col-sm-6 col-md-4">
          <div class="thumbnail">
            <img src="..." alt="...">
            <div class="caption">
              <h3>Thumbnail label</h3>
              <p>...</p>
              <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
            </div>
          </div>
        </div>

      </div>


    </div>


	<!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">删除此项目</h4>
          </div>
          <div class="modal-body">
            <p>您确认要删除此投票项目吗？注意！此操作无法撤销！</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            <button type="button" class="btn btn-primary">删除</button>
          </div>
        </div>
      </div>
    </div>



    <script>
        var navigation = responsiveNav("foo", { customToggle: ".nav-toggle" });
    </script>
  </body>
</html>

