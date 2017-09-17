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
<div aria-hidden="false" aria-labelledby="authPhoneLabel" role="dialog"
	tabindex="-1" id="authPhone" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button aria-hidden="true" data-dismiss="modal" class="close"
					type="button">关闭</button>
				<div class="col-sm-3">
					<h3 class="modal-title">银行卡认证</h3>
				</div>
				<div class="col-sm-3">
					<select id="check_phone" name="examine_choice_people">
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
					<div class="col-sm-4">开户行</div>
					<div class="col-sm-8">广大银行</div>

					<div class="col-sm-4">开户省市</div>
					<div class="col-sm-8">浙江省 绍兴市</div>
					
					<div class="col-sm-4">预留手机号</div>
					<div class="col-sm-8">15787627621</div>
					
					<div class="col-sm-4">卡号</div>
					<div class="col-sm-8">3212323141277367</div>
					
					<div class="col-sm-4">卡类型</div>
					<div class="col-sm-8">借记卡/信用卡</div>
				</div>
				<div class="clearfix"></div>
				<div class="div div-bordered">
					<div class="table-caption">认证时间</div>
					<div class="col-sm-4">提交时间</div>
					<div class="col-sm-8">2017-09-17 09:11</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 模态框（Modal） -->
<script>
	$("#check_phone").select2();
</script>