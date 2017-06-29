<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>慢病mlnx专用</a></li>
	<li><a href="#" onclick="LoadAjaxContent('${pageContext.request.contextPath}/mlnx/combo_info','wrapper')">制定套餐</a></li>
	<li class="active">新增套餐</li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">
				<i class="fa fa-list-ol"></i> 新增套餐
			</header>
			<div class="panel-body">
				<form class="cmxform form-horizontal adminex-form" role="form" method="POST"
					id="doctor_team_treatment_form"
					action="combo_add_json">
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">套餐名称：</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="name">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">套餐内容：</label>
						<div class="col-sm-6">
							<textarea name="content" class=" col-lg-12 form-control"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">适用人群：</label>
						<div class="col-sm-6">
							<textarea name="adaptGroup" class=" col-lg-12 form-control"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">套餐价格：</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="price">
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

<script type="text/javascript">
$(document).ready(function() {
	doctorteamtreatmentValidator();
});
function doctorteamtreatmentValidator() {
	$('#doctor_team_treatment_form').bootstrapValidator({
		feedbackIcons : {
			valid : 'fa fa-check',
			invalid : 'fa fa-times',
			validating : 'fa fa-times'
		},
		submitHandler: function(validator, form, submitButton) {
		    // Use Ajax to submit form data
		    $.post(form.attr('action'), form.serialize(), function(result) {
			    if(result.Msg){
			    	LoadAjaxContent("${pageContext.request.contextPath}/mlnx/combo_info","wrapper");
				    }
			    else{
			    	document.getElementById("info_type").src = "${pageContext.request.contextPath}/common/img/admin/icon_error.jpg";
			    	document.getElementById("info_msg").innerHTML = "新增失败";
					$('#myModal_info').modal('show');
                    //alert("新增失败");
				    }
		    }, 'json');
		},
		message : 'This value is not valid',
		fields : {
			name : {
				validators : {
					notEmpty : {
						message : '套餐名称不能为空'
					}
				}
			},
			content : {
				validators : {
					notEmpty : {
						message : '套餐内容不能为空'
					}
				}
			},
			adaptGroup : {
				validators : {
					notEmpty : {
						message : '适用人群不能为空'
					}
				}
			},
			price : {
				validators : {
					notEmpty : {
						message : '套餐价格不能为空'
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