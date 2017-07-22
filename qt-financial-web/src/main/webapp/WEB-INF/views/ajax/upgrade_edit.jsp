<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>清投金服</a></li>
	<li><a href="javascript:void(0)" onclick="LoadAjaxContent('${pageContext.request.contextPath}/view/upgrade_info', 'wrapper');">升级策略管理</a></li>
	<li class="active">等级编辑 </li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">等级编辑 </header>
			<div class="panel-body">
				<form class="cmxform form-horizontal adminex-form" role="form"
					method="POST" id="gradeForm" action="">
					<input type="hidden" value="${param.id}" name="id" id="id">
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">会员等级：</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="name" id="member_grade" readonly> 
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">需要次数：</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="num" id="member_number">
						</div>
					</div>
					<div class="form-group">
                        <div class="col-lg-offset-4 col-lg-8">
                        	<button class="btn btn-default" data-dismiss="modal" style="padding: 6px 50px; margin-right: 20px;">取消</button>
							<button class="btn btn-primary" type="submit" style="padding: 6px 50px;">提交</button>
						</div>
                    </div>
				</form>
			</div>
		</section>
	</div>
</div>


	
<script type="text/javascript">
	$(document).ready(function() {
		scrollTo(0,0);
		var url ="${pageContext.request.contextPath}/data/getUserLevelInfo?id="+$("#id").val();
		LoadAjaxData(url,loadData);
		function loadData(data){
			try{
				console.log(data);
				$("#member_grade").val(data.obj.name);
				$("#member_number").val(data.obj.num);
			} catch(arr){
				console.log(arr);
			}
		}
		$('#gradeForm').bootstrapValidator({
			submitHandler : function(validator, form,
					submitButton) {
				var url = "${pageContext.request.contextPath}/data/user/level/edit";//或form.attr('action')
				var param = form.serialize();//或者form.serialize()
				submitAjaxData(url, param, callback);
				function callback(data) {
					LoadAjaxContent('upgrade_info','wrapper');
				}
			},
			feedbackIcons : {
				valid : 'fa fa-check',
				invalid : 'fa fa-times',
				validating : 'fa fa-times'
			},
			message : 'This value is not valid',
			fields : {
				member_grade : {
					validators : {
						notEmpty : {
							message : '会员等级不能为空'
						}
					}
				},
				member_number : {
					validators : {
						notEmpty : {
							message : '需要次数不能为空'
						}
					}
				}
			}
		});
	});
</script>
