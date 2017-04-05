<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<title>乌拉特前旗干部考核系统</title>
		<meta name="viewport" content="width=device-width,initial-scale=1">
		<!--[if lte IE 8]><link rel="stylesheet" href="voteSystem/css/responsive-nav.css"><![endif]-->
		<!--[if gt IE 8]><!-->
		<link rel="stylesheet" href="voteSystem/css/styles.css">
		<!--<![endif]-->

		<script src="voteSystem/dist/js/vendor/jquery.min.js"></script>
		<script type="text/javascript" src="voteSystem/dist/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="voteSystem/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
		<script type="text/javascript" src="voteSystem/js/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>

		<script src="voteSystem/js/responsive-nav.js"></script>
		<!-- Loading Bootstrap -->
		<link href="voteSystem/dist/css/vendor/bootstrap.min.css" rel="stylesheet">
		
		<!-- Loading Flat UI -->
		<link href="voteSystem/dist/css/flat-ui.css" rel="stylesheet">
		<link href="voteSystem/docs/assets/css/demo.css" rel="stylesheet">
		<link href="voteSystem/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">

		<!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
		<!--[if lt IE 9]> 
    <script src="voteSystem/dist/js/vendor/html5shiv.js"></script>
    <script src="voteSystem/dist/js/vendor/respond.min.js"></script>
    <![endif]-->
	</head>

	<body>

		<div role="navigation" id="foo" class="nav-collapse">
			<ul>
				<li><a href="root_User.action">主页</a></li>
				<li><a href="#">考核管理</a></li>
				<li class="active"><a href="#">添加考核</a></li>
				<li><a href="#">Blog</a></li>
			</ul>
		</div>

		<div role="main" class="main">
			<a href="#nav" class="nav-toggle">Menu</a>
			<div>

				<hr>
				<div class="row demo-row">
					<div class="col-xs-12">
						<a>考核名称：</a>
					</div>
					<div class="col-xs-12">
						<input type="text" id="questionnaireName" class="form-control input-lg">
					</div>
				</div>
				<!-- /row -->
				<div class="form-group">
					<a>起止时间</a>
					<br>
					<div class="input-group date form_datetime col-md-6" data-date="2015-01-16T05:25:07Z" data-date-format="yyyy年mm月dd日- HH:ii p" data-link-field="dtp_input1"  style="float: left">
						<input class="form-control" size="16" type="text" value="" readonly>
						<span class="input-group-addon"><span class="fui-calendar glyphicon-th"></span></span>
					</div>
					<div class="input-group date form_datetime col-md-6" data-date="2015-01-16T05:25:07Z" data-date-format="dd MM yyyy - HH:ii p" data-link-field="dtp_input1" style="float: left">
						<input class="form-control" size="16" type="text" value="" readonly>
						<span class="input-group-addon"><span class="fui-calendar glyphicon-th"></span></span>
					</div>
				</div>
				<br>
				<br>

				<hr>
				<ol type="1" id="p">

					<li style="margin-bottom: 40px;background:#eeeeee; padding: 20px; padding-left: 50px;" class="child">
						<ol type="A" class="inner">
							<input type="text" value="f" style="display: none;">
							<input type="text" class="form-control input-lg" style="display:inline;">
							<li>
								<label class="radio">
									<input type="radio" name="optionsRadios0" value="option1" data-toggle="radio" checked="checked" class="custom-radio">
									<span class="icons"><span class="icon-unchecked"></span><span class="icon-checked"></span></span>
									<input type="text" class="form-control input-sm" style="display:inline;">
								</label>
							</li>

							<li>
								<label class="radio">
									<input type="radio" name="optionsRadios0" value="option1" data-toggle="radio" class="custom-radio">
									<span class="icons"><span class="icon-unchecked"></span><span class="icon-checked"></span></span>
									<input type="text" class="form-control input-sm" style="display:inline;">
								</label>
							</li>
							<li>
								<label class="radio">
									<input type="radio" name="optionsRadios0" value="option1" data-toggle="radio" class="custom-radio">
									<span class="icons"><span class="icon-unchecked"></span><span class="icon-checked"></span></span>
									<input type="text" class="form-control input-sm" style="display:inline;">
								</label>
							</li>
							<li>
								<label class="radio">
									<input type="radio" name="optionsRadios0" value="option1" data-toggle="radio" class="custom-radio">
									<span class="icons"><span class="icon-unchecked"></span><span class="icon-checked"></span></span>
									<input type="text" class="form-control input-sm" style="display:inline;">
								</label>
							</li>
						</ol>
						<a class="btn btn-primary add">
							<span class="fui-plus" style="width: 5px; height: 5px;"></span>
						</a>
						<a class="btn btn-danger del">
							<span class="fui-cross" style="width: 5px; height: 5px;"></span>
						</a>
					</li>
				</ol>

				<div class="row demo-row">
					<div class="col-xs-3">
						<a href="#fakelink" id="button1" class="btn btn-block btn-lg btn-warning">单选题</a>
					</div>
					<div class="col-xs-3">
						<a href="#fakelink" id="button2" class="btn btn-block btn-lg btn-warning">问答题</a>
					</div>
					<div class="col-xs-3">
						<a href="#fakelink" id="button3" class="btn btn-block btn-lg btn-primary">提交</a>
					</div>
					<div class="col-xs-3">
						<a href="#fakelink" id="button4" class="btn btn-block btn-lg btn-danger">删除</a>
					</div>
				</div>
				<!-- /row -->

				<div style="display: none;">
					<form method="get" action="http://183.175.14.98:8080/Survey/test.action" name="keyWord" id="keyWord">
						<input type="text" name="keyWord1" id="keyWord1"></input>
						<input type="text" name="keyWord2" id="keyWord2"></input>
					</form>
				</div>

				<div class="moban" style="display: none;">
					<li style="margin-bottom: 40px; background:#eeeeee; padding: 20px; padding-left: 50px;" class="child">
						<ol type="A" class="inner">
							<input type="text" value="f" style="display: none;">
							<input type="text" class="form-control input-lg" style="display:inline;">
							<li>
								<label class="radio">
									<input type="radio" name="optionsRadios" value="option1" data-toggle="radio" checked="checked" class="custom-radio">
									<span class="icons"><span class="icon-unchecked"></span><span class="icon-checked"></span></span>
									<input type="text" class="form-control input-sm" style="display:inline;">
								</label>
							</li>

							<li>
								<label class="radio">
									<input type="radio" name="optionsRadios" value="option1" data-toggle="radio" class="custom-radio">
									<span class="icons"><span class="icon-unchecked"></span><span class="icon-checked"></span></span>
									<input type="text" class="form-control input-sm" style="display:inline;">
								</label>
							</li>
							<li>
								<label class="radio">
									<input type="radio" name="optionsRadios" value="option1" data-toggle="radio" class="custom-radio">
									<span class="icons"><span class="icon-unchecked"></span><span class="icon-checked"></span></span>
									<input type="text" class="form-control input-sm" style="display:inline;">
								</label>
							</li>
							<li>
								<label class="radio">
									<input type="radio" name="optionsRadios" value="option1" data-toggle="radio" class="custom-radio">
									<span class="icons"><span class="icon-unchecked"></span><span class="icon-checked"></span></span>
									<input type="text" class="form-control input-sm" style="display:inline;">
								</label>
							</li>
						</ol>
						<a class="btn btn-primary add">
							<span class="fui-plus" style="width: 5px; height: 5px;"></span>
						</a>
						<a class="btn btn-danger del">
							<span class="fui-cross" style="width: 5px; height: 5px;"></span>
						</a>
					</li>
				</div>

				<div class="completion" style="display:none">
					<li style="margin-bottom: 40px;background:#eeeeee; padding: 20px; padding-left: 50px;" class="child">
						<input type="text" class="form-control input-lg" style="display:inline;">
					</li>

				</div>

				<script src="voteSystem/dist/js/flat-ui.min.js"></script>
				<script src="voteSystem/docs/assets/js/application.js"></script>
				<script src="voteSystem/js/model.js"></script>
			</div>

			<script>
				var navigation = responsiveNav("foo", {customToggle: ".nav-toggle"});
				      $('.form_datetime').datetimepicker({
				        //language:  'fr', 
				        weekStart: 1,
				        todayBtn:  1,
								autoclose: 1,
								todayHighlight: 1,
								startView: 2,
								forceParse: 0,
				        showMeridian: 1
				    	});
			</script>
	</body>

</html>