<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>慢病mlnx专用</a></li>
	<li class="active">团队薪资配置</li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">
				<i class="fa fa-list-ol"></i> 团队薪资配置
			</header>
			<div class="panel-body">
				<form class="cmxform form-horizontal adminex-form" action="" id="content">
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">病人付款项直接入账比例(单位：%)：</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="salaryBefore" value="${tSalaryAllocation.salaryBefore }" readonly="readonly" style="border: none; background: none;">
						</div>
						<label class="col-sm-2 col-sm-2 control-label"><a href="#" onclick="LoadAjaxContent('${pageContext.request.contextPath}/mlnx/team_salary_change','wrapper')"><i class="fa fa-edit"></i>修改</a></label>
					</div>
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">病人付款项服务到期后入账比例(单位：%)：</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="salaryAfter" value="${tSalaryAllocation.salaryAfter }" readonly="readonly" style="border: none; background: none;">
						</div>
					</div>
				</form>
			</div>
		</section>
		<!--notification end-->
	</div>
</div>
<!-- 模态框（Modal） -->

<!-- 模态框（Modal） -->

<script type="text/javascript">
$(document).ready(function() {
	var url = "${pageContext.request.contextPath}/data/team_salary_info";
	LoadAjaxData(url, loadTeamSalaryInfo);
});
function loadTeamSalaryInfo(data){
	try{
		var htmlStr ="";
		var dataObj = data.obj;
		htmlStr += '<div class="form-group">'
				+  '<label class="col-sm-4 col-sm-4 control-label">病人付款项直接入账比例(单位：%)：</label>'
				+  '<div class="col-sm-6">'
				+  '<input type="text" class="form-control" name="salaryBefore" value="'+dataObj.salaryBefore+'" readonly="readonly" style="border: none; background: none;">'
				+  '</div>'
				+  '<label class="col-sm-2 col-sm-2 control-label"><a href="#" onclick="LoadAjaxContent(\'${pageContext.request.contextPath}/mlnx/team_salary_change\',\'wrapper\')"><i class="fa fa-edit"></i>修改</a></label>'
				+  '</div>'
				+  '<div class="form-group">'
				+  '<label class="col-sm-4 col-sm-4 control-label">病人付款项服务到期后入账比例(单位：%)：</label>'
				+  '<div class="col-sm-6">'
				+  '<input type="text" class="form-control" name="salaryAfter" value="'+dataObj.salaryAfter+'" readonly="readonly" style="border: none; background: none;">'
				+  '</div>'
				+  '</div>';
		$("#content").html(htmlStr);
	}catch (arr){
		console.log(arr);
	}
};
</script>