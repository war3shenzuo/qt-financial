<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<input type="hidden" value="${adminLogin.id}" id="userId" />
<div class="left-side sticky-left-side">

	<!--logo and iconic logo start-->
	<div class="logo">
		<a href="index">清投金服</a>
	</div>

	<div class="logo-icon text-center">
		<a href="index">清投金服</a>
	</div>
	<!--logo and iconic logo end-->

	<div class="left-side-inner">

		<!--sidebar nav start 左侧导航栏-->
		<ul class="nav nav-pills nav-stacked custom-nav" id="qt_menu">
			<c:forEach items="${menu.objList}" var="menu">
				<c:if test="${menu.list.size() == 0}">
					<li><a href="javascript:void(0)"
						onclick="LoadAjaxContent('index_info','wrapper')"><i
							class="fa fa-money"></i> <span>借款审核</span></a></li>
				</c:if>
				<c:if test="${menu.list.size() > 0}">
					<li class="menu-list"><a href=""><i class="fa fa-money"></i>
							<span>借款审核</span></a>
						<ul class="sub-menu-list">
							<c:forEach items="${menu.list}" var="subMenu">
								<li><a href="javascript:void(0)"
									onclick="LoadAjaxContent('examine_info','wrapper')">等待复审</a></li>
							</c:forEach>
						</ul></li>
				</c:if>
			</c:forEach>
			<!--审核员后台 start-->
			<li><a href="javascript:void(0)"
				onclick="LoadAjaxContent('index_info','wrapper')"><i
					class="fa fa-money"></i> <span>借款审核</span></a></li>
			<li><a href="javascript:void(0)"
				onclick="LoadAjaxContent('customer_info','wrapper')"><i
					class="fa fa-users"></i> <span>客户管理</span></a></li>
			<li><a href="javascript:void(0)"
				onclick="LoadAjaxContent('activity_info','wrapper')"><i
					class="fa fa-tags"></i> <span>活动管理</span></a></li>
			<!--审核员后台 start -->

			<!--经理后台 start -->
			<li class="menu-list"><a href=""><i class="fa fa-money"></i>
					<span>借款审核</span></a>
				<ul class="sub-menu-list">
					<li><a href="javascript:void(0)"
						onclick="LoadAjaxContent('examine_info','wrapper')">等待复审</a></li>
					<li><a href="javascript:void(0)"
						onclick="LoadAjaxContent('record_info','wrapper')">审核记录</a></li>
				</ul></li>
			<li><a href="javascript:void(0)"
				onclick="LoadAjaxContent('customer_info','wrapper')"><i
					class="fa fa-users"></i> <span>客户管理</span></a></li>
			<!--经理后台 start -->

			<!--打款员后台 start -->
			<li class="menu-list"><a href=""><i class="fa fa-money"></i>
					<span>打款处理</span></a>
				<ul class="sub-menu-list">
					<li><a href="javascript:void(0)"
						onclick="LoadAjaxContent('playmoney_info','wrapper')">等待打款</a></li>
					<li><a href="javascript:void(0)"
						onclick="LoadAjaxContent('playrecond_info','wrapper')">打款记录</a></li>
				</ul></li>
			<li><a href="javascript:void(0)"
				onclick="LoadAjaxContent('customer_info','wrapper')"><i
					class="fa fa-users"></i> <span>客户管理</span></a></li>
			<li><a href="javascript:void(0)"
				onclick="LoadAjaxContent('activity_info','wrapper')"><i
					class="fa fa-tags"></i> <span>活动管理</span></a></li>
			<!--打款员后台 start -->

			<!--管理员后台 start -->
			<li class="menu-list"><a href=""><i class="fa fa-cogs"></i>
					<span>系统管理</span></a>
				<ul class="sub-menu-list">
					<li><a href="javascript:void(0)"
						onclick="LoadAjaxContent('product_info','wrapper')">产品管理</a></li>
					<li><a href="javascript:void(0)"
						onclick="LoadAjaxContent('upgrade_info','wrapper')">升级策略管理</a></li>
					<li><a href="javascript:void(0)"
						onclick="LoadAjaxContent('banner_info','wrapper')">banner管理</a></li>
				</ul></li>
			<li class="menu-list"><a href=""><i class="fa fa-group"></i>
					<span>客户管理</span></a>
				<ul class="sub-menu-list">
					<li><a href="javascript:void(0)"
						onclick="LoadAjaxContent('customer_info','wrapper')">客户管理</a></li>
					<li><a href="javascript:void(0)"
						onclick="LoadAjaxContent('group_info','wrapper')">客户分组管理</a></li>
				</ul></li>
			<li class="menu-list"><a href=""><i class="fa fa-th"></i> <span>事务管理</span></a>
				<ul class="sub-menu-list">
					<li><a href="javascript:void(0)"
						onclick="LoadAjaxContent('invitation_info','wrapper')">邀请码管理</a></li>
					<li><a href="javascript:void(0)"
						onclick="LoadAjaxContent('event_info','wrapper')">活动管理</a></li>
					<li><a href="javascript:void(0)"
						onclick="LoadAjaxContent('coupon_info','wrapper')">优惠券管理</a></li>
					<li><a href="javascript:void(0)"
						onclick="LoadAjaxContent('message_info','wrapper')">CEO留言管理</a></li>
				</ul></li>
			<li><a href="javascript:void(0)"
				onclick="LoadAjaxContent('data_info','wrapper')"><i
					class="fa fa-list-alt"></i> <span>数据管理</span></a></li>
			<li><a href="javascript:void(0)"
				onclick="LoadAjaxContent('edition_info','wrapper')"><i
					class="fa fa-arrow-circle-o-up"></i> <span>版本管理</span></a></li>
			<!-- 	    	管理员后台 end -->
		</ul>
		<!--sidebar nav end 左侧导航栏-->

	</div>
</div>
<!-- Modal-提示框 -->
<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog"
	tabindex="-1" id="myModal_info" class="modal fade new-modal">
	<div class="modal-dialog" style="width: 430px; border: 1px solid #ccc;">
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
<script src="${ctx}/common/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var userId = $("#userId").val();
		// 	LoadAjaxData('${pageContext.request.contextPath}/data/menu?userId='+userId,function(data){
		// 		try{
		// 			var htmlStr = '';
		// 			var list = data.objList;
		// 			for(var i = 0 ;i < list.length; i ++){
		// 				if(list[i].list.length==0){
		// 					htmlStr += '<li><a href="javascript:void(0)" onclick="'+list[i].onclick+'"><i class="fa fa-money"></i> <span>'+list[i].name+'</span></a></li>';
		// 				} else {
		// 					htmlStr += '<li class="menu-list"><a href="javascript:void(0)"><i class="fa fa-money"></i> <span>'+list[i].name+'</span></a>'
		// 			    		+'<ul class="sub-menu-list list-unstyled">';
		// 			    	for(var j=0;j<list[i].list.length;j++){
		// 			    		htmlStr += '<li><a href="javascript:void(0)" onclick="'+list[i].list[j].onclick+'">'+list[i].list[j].name+'</a></li>';
		// 			    	}
		// 			    	htmlStr +='</ul></li>';
		// 				}
		// 			}		
		// 			$("#qt_menu").html(htmlStr);
		// 		} catch(arr){
		// 			console.log(arr);
		// 		}

		// 	});
	});
</script>