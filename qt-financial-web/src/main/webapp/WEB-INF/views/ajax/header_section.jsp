<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<div class="header-section">

	<!--toggle button start-->
<!-- 	<a class="toggle-btn"><i class="fa fa-bars"></i></a> -->
	<!--toggle button end-->
	
	<!--notification menu start -->
	<div class="menu-right">
	    <ul class="notification-menu">
	        <li>
	             <a href="#" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
	                <img src="${ctx}/common/img/photos/user-avatar.png" alt="" />
	                John Doe
	                <span class="caret"></span>
	            </a>
	            <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
	                <li><a href="${ctx }/view/logout"><i class="fa fa-sign-out"></i> 退出登录</a></li>
	            </ul>
	        </li>
	
	    </ul>
	</div>
	<!--notification menu end -->
	    
</div>
