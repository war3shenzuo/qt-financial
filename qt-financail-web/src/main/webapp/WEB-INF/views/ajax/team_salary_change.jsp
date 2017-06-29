<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>慢病mlnx专用</a></li>
	<li><a href="#" onclick="LoadAjaxContent('${pageContext.request.contextPath}/mlnx/team_salary_info','wrapper')">团队薪资配置</a></li>
	<li class="active">薪资配置修改</li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">
				<i class="fa fa-list-ol"></i> 团队薪资配置
			</header>
			<div class="panel-body">
				<form class="cmxform form-horizontal adminex-form" role="form" method="POST" id="team_salary_info_form" action="${pageContext.request.contextPath }/data/update_team_salary_info_json">
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">病人付款项直接入账比例(单位：%)：</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="salaryBefore" value="${tSalaryAllocation.salaryBefore }">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">病人付款项服务到期后入账比例(单位：%)：</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="salaryAfter" value="${tSalaryAllocation.salaryAfter }">
						</div>
					</div>
					<div class="form-group">
						<div class="col-lg-offset-6 col-lg-10">
							<button class="btn btn-primary" type="submit">保存</button>
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
	doctorteamtreatmentValidator();
});
function doctorteamtreatmentValidator() {
	$('#team_salary_info_form').bootstrapValidator({
		message : 'This value is not valid',
		submitHandler: function(validator, form, submitButton) {
		    // Use Ajax to submit form data
		    $.post(form.attr('action'), form.serialize(), function(result) {
			    if(result.responseCode=='200'){
			    	LoadAjaxContent("${pageContext.request.contextPath}/mlnx/team_salary_info","wrapper");
				    }
			    else{
			    	document.getElementById("info_type").src = "${pageContext.request.contextPath}/common/img/admin/icon_error.jpg";
			    	document.getElementById("info_msg").innerHTML = "更新失败";
					$('#myModal_info').modal('show');
                    //alert("更新失败");
				    }
		    }, 'json');
		},
		fields : {
			salaryBefore : {
				validators : {
					notEmpty : {
						message : '选项不能为空'
					},
					regexp : {
						regexp : /^[0-9]+\.?[0-9]*$/,
						message : '只能是整数或者小数'
					}
				}
			},
			salaryAfter : {
				validators : {
					notEmpty : {
						message : '选项不能为空'
					},
					regexp : {
						regexp : /^[0-9]+\.?[0-9]*$/,
						message : '只能是整数或者小数'
					}
				}
			}
		}
	});
}
</script>