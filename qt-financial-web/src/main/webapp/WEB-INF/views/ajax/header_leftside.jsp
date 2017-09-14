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
						onclick="${menu.onclick}" id="click0"><i
							class="fa fa-money"></i> <span>${menu.name}</span></a></li>
				</c:if>
				<c:if test="${menu.list.size() > 0}">
					<li class="menu-list"><a href=""><i class="fa fa-money"></i>
							<span>${menu.name}</span></a>
						<ul class="sub-menu-list">
							<c:forEach items="${menu.list}" var="subMenu" varStatus="status">
								<li><a href="javascript:void(0)"
									onclick="${subMenu.onclick}" id="click${status.index}">${subMenu.name}</a></li>
							</c:forEach>
						</ul></li>
				</c:if>
			</c:forEach>
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