<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>慢病mlnx专用</title>
<meta name="keywords" content="mlnx">
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
				id="registForm" action="registerUser">
				<div class="form-group">
					<div class="col-sm-10 col-md-offset-1">
						<input type="text" class="form-control" name="phone" id="phone"
							placeholder="请输入您的用户名">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-10 col-md-offset-1">
						<input type="password" class="form-control" name="password"
							placeholder="请输入您的密码">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-10 col-md-offset-1">
						<input type="password" class="form-control" name="confirmPassword"
							placeholder="请确认您的密码">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-10 col-md-offset-1">
						<input type="password" class="form-control" name="signPassword"
							placeholder="请输入您的签字密码">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-4 col-md-offset-1">
						<input type="text" class="form-control" name="validation"
							placeholder="请输入验证码">
					</div>
					<div class="col-sm-6">
						<input type="button" class="btn btn-primary btn-block daojishi"
							name="yanzhengma" value="获取手机验证码" onclick="showtime(60)">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-10 col-md-offset-1 ">
						<button class="btn btn-warning btn-block" type="submit"
							id="submit">注册</button>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-5 col-md-offset-1 icheck">
						<div class="flat-green single-row">
							<div class="radio " style="padding-left: 0px;">
								<input type="checkbox" checked> <label>同意用户协议！ </label>
							</div>
						</div>
					</div>
					<div class="col-sm-5 text-right" style="line-height: 37px;">
						<a href="forget">忘记密码？</a>
					</div>
				</div>
				<div class="form-group text-center">
					<a href="login">已有账号？快去登录</a>
				</div>

			</form>
		</div>
	</div>
	<canvas id="Mycanvas"></canvas>
	<!-- Modal-提示框 -->
	<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog"
		tabindex="-1" id="myModal_info" class="modal fade new-modal">
		<div class="modal-dialog"
			style="width: 430px; border: 1px solid #ccc;">
			<div class="modal-content">
				<div class="modal-header new-modal-header">
					<button aria-hidden="true" data-dismiss="modal"
						class="close new-close" type="button">×</button>
					<h4 class="modal-title new-modal-title"></h4>
				</div>
				<div class="modal-body new-modal-body">
					<div>
						<img alt="" src="${ctx}/common/img/admin/icon_success.jpg"
							id="info_type">
					</div>
					<div class="new-modal-body-title" id="info_msg">申请资质成功，等待审核</div>
				</div>
				<div class="modal-footer new-modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						id="myModal_info_button">返回</button>
				</div>
			</div>
		</div>
	</div>
	<!-- modal-提示框 -->
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

	<!-- loginCanvas -->
	>
	<script src="${ctx}/common/js/0_swh/admin/loginCanvas.js"
		type="text/javascript" charset="utf-8"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			RegistFormValidator();
		});
		function RegistFormValidator() {
			$('#registForm').bootstrapValidator({
				feedbackIcons : {
					valid : 'fa fa-check',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				message : 'This value is not valid',
				fields : {
					username : {
						validators : {
							notEmpty : {
								message : '用户名不能为空'
							},
							remote : {
								message : '用户已注册',
								url : 'register/findByPhone'
							}
						}
					},
					password : {
						validators : {
							notEmpty : {
								message : '密码不能为空'
							},
							identical : {
								field : 'confirmPassword',
								message : '2次密码不一致'
							}
						}
					},
					confirmPassword : {
						validators : {
							notEmpty : {
								message : '确认密码不能为空'
							},
							identical : {
								field : 'password',
								message : '2次密码输入不一致，请重新输入'
							}
						}
					},
					signPassword : {
						validators : {
							notEmpty : {
								message : '签名密码不能为空'
							}
						}
					},
					validation : {
						validators : {
							notEmpty : {
								message : '验证码不能为空'
							}
						}
					}
				}
			});
		}
		function showtime(t) {
			var phone = $("#phone").val();//得到手机号码的值 
			phone = phone.replace(/(^\s+)|(\s+$)/g, "");
			if (phone == null || phone == "") {
				console.log("手机号码不能空");
			} else {
				getCode();
				document.registForm.yanzhengma.disabled = true;
				for (i = 1; i <= t; i++) {
					window
							.setTimeout("update_p(" + i + "," + t + ")",
									i * 1000);
				}
			}
		}

		function update_p(num, t) {
			if (num == t) {
				document.registForm.yanzhengma.value = "获取手机验证码";
				document.registForm.yanzhengma.disabled = false;
			} else {
				printnr = t - num;
				document.registForm.yanzhengma.value = " (" + printnr
						+ ")秒后重新发送";
			}
		}

		function getCode() {
			var phone = $("#phone").val();//得到手机号码的值 
			phone = phone.replace(/(^\s+)|(\s+$)/g, "");
			if (phone == null) {
				document.getElementById("info_type").src = "${pageContext.request.contextPath}/common/img/admin/icon_error.jpg";
				document.getElementById("info_msg").innerHTML = "手机号码不能空";
				$('#myModal_info').modal('show');
				//alert("手机号码不能空")
			} else {
				$
						.ajax({
							url : '${pageContext.request.contextPath}/chronic/register/getValidationCode',
							data : 'phone=' + phone,
							type : 'post'
						});
			}
		}
		function judgePhone() {
			var phone = $("#phone").val();//得到手机号码的值 
			phone = phone.replace(/(^\s+)|(\s+$)/g, "");
			if (phone == null) {
				document.getElementById("info_type").src = "${pageContext.request.contextPath}/common/img/admin/icon_error.jpg";
				document.getElementById("info_msg").innerHTML = "手机号码不能空";
				$('#myModal_info').modal('show');
				//alert("手机号码不能空")
			} else {
				$
						.ajax({
							url : '${pageContext.request.contextPath}/chronic/register/judgePhone',
							data : 'phone=' + phone,
							type : 'post',
							success : function(data) {
								if (data == "true") {
									$("#submit").removeAttr("disabled");
									$("#msg").html("");
								} else {
									var html = ' <small class="help-block" style="display: block;">用户已存在</small>';
									$("#msg").html(html);
									$("#submit").attr("disabled", "disabled");
								}
							}
						});
			}
		}
	</script>
</body>
</html>
