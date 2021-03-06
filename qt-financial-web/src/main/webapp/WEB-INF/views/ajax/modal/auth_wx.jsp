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
<div aria-hidden="false" aria-labelledby="authWxLabel" role="dialog"
	tabindex="-1" id="authWx" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button aria-hidden="true" data-dismiss="modal" class="close"
					type="button">关闭</button>
				<div class="col-sm-3">
					<h3 class="modal-title">微信认证</h3>
				</div>
				<div class="col-sm-3">
					<select id="check_wx" name="examine_choice_people">
						<option value="">审核信息</option>
						<option value="">审核通过</option>
						<option value="">审核未通过</option>
					</select>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="modal-body">
				<div class="div div-bordered">
					<div class="table-caption">自动认证</div>
					<div class="col-sm-4">微信头像</div>
					<div class="col-sm-8">xxx</div>
					
					<div class="col-sm-4">微信昵称</div>
					<div class="col-sm-8">xxx</div>
					
					<div class="col-sm-4">微信号/识别码</div>
					<div class="col-sm-8">如能获取则写</div>
				</div>
				<div class="clearfix"></div>
				
				<div class="div div-bordered">
					<div class="table-caption">认证时间</div>
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
	$("#check_wx").select2();
</script>