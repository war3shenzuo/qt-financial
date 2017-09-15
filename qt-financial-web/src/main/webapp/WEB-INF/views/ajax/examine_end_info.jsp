﻿<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!--index_info-->
<link href="${ctx}/common/css/index_info.css" rel="stylesheet">
<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>清投金服</a></li>
	<li class="active">借款审核</li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">等待终审 </header>
			<div class="panel-body">
                <div class="examine-content" id="borrowContent">
                </div>
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

<script src="${ctx}/common/js/index_info.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		scrollTo(0,0);
		var url = "${pageContext.request.contextPath}/view/modal/auth_phone";
		LoadAjaxContent(url, "auth_phone");
		var url = "${pageContext.request.contextPath}/view/modal/auth_base";
		LoadAjaxContent(url, "auth_base");
		var url = "${pageContext.request.contextPath}/view/modal/auth_id";
		LoadAjaxContent(url, "auth_id");
		var url = "${pageContext.request.contextPath}/view/modal/auth_wx";
		LoadAjaxContent(url, "auth_wx");
		var url = "${pageContext.request.contextPath}/view/modal/auth_contact";
		LoadAjaxContent(url, "auth_contact");
		var url = "${pageContext.request.contextPath}/view/modal/borrow_list";
		LoadAjaxContent(url, "borrow_list");
		
		
		var url = "${pageContext.request.contextPath}/data/all?borrowType=3r";
		LoadAjaxData(url, loadBorrowList);
		
		Select2Test();
	});
	function Select2Test() {
		$("#examine_choice").select2();
	}
	
	function loadBorrowList(data){
		console.log(data);
		try{
			var list = data.objList;
			var htmlStr = "";
			for(var i= 0;i<list.length;i++){
				htmlStr+='<div class="examine-box">'
					+'<div class="row">'
					+'<div class="col-sm-2">'
					+'<img alt="" src="${ctx}/common/img/no_pic200.png" onerror="this.src=\'${ctx }/common/img/no_pic200.png\'" '
					+'style="width: 100%; height: auto; max-height: 150px; min-width: 70px;  border-radius: 50%; border: 1px solid #eee;">'
					+'</div>'
					+'<div class="col-sm-8">'
					+'<div class="row examine-news">'
					+'	<span>ID:</span><span>'+list[i].id+'</span>'
					+'<span>'+list[i].user.truename+'</span>'
					+'<span>电话：</span><span>'+list[i].user.usermobile+'</span>'
					+'	<span>普通客户</span><span>|</span><a href="#" onclick="showBorrowList()">查看借款记录</a>'
					+'</div>'
					+'<div class="row examine-news">'
					+'	<span>申请借款：</span><span class="loan-amount">'+list[i].amount+'元</span><span>申请时间：</span><span>'+formatDatetime(list[i].applyAt)+'</span>'
					+'</div>'
					+'</div>'
					+'<div class="col-sm-3">'
					+'</div>'
					+'</div>'
					+'<div class="row" style="margin-top: 15px;">'
					+'<div class="col-sm-2 text-left" style="line-height: 34px;">必要认证：</div>'
					+'<div class="col-sm-10">'
					+'<div class="row">'
					+'	<button type="button" class="btn btn-default btn-success"'
					+'		onclick="showAuthPhone(\''+list[i].user.id+'\')">手机认证</button>'
					+'	<button type="button" class="btn btn-default btn-success"'
					+'		onclick="showAuthBase(\''+list[i].user.id+'\')">个人信息</button>'
					+'	<button type="button" class="btn btn-default btn-success" onclick="showAuthId('+list[i].user.id+')">身份证认证</button>'
					+'	<button type="button" class="btn btn-default btn-success">银行卡认证</button>'
					+'</div>'
					+'</div>'
					+'</div>'
					+'<div class="row" style="margin-top: 15px;">'
					+'<div class="col-sm-2 text-left" style="line-height: 34px;">选择认证：</div>'
					+'<div class="col-sm-10">'
					+'<div class="row">'
					+'	<button type="button" class="btn btn-default btn-info" onclick="showAuthWx(\''+list[i].user.id+'\')">微信认证</button>'
					+'	<button type="button" class="btn btn-default btn-info"'
					+'		onclick="showAuthContact(\''+list[i].user.id+'\')">授权通讯录</button>'
					+'	<button type="button" class="btn btn-default btn-info">问卷认证</button>'
					+'	<button type="button" class="btn btn-default btn-info">淘宝认证</button>'
					+'	<button type="button" class="btn btn-default btn-info">学信认证</button>'
					+'	<button type="button" class="btn btn-default btn-info">京东认证</button>'
					+'</div>'
					+'</div>'
					+'</div>'
					+'<div class="row" style="margin-top: 15px;">'
					+'<div class="col-sm-2 text-left" style="line-height: 34px;">相关数据：</div>'
					+'<div class="col-sm-10">'
					+'<div class="row" >'
					+'<button type="button" class="btn btn-default" style="margin-right: 15px;">查看琥珀资信报告</button>'
					+'<button type="button" class="btn btn-default" >查看资信报告</button>'
					+'</div>'
					+'</div>'
					+'</div>'
					+'<div class="row" style="margin-top: 15px;">'
					+'<div class="form-group">'
					+' <label class="col-sm-2 text-left control-label" style="line-height: 34px;">初审评语：</label>'
					+'<div class="col-sm-7" style="padding: 0px;">'
					+'   <div style="line-height: 34px;">'+list[i].borrowMoneyFlow[0].comment+'</div>'
					+'</div>'
					+' </div>'
					+'</div>'
					+'<div class="row" style="margin-top: 15px;">'
					+'<div class="form-group">'
					+' <label class="col-sm-2 text-left control-label" style="line-height: 34px;">复审评语：</label>'
					+'<div class="col-sm-7" style="padding: 0px;">'
					+'   <div style="line-height: 34px;">'+list[i].borrowMoneyFlow[1].comment+'</div>'
					+'</div>'
					+' </div>'
					+'</div>'
					+'<div class="row" style="margin-top: 15px;">'
					+'<div class="form-group">'
					+' <label class="col-sm-2 text-left control-label" style="line-height: 34px;">终审评语：</label>'
					+'<div class="col-sm-7" style="padding: 0px;">'
					+'   <input type="text" class="form-control" id="'+list[i].id+'">'
					+'</div>'
					+'<div class="col-sm-3">'
					+'	<button type="button" class="btn btn-default btn-danger"'
					+'		style="float: right; margin-left: 15px;" onclick="noBorrow(\''+list[i].id+'\')">拒绝申请</button>'
					+'	<button type="button" class="btn btn-default btn-success"'
					+'		style="float: right; margin-left: 15px;" onclick="agreeBorrow(\''+list[i].id+'\')">同意申请</button>'
					+'</div>'
					+' </div>'
					+'</div>'
					+'</div>';
			}
		} catch(arr){
			console.log(arr);
		}
		$("#borrowContent").html(htmlStr);
	}
	function agreeBorrow(id){
		var url = "${pageContext.request.contextPath}/data/borrow/agree";
		var param = "id="+id+"&type=4r"+"&comment="+$("#"+id).val();
		submitAjaxData(url,param,function(data){
			LoadAjaxContent('${pageContext.request.contextPath}/view/examine_end_info','wrapper');
		});
	}
	function noBorrow(id){
		var url = "${pageContext.request.contextPath}/data/borrow/agree";
		var param = "id="+id+"&type=4e"+"&comment="+$("#"+id).val();
		submitAjaxData(url,param,function(data){
			LoadAjaxContent('${pageContext.request.contextPath}/view/examine_end_info','wrapper');
		});
	}
</script>