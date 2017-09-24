<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>清投金服</a></li>
	<li class="active">借款审核</li>
</ul>
<input type="hidden" value="${param.borrowType}" id="borrowType">
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">等待初审 </header>
			<div class="panel-body">
				<div class="examine-content" id="borrowContent"></div>
			</div>
		</section>
	</div>
</div>

<div id="auth_phone"></div>
<div id="auth_base"></div>
<div id="auth_id"></div>
<div id="auth_wx"></div>
<div id="auth_contact"></div>
<div id="borrow_list"></div>
<div aria-hidden="false" aria-labelledby="authIdLabel" role="dialog"
	tabindex="-1" id="apply_again" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button aria-hidden="true" data-dismiss="modal" class="close"
					type="button">×</button>
				<h4 class="modal-title">重新审核</h4>
			</div>
			<div class="modal-body">
				<form class="cmxform form-horizontal adminex-form" role="form"
					method="POST" id="applyForm" action="">
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">设置审核结果：</label>
						<div class="col-sm-6">
							<select id="examine_result" name="examine_result">
								<option value="">信息审核</option>
								<option value="">信息通过</option>
								<option value="">信息驳回</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">审核意见：</label>
						<div class="col-sm-6">
							<textarea name="content" class="form-control" rows="6"></textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="col-lg-offset-3 col-lg-10">
							<button class="btn btn-default" data-dismiss="modal"
								style="padding: 6px 50px;">取消</button>
							<button class="btn btn-primary" type="submit"
								style="padding: 6px 50px;">提交</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script src="${ctx}/common/js/index_info.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						scrollTo(0, 0);
						LoadAjaxContent(
								"${pageContext.request.contextPath}/view/modal/auth_phone",
								"auth_phone");
						LoadAjaxContent(
								"${pageContext.request.contextPath}/view/modal/auth_base",
								"auth_base");
						LoadAjaxContent(
								"${pageContext.request.contextPath}/view/modal/auth_id",
								"auth_id");
						LoadAjaxContent(
								"${pageContext.request.contextPath}/view/modal/auth_wx",
								"auth_wx");
						LoadAjaxContent(
								"${pageContext.request.contextPath}/view/modal/auth_contact",
								"auth_contact");
						LoadAjaxContent(
								"${pageContext.request.contextPath}/view/modal/borrow_list",
								"borrow_list");
						LoadAjaxData(
								"${pageContext.request.contextPath}/data/all?borrowType=1r",
								loadBorrowList);
						Select2Test();
					});

	function loadBorrowList(data) {
		try {
			console.log(data);
			var list = data.objList;
			var htmlStr = "";
			for (var i = 0; i < list.length; i++) {
				htmlStr += '<div class="examine-box">'
						+ '<div class="row">'
						+ '<div class="col-sm-2">'
						+ '<img alt="" src="${ctx}/common/img/no_pic200.png" onerror="this.src=\'${ctx }/common/img/no_pic200.png\'" '
						+ 'style="width: 100%; height: auto; max-height: 150px; min-width: 70px;  border-radius: 50%; border: 1px solid #eee;">'
						+ '</div>' + '<div class="col-sm-8">'
						+ '<div class="row examine-news">'
						+ '	<span>ID:</span><span>'
						+ list[i].id
						+ '</span>'
						+ '<span>'
						+ list[i].user.truename
						+ '</span>'
						+ '<span>电话：</span><span>'
						+ list[i].user.usermobile
						+ '</span>'
						+ '	<span>普通客户</span><span>|</span><a href="#" onclick="showBorrowList()">查看借款记录</a>'
						+ '</div>'
						+ '<div class="row examine-news">'
						+ '	<span>申请借款：</span><span class="loan-amount">'
						+ list[i].amount
						+ '元</span><span>申请时间：</span><span>'
						+ formatBorrowDatetime(list[i].applyAt)
						+ '</span>'
						+ '</div>'
						+ '</div>'
						+ '<div class="col-sm-3">'
						+ '</div>'
						+ '</div>'
						+ '<div class="row" style="margin-top: 15px;">'
						+ '<div class="col-sm-2 text-left" style="line-height: 34px;">必要认证：</div>'
						+ '<div class="col-sm-10">' + '<div class="row">';
				var auths = list[i].auths;
				var phoneHtml = '	<button type="button" class="btn btn-default btn-disabled" disabled>手机认证</button>';
				var baseHtml = '	<button type="button" class="btn btn-default btn-disabled" disabled>个人信息</button>';
				var idHtml = '	<button type="button" class="btn btn-default btn-disabled" disabled>身份证认证</button>';
				var bankHtml = '	<button type="button" class="btn btn-default btn-disabled" disabled>银行卡认证</button>';
				var wxHtml = '	<button type="button" class="btn btn-default btn-disabled" disabled>微信认证</button>';
				var contactHtml = '	<button type="button" class="btn btn-default btn-disabled" disabled>通讯录授权</button>';
				var askHtml = '	<button type="button" class="btn btn-default btn-disabled" disabled>问卷认证</button>';
				var taobaoHtml = '	<button type="button" class="btn btn-default btn-disabled" disabled>淘宝认证</button>';
				var xuexinkHtml = '	<button type="button" class="btn btn-default btn-disabled" disabled>学信认证</button>';
				var jingdongHtml = '	<button type="button" class="btn btn-default btn-disabled" disabled>京东认证</button>';
				for (var j = 0; j < auths.length; j++) {
					switch (auths[j].authType) {
					case '1':
						if (auths[j].authStatus == 1) {
							phoneHtml = '<button type="button" class="btn btn-default btn-success"'
									+ '		onclick="showAuthPhone(\''
									+ auths[j].authenticationId
									+ '\')">手机认证</button>';
						}
						break;
					case '2':
						if (auths[j].authStatus == 1) {
							baseHtml = '<button type="button" class="btn btn-default btn-success"'
									+ '		onclick="showAuthBase(\''
									+ auths[j].authenticationId
									+ '\')">个人信息</button>';
						}
						break;
					case '3':
						if (auths[j].authStatus == 1) {
							idHtml = '<button type="button" class="btn btn-default btn-success"'
									+ '		onclick="showAuthId(\''
									+ auths[j].authenticationId
									+ '\')">身份证认证</button>';
						}
						break;
					case '4':
						if (auths[j].authStatus == 1) {
							bankHtml = '<button type="button" class="btn btn-default btn-success"'
									+ '		onclick="showAuthPhone(\''
									+ auths[j].authenticationId
									+ '\')">手机认证</button>';
						}
						break;
					case '5':
						if (auths[j].authStatus == 1) {
							wxHtml = '<button type="button" class="btn btn-default btn-success"'
									+ '		onclick="showAuthPhone(\''
									+ auths[j].authenticationId
									+ '\')">微信认证</button>';
						}
						break;
					case '6':
						if (auths[j].authStatus == 1) {
							contactHtml = '	<button type="button" class="btn btn-default btn-success"'
									+ '		onclick="showAuthPhone(\''
									+ auths[j].authenticationId
									+ '\')">授权通讯录</button>';
						}
						break;
					case '7':
						if (auths[j].authStatus == 1) {
							askHtml = '	<button type="button" class="btn btn-default btn-success"'
									+ '		onclick="showAuthPhone(\''
									+ auths[j].authenticationId
									+ '\')">问卷认证</button>';
						}
						break;
					case '8':
						if (auths[j].authStatus == 1) {
							taobaoHtml = '	<button type="button" class="btn btn-default btn-success"'
									+ '		onclick="showAuthPhone(\''
									+ auths[j].authenticationId
									+ '\')">淘宝认证</button>';
						}
						break;
					case '9':
						if (auths[j].authStatus == 1) {
							xuexinkHtml = '	<button type="button" class="btn btn-default btn-success"'
									+ '		onclick="showAuthPhone(\''
									+ auths[j].authenticationId
									+ '\')">学信认证</button>';
						}
						break;
					case '10':
						if (auths[j].authStatus == 1) {
							jingdongHtml = '	<button type="button" class="btn btn-default btn-success"'
									+ '		onclick="showAuthPhone(\''
									+ auths[j].authenticationId
									+ '\')">京东认证</button>';
						}
						break;

					}
				}
				htmlStr += phoneHtml
						+ baseHtml
						+ idHtml
						+ bankHtml
						+ '</div>'
						+ '</div>'
						+ '</div>'
						+ '<div class="row" style="margin-top: 15px;">'
						+ '<div class="col-sm-2 text-left" style="line-height: 34px;">选择认证：</div>'
						+ '<div class="col-sm-10">' + '<div class="row">'
						+ wxHtml + contactHtml + askHtml + taobaoHtml
						+ xuexinkHtml + jingdongHtml + '</div>' + '</div>'
						+ '</div>';

				htmlStr += '<div class="row" style="margin-top: 15px;">'
						+ '<div class="col-sm-2 text-left" style="line-height: 34px;">相关数据：</div>'
						+ '<div class="col-sm-10">'
						+ '<div class="row" >'
						+ '<button type="button" class="btn btn-default" style="margin-right: 15px;">查看琥珀资信报告</button>'
						+ '<button type="button" class="btn btn-default" >查看资信报告</button>'
						+ '</div>'
						+ '</div>'
						+ '</div>'
						+ '<div class="row" style="margin-top: 15px;">'
						+ '<div class="form-group">'
						+ ' <label class="col-sm-2 text-left control-label" style="line-height: 34px;">审核评语：</label>'
						+ '<div class="col-sm-7" style="padding: 0px;">'
						+ '   <input type="text" class="form-control" id="'+list[i].id+'">'
						+ '</div>'
						+ '<div class="col-sm-3">'
						+ '	<button type="button" class="btn btn-default btn-danger"'
						+ '		style="float: right; margin-left: 15px;" onclick="noBorrow(\''
						+ list[i].id
						+ '\')">拒绝申请</button>'
						+ '	<button type="button" class="btn btn-default btn-success"'
						+ '		style="float: right; margin-left: 15px;" onclick="agreeBorrow(\''
						+ list[i].id + '\')">同意申请</button>' + '</div>'
						+ ' </div>' + '</div>' + '</div>';
			}
		} catch (arr) {
			console.log(arr);
		}

		$("#borrowContent").html(htmlStr);
	}
	function AgainApply() {
		$("#apply_again").modal("show");
	}
	function Select2Test() {
		$("#examine_result").select2();
	}
	function agreeBorrow(id) {
		var url = "${pageContext.request.contextPath}/data/borrow/agree";
		var param = "id=" + id + "&type=2r" + "&comment=" + $("#" + id).val();
		submitAjaxData(url, param, function(data) {
			LoadAjaxContent(
					'${pageContext.request.contextPath}/view/index_info',
					'wrapper');
		});
	}
	function noBorrow(id) {
		var url = "${pageContext.request.contextPath}/data/borrow/agree";
		var param = "id=" + id + "&type=2e" + "&comment=" + $("#" + id).val();
		submitAjaxData(url, param, function(data) {
			LoadAjaxContent(
					'${pageContext.request.contextPath}/view/index_info',
					'wrapper');
		});
	}
</script>