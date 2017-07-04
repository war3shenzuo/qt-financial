<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
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
		<ul class="nav nav-pills nav-stacked custom-nav">
			<li ><span>借款审核</span>
			<li class="menu"><a href="#"
				onclick="LoadAjaxContent('index_info','wrapper')">借款审核</a></li>
			<li ><span>客户管理</span>
			<li class="menu"><a href="#"
				onclick="LoadAjaxContent('index_info','wrapper')">借款申请</a></li>
	        </li>
	        <li><span>活动管理</span>
			<li class="menu"><a href="#"
				onclick="LoadAjaxContent('index_info','wrapper')"> 借款申请</a></li>
	        </li>
	    </ul>
	    <!--sidebar nav end 左侧导航栏-->
	
    </div>
</div>
   <!-- Modal-提示框 -->
    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal_info" class="modal fade new-modal">
    <div class="modal-dialog" style="width: 430px; border: 1px solid #ccc;">
        <div class="modal-content">
            <div class="modal-header new-modal-header">
                <button aria-hidden="true" data-dismiss="modal" class="close new-close" type="button">×</button>
                <h4 class="modal-title new-modal-title"></h4>
            </div>
            <div class="modal-body new-modal-body">
				<div><img alt="" src="${ctx}/common/img/admin/icon_success.jpg" id="info_type"></div>
                <div class="new-modal-body-title" id="info_msg">申请资质成功，等待审核</div>
            </div>
            <div class="modal-footer new-modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="myModal_info_button">返回</button>
            </div>
        </div>
    </div>
</div>
<!-- modal-提示框 -->
