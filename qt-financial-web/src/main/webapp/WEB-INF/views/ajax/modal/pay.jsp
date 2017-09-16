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
<!-- 模态框（Modal） -->
<div aria-hidden="false" aria-labelledby="authWxLabel" role="dialog"
	tabindex="-1" id="payModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<input type="hidden" value="" id="borrowId" />
				<button aria-hidden="true" data-dismiss="modal" class="close"
					type="button">关闭</button>
				<h3 class="modal-title">设置打款情况</h3>
			</div>
			<div class="modal-body">
				<div class="col-sm-6 col-sm-offset-3">
					<select id="pay_status" name="pay_status">
						<option value="5e">未打款</option>
						<option value="5r">已打款</option>
					</select>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="modal-footer">
				<div class="col-sm-3 col-sm-offset-3" style="text-align: center;">
					<button class="btn btn-primary">关闭</button>
				</div>
				<div class="col-sm-3">
					<button class="btn btn-primary" style="text-align: center;" onclick="submitPay()">确定</button>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</div>
<!-- 模态框（Modal） -->
<script>
	$("#pay_status").select2();
	function submitPay(){
		$("#payModal").modal("hide");
		var url = "${pageContext.request.contextPath}/data/borrow/agree";
		var param = "id="+$("#borrowId").val()+"&type="+$("#pay_status").val();
		submitAjaxData(url,param,function(data){
			LoadAjaxContent('${pageContext.request.contextPath}/view/playrecord_info','wrapper');
		});
	}
</script>