<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<div class="left-side sticky-left-side">

	<!--logo and iconic logo start-->
	<div class="logo">
	    <a href="index"><img src="${ctx}/common/img/logo.png" alt=""></a>
	</div>
	
	<div class="logo-icon text-center">
	    <a href="index"><img src="${ctx}/common/img/logo_icon.png" alt=""></a>
	</div>
	<!--logo and iconic logo end-->
	
	<div class="left-side-inner">
	
	    <!--sidebar nav start 左侧导航栏-->
	    <ul class="nav nav-pills nav-stacked custom-nav">
	    	<li class="menu-list"><a href=""><i class="fa fa-user"></i> <span>个人管理</span></a>
	    		<ul class="sub-menu-list">
	                <li><a href="#" onclick="LoadAjaxContent('index_info','wrapper')"> 医生审核</a></li>
	                <li><a href="#" onclick="LoadAjaxContent('nurse_info','wrapper')">护士审核</a></li>
	            </ul>
	    	</li>
	        <li class="menu-list"><a href="#"><i class="fa fa-users"></i> <span>团队管理</span></a>
	        	<ul class="sub-menu-list">
<!-- 	                <li><a href="#" onclick="LoadAjaxContent('combo_info','wrapper')"> 制定套餐</a></li> -->
	                <li class="menu-list"><a href="#"><sapn>团队审核</sapn></a> 
	                	<ul class="sub-menu-list" style="margin-left: 0px;">
	                		<li><a href="#" onclick="LoadAjaxContent('team_info?type=VERIFY','wrapper')" style="padding-left: 60px;"> 团队审核</a></li>
	                		<li><a href="#" onclick="LoadAjaxContent('team_info?type=CHANGE','wrapper')" style="padding-left: 60px;"> 团队变更</a></li>
	                	</ul>
	                </li>
	                <li class="menu-list"><a href="#" onclick="LoadAjaxContent('team_assessment_info','wrapper')"> <sapn>团队设置</sapn></a>
	                	<ul class="sub-menu-list" style="margin-left: 0px;">
	                		<li><a href="#" onclick="LoadAjaxContent('satisfaction_degree_info','wrapper')" style="padding-left: 60px;"> 患者满意度</a></li>
	                		<li><a href="#" onclick="LoadAjaxContent('complete_file_info','wrapper')" style="padding-left: 60px;"> 档案完善度</a></li>
	                		<li><a href="#" onclick="LoadAjaxContent('visit_frequency_info','wrapper')" style="padding-left: 60px;"> 随访频次</a></li>
	                		<li><a href="#" onclick="LoadAjaxContent('doctor_charge_info','wrapper')" style="padding-left: 60px;"> 医嘱程度</a></li>
	                	</ul>
	                </li>
	                <li><a href="#" onclick="LoadAjaxContent('team_quality_info','wrapper')"> 团队质量分析</a></li>
	                <li><a href="#" onclick="LoadAjaxContent('team_salary_info','wrapper')"> 团队薪资配置</a></li>
	            </ul>
	        </li>
	        <li class="menu-list"><a href="team_list"><i class="fa fa-pencil-square-o"></i> <span>反馈管理</span></a>
	        	<ul class="sub-menu-list">
	                <li><a href="#" onclick="LoadAjaxContent('doctor_feedback_info','wrapper')"> 医生反馈</a></li>
	                <li><a href="#" onclick="LoadAjaxContent('patient_feedback_info','wrapper')"> 病人反馈</a></li>
	            </ul>
	        </li>
	        <li class="menu-list"><a href="team_list"><i class="fa fa-cny"></i> <span>财务管理</span></a>
	        	<ul class="sub-menu-list">
	                <li><a href="#" onclick="LoadAjaxContent('pay_request','wrapper')"> 提现审核</a></li>
	                <li><a href="#" onclick="LoadAjaxContent('pay_request_ali','wrapper')"> 提现支付</a></li>
	                <li><a href="#" onclick="LoadAjaxContent('pay_request_history','wrapper')"> 历史提现记录</a></li>
	                <li><a href="#" onclick="LoadAjaxContent('pay_refund','wrapper')"> 退款审核</a></li>
	            </ul>
	        </li>
	        <li class="menu-list"><a href="team_list"><i class="fa fa-trophy"></i> <span>积分管理</span></a>
	        	<ul class="sub-menu-list">
	                <li><a href="#" onclick="LoadAjaxContent('integral_doctor','wrapper')"> 医生积分</a></li>
	                <li><a href="#" onclick="LoadAjaxContent('integral_patient','wrapper')"> 病人积分</a></li>
	            </ul>
	        </li>
	        <li class="menu-list"><a href="team_list"><i class="fa fa-frown-o"></i> <span>异常统计</span></a>
	        	<ul class="sub-menu-list">
	                <li class="menu-list"><a href="#"> <sapn>病人购买统计</sapn></a>
	                	<ul class="sub-menu-list" style="margin-left: 0px;">
	                		<li><a href="#" onclick="LoadAjaxContent('expetion_patient_buy_for_first','wrapper')" style="padding-left: 60px;"> 病人购买异常</a></li>
	                		<li><a href="#" onclick="LoadAjaxContent('patient_buy_all','wrapper')" style="padding-left: 60px;"> 病人购买统计</a></li>
	                	</ul>
	                </li>
<!-- 	                <li><a href="#" onclick="LoadAjaxContent('get_refuse_dailyTime','wrapper')"> 医生拒绝服务异常</a></li> -->
	            </ul>
	        </li>
	         <li class="menu-list"><a href="#"><i class="fa fa-list"></i> <span>健康百科</span></a>
	            <ul class="sub-menu-list">
	               <li><a href="#" onclick="LoadAjaxContent('information_list','wrapper')"> 百科列表</a></li>
<!-- 	               <li><a href="#" onclick="LoadAjaxContent('doctor_information_info','wrapper')"> 医生百科审核</a></li> -->
	            </ul>
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
