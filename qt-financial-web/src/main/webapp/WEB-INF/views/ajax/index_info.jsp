<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<style>
.record{
margin-top:10px;
padding:10px;
background-color:white;
}
.row{
margin-top:5px;
margin-bottom:5px;
}
span{
margin-left:10px;
margin-right:10px;
}
</style>
<ul class="nav nav-pills">
	<li><a href="#" onclick="getBorrow(1)">审核中</a></li>
	<li class="active"><a href="#" onclick="getBorrow(2)">审核完毕</a></li>
</ul>
<div class="record">
	<div class="row">
		<div class="col-sm-2">头像</div>
		<div class="col-sm-10">
			<div class="row">
				ID:<span>12313241432412341324</span>电话：<span>13737373737</span><span>普通客户</span>|<a style="margin-left: 10px;">查看借款记录</a>
				<button type="button" class="btn btn-default" style="float:right;margin-right:15px;">拒绝申请</button>
				<button type="button" class="btn btn-default" style="float:right;margin-right:15px;">同意申请</button>
			</div>
			<div class="row">
				申请借款：<span>1000元</span>申请时间：<span>2017年06月26日 14:13</span>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-sm-2">认证情况：</div>
		<div class="col-sm-10">
			<div class="row">
				<button type="button" class="btn btn-default" onclick="showAuthPhone()">手机认证</button>
				<button type="button" class="btn btn-default" onclick="showAuthBase()">个人信息</button>
				<button type="button" class="btn btn-default" onclick="showAuthId()">身份证认证</button>
				<button type="button" class="btn btn-default">银行卡认证</button>
				<button type="button" class="btn btn-default" onclick="showAuthWx()">微信认证</button>
				<button type="button" class="btn btn-default" onclick="showAuthContact()">授权通讯录</button>
				<button type="button" class="btn btn-default">支付宝认证</button>
				<button type="button" class="btn btn-default">京东认证</button>
				<button type="button" class="btn btn-default">问卷认证</button>
				<button type="button" class="btn btn-default">学信认证</button>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-2">相关数据：</div>
		<div class="col-sm-10">
			<div class="row">
				<label>胡泊信用分：</label><span>211</span>，<label>支付宝信用分：</label><span>421</span>
				<button type="button" class="btn btn-default" style="float:right;margin-right:15px;">查看资信报告</button>
			</div>
		</div> 
	</div>
</div>

<div id="auth_phone"></div>
<div id="auth_base"></div>
<div id="auth_id"></div>
<div id="auth_wx"></div>
<div id="auth_contact"></div>
<script src="${ctx}/common/js/index_info.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
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
		
	});
	function loadDoctorCheck(data) {
		try {
			var img_url = $("#img_url").val();
			var htmlStr = "";
			var dataList = data.objList;
			for (var i = 0; i < dataList.length; i++) {
				htmlStr += '<tr class="gradeX">'
						+ ' <td><a class="example-image-link" data-lightbox="example-set1" href="'+img_url+dataList[i].userPic+'" title="'+dataList[i].userName+'"><img src="'
						+ img_url
						+ dataList[i].userPic
						+ '?x-oss-process=image/resize,w_40" alt="头像" onerror="this.src=\'${pageContext.request.contextPath}/common/img/no_pic40.png\'" style="width: 40px; height: auto;" /></a>'
						+ dataList[i].userName
						+ '</td>'
						+ '<td><a class="example-image-link" data-lightbox="example-set2" href="'+img_url+dataList[i].urlFront+'" title="身份证正面"><img src="'
						+ img_url
						+ dataList[i].urlFront
						+ '?x-oss-process=image/resize,w_40" alt="身份证正面" onerror="this.src=\'${pageContext.request.contextPath}/common/img/no_pic40.png\'" style="width: 40px; height: auto;" /></a></td>'
						+ '<td><a class="example-image-link" data-lightbox="example-set3" href="'+img_url+dataList[i].urlBack+'" title="身份证反面"><img src="'
						+ img_url
						+ dataList[i].urlBack
						+ '?x-oss-process=image/resize,w_40" alt="身份证反面" onerror="this.src=\'${pageContext.request.contextPath}/common/img/no_pic40.png\'" style="width: 40px; height: auto;" /></a></td>'
						+ '<td><a class="example-image-link" data-lightbox="example-set4" href="'+img_url+dataList[i].scUrl+'" title="手持身份证"><img src="'
						+ img_url
						+ dataList[i].scUrl
						+ '?x-oss-process=image/resize,w_40" alt="手持身份证" onerror="this.src=\'${pageContext.request.contextPath}/common/img/no_pic40.png\'" style="width: 40px; height: auto;" /></a></td>'
						+ ' <td>';
				for (var j = 0; j < dataList[i].zgUrl.length; j++) {
					htmlStr += '<a class="example-image-link" data-lightbox="example-set5" href="'+img_url+dataList[i].zgUrl[j]+'" title="医师资格证"><img src="'
							+ img_url
							+ dataList[i].zgUrl[j]
							+ '?x-oss-process=image/resize,w_40" alt="医师资格证" onerror="this.src=\'${pageContext.request.contextPath}/common/img/no_pic40.png\'" style="width: 40px; height: auto;" /></a>';
				}
				htmlStr += '</td><td>';
				for (var h = 0; h < dataList[i].content.length; h++) {
					if (h == dataList[i].content.length - 1) {
						if (dataList[i].content[h] == 'SIGN_DOC') {
							htmlStr += '签约医生';
						} else {
							htmlStr += '指导医生';
						}
					} else {
						if (dataList[i].content[h] == 'SIGN_DOC') {
							htmlStr += '签约医生,';
						} else {
							htmlStr += '指导医生,';
						}
					}
				}
				htmlStr += '</td><td>';
				if (dataList[i].state == 'CHECK_QUALITY_VERIFY') {
					htmlStr += '资质申请';
				}
				if (dataList[i].state == 'CHECK_QUALITY_UPDATE_VERIFY') {
					htmlStr += '更新资质';
				}
				htmlStr += ' </td>' + ' <td><a href="#" onclick="update('
						+ dataList[i].id + ',this,' + dataList[i].userId
						+ ',\'' + dataList[i].state
						+ '\')">通过</a>|<a href="#" onclick="refuse('
						+ dataList[i].id + ',this,' + dataList[i].userId
						+ ',\'' + dataList[i].state + '\')">拒绝</a></td> '
						+ '</tr>';
			}
			$("#content").html(htmlStr);

			$('#dynamic-table').dataTable({
				"aaSorting" : [ [ 4, "desc" ] ]
			});

		} catch (arr) {
			console.log(arr);
		}
	}
	function getBorrow(data){
		console.log(data);
	}  
</script>