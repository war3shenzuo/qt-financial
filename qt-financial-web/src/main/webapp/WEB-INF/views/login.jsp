<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>清投金服</title>
<meta name="keywords" content="qingtou">
<meta name="description" content="description">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--favicon-->
<link href="${ctx}/common/img/favicon.ico" rel="shortcut icon">

<!--icheck-->
<link href="${ctx}/common/js/iCheck/skins/square/green.css"
	rel="stylesheet">
<link href="${ctx}/common/js/iCheck/skins/flat/green.css"
	rel="stylesheet">

<!--bootstrapValidator-->
<link href="${ctx}/common/css/bootstrapValidator.min.css"
	rel="stylesheet">

<!--common-->
<link rel="stylesheet" type="text/css"
	href="${ctx}/common/css/style.css">
<link rel="stylesheet" type="text/css"
	href="${ctx}/common/css/style-responsive.css">

<link rel="stylesheet" type="text/css"
	href="${ctx}/common/css/admin/login.css">

</head>

<body>

	<div class="ui-login">
		<div class="ui-login-header">
			<div class="ui-login-header-img">
				<img src="${ctx}/common/img/head_120.png" alt="" class="img-circle">
			</div>
		</div>
		<div class="ui-login-form">
			<form class="cmxform form-horizontal" role="form" method="POST"
				id="loginForm" action="${ctx}/data/login">
				<div class="form-group">
					<div class="col-sm-10 col-md-offset-1">
						<input type="text" class="form-control" name="username" id="username"
							placeholder="请输入您的用户名">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-10 col-md-offset-1">
						<input type="password" class="form-control" name="password"
							id="password" placeholder="请输入您的密码">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-10 col-md-offset-1 ">
						<button class="btn btn-warning btn-block" type="submit" >提交</button>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-5 col-md-offset-1 icheck">
						<div class="flat-green single-row">
							<div class="radio " style="padding-left: 0px;">
								<input type="checkbox" name="remember" value="1" checked="checked"> 
								<label>记住我 </label>
							</div>
						</div>
					</div>
					<div class="col-sm-5 text-right" style="line-height: 37px;">
						<a href="${ctx }/qingtou/forget">忘记密码？</a>
					</div>
				</div>
<!-- 				<div class="form-group text-center"> -->
<!-- 					<a href="register">还没账号？注册一下</a> -->
<!-- 				</div> -->

			</form>
		</div>

	</div>
	<canvas id="Mycanvas"></canvas>
	<!-- Placed js at the end of the document so the pages load faster -->
	<script src="${ctx}/common/js/jquery-1.10.2.min.js"></script>
	<script src="${ctx}/common/js/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="${ctx}/common/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="${ctx}/common/js/bootstrap.min.js"></script>
	<script src="${ctx}/common/js/modernizr.min.js"></script>
	<script src="${ctx}/common/js/jquery.nicescroll.js"></script>

	<!--icheck -->
	<script src="${ctx}/common/js/iCheck/jquery.icheck.js"></script>
	<script src="${ctx}/common/js/icheck-init.js"></script>

	<!--bootstrapvalidate script 表单验证-->
	<script type="text/javascript"
		src="${ctx}/common/js/bootstrapValidator.min.js"></script>

	<!--common scripts for all pages-->
	<script src="${ctx}/common/js/scripts.js"></script>
	<script src="${ctx}/common/js/base.js"></script>
	
	<!-- local cookie -->
	<script src="${ctx}/common/js/localstore.js"></script>

	<!--loginCanvas-->
	<script src="${ctx}/common/js/0_swh/admin/loginCanvas.js"
		type="text/javascript" charset="utf-8"></script>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$("#username").val(getCookie('username'));
							$("#password").val(getCookie('password'));
							// validate form on keyup and submit
							$('#loginForm')
									.bootstrapValidator(
											{
												feedbackIcons : {
													valid : 'fa fa-check',
													invalid : 'fa fa-times',
													validating : 'fa fa-times'
												},
												submitHandler: function(validator, form, submitButton) {
												    // Use Ajax to submit form data
												    $.post(form.attr('action'), form.serialize(), function(result) {
													    if($('#remember').val()==1){
															delCookie('username');
															delCookie('password');
															setCookie('username', $("#username").val());
															setCookie('password', $("#password").val());
														}
													    if(result.responseCode=='200'){
														     window.location.href='${pageContext.request.contextPath}/view/index';
														    }
													    else{
													    	document.getElementById("info_type").src = "${pageContext.request.contextPath}/common/img/admin/icon_error.jpg";
													    	document.getElementById("info_msg").innerHTML = result.msg;
															$('#myModal_info').modal('show');
													    	 //alert("账号密码错误");
														    }
												    }, 'json');
												},
												message : 'This value is not valid',
												fields : {
													name : {
														validators : {
															notEmpty : {
																message : '用户名不能为空'
															},
															regexp : {/* 只需加此键值对，包含正则表达式，和提示 */
																regexp : '^((13[0-9])|(15[^4,\\D])|(18[0-9]))\\d{8}$',
																message : '必须是移动、联通、电信支持的手机号'
															}
														}
													},
													password : {
														validators : {
															notEmpty : {
																message : '密码不能为空'
															}
														}
													}
												}
											});
						});

</script>
</body>
</html>
