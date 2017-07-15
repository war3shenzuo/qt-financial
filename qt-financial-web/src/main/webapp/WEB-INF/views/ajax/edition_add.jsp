<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>清投金服</a></li>
	<li><a href="javascript:void(0)" onclick="LoadAjaxContent('${pageContext.request.contextPath}/view/edition_info', 'wrapper');">版本管理</a></li>
	<li class="active">新增版本 </li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">新增版本</header>
			<div class="panel-body">
				<form class="cmxform form-horizontal adminex-form" role="form"
					method="POST" id="editionForm" action="">
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">平台：</label>
						<div class="col-sm-6">
							<select id="edition_platform" name="edition_platform">
								<option value="">iOS</option>
								<option value="">android</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">版本号：</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="edition_number" id="edition_number"> 
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">更新提醒：</label>
						<div class="col-sm-6">
							<select id="edition_update" name="edition_update">
								<option value="">强制更新</option>
								<option value="">提醒更新</option>
								<option value="">无更新提醒</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">更新说明：</label>
						<div class="col-sm-6">
							<textarea name="update_explain" class="form-control" rows="6"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">版本描述：</label>
						<div class="col-sm-6">
							<textarea name="edition_explain" class="form-control" rows="6"></textarea>
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
		$('#editionForm').bootstrapValidator({
			feedbackIcons : {
				valid : 'fa fa-check',
				invalid : 'fa fa-times',
				validating : 'fa fa-times'
			},
			message : 'This value is not valid',
			fields : {
				edition_number : {
					validators : {
						notEmpty : {
							message : '版本号不能为空'
						}
					}
				},
				update_explain : {
					validators : {
						notEmpty : {
							message : '更新说明不能为空'
						}
					}
				},
				edition_explain : {
					validators : {
						notEmpty : {
							message : '版本说明不能为空'
						}
					}
				}
			}
		});
		Select2Test();
	});
	function Select2Test() {
		$("#edition_platform").select2();
		$("#edition_update").select2();
	}
</script>
