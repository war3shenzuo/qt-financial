<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
caption {
	text-align: left;
	margin-top: 15px;
	margin-bottom: 10px;
	font-size: 16px;
	font-weight: 900;
}
</style>
<!-- 手机认证模态框（Modal） -->
<div aria-hidden="false" aria-labelledby="authIdLabel" role="dialog"
	tabindex="-1" id="authId" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button aria-hidden="true" data-dismiss="modal" class="close"
					type="button">关闭</button>
				<div class="col-sm-3">
					<h3 class="modal-title">身份证认证</h3>
				</div>
				<div class="col-sm-3">
					<select id="check_id" name="examine_choice_people">
						<option value="">审核信息</option>
						<option value="">审核通过</option>
						<option value="">审核未通过</option>
					</select>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="modal-body">
				<div class="div div-bordered">
					<div class="table-caption">人工审核</div>
					<div class="col-sm-4">姓名</div>
					<div class="col-sm-8">王XX</div>

					<div class="col-sm-4">身份证号</div>
					<div class="col-sm-8">xxxxxxxxxxx</div>

					<div class="col-sm-4">提交时间</div>
					<div class="col-sm-8">2017-09-17 09:11</div>
				</div>
				<div class="clearfix"></div>
				
				<div class="div div-bordered">
					<div class="table-caption">人工审核</div>
					<div class="col-sm-4">身份证</div>
					<div class="col-sm-8">王XX</div>

					<div class="col-sm-4">手持身份证照</div>
					<div class="col-sm-8">xxxxxxxxxxx</div>
					
					<div class="col-sm-4">识别到的信息</div>
					<div class="col-sm-8">xxxxxxxxxxx</div>

					<div class="col-sm-4">提交时间</div>
					<div class="col-sm-8">2017-09-17 09:11</div>
				</div>
				<div class="clearfix"></div>
				
					<div class="div div-bordered">
					<div class="table-caption">自动认证</div>
					<div class="col-sm-4">身份证</div>
					<div class="col-sm-8">王XX</div>

					<div class="col-sm-4">人脸</div>
					<div class="col-sm-8">xxxxxxxxxxx</div>
					
					<div class="col-sm-4">识别身份证号</div>
					<div class="col-sm-8">xxxxxxxxxxx</div>
					
					<div class="col-sm-4">识别姓名</div>
					<div class="col-sm-8">王XX</div>

					<div class="col-sm-4">提交时间</div>
					<div class="col-sm-8">2017-09-17 09:11</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</div>
<!-- 模态框（Modal） -->
<script>
	$("#check_id").select2();
</script>