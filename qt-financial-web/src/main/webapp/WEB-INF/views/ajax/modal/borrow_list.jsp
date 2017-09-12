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
<!-- 借款记录模态框（Modal） -->
<div aria-hidden="false" aria-labelledby="borrowListLabel" role="dialog"
	tabindex="-1" id="borrowList" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button aria-hidden="true" data-dismiss="modal" class="close"
					type="button">关闭</button>
				<span class="modal-title">借款记录</span>
				<select
					id="examine_choice_people" name="examine_choice_people">
					<option value="">审核信息</option>
					<option value="">审核通过</option>
					<option value="">审核未通过</option>
				</select>
			</div>
			<div class="modal-body">
				<table class="table table-bordered">
					<caption>共2笔</caption>
					<tbody>
						<tr>
							<td>借款时间</td>
							<td>xxxx</td>
						</tr>
						<tr>
							<td>借款金额</td>
							<td>1000</td>
						</tr>
						<tr>
							<td>申请操作员</td>
							<td>王丽</td>
						</tr>
						<tr>
							<td>打款时间</td>
							<td>xxx</td>
						</tr>
						<tr>
							<td>打款金额</td>
							<td>920</td>
						</tr>
						<tr>
							<td>应还款</td>
							<td>1140</td>
						</tr>
						<tr>
							<td>还款时间</td>
							<td>xxx</td>
						</tr>
						<tr>
							<td>延期操作</td>
							<td>2次</td>
						</tr>
						<tr>
							<td>逾期</td>
							<td>2次</td>
						</tr>
						<tr>
							<td>共计还款</td>
							<td>（客户支付总金额）</td>
						</tr>
						<tr>
							<td>订单记录</td>
							<td><a href="#" onclick="openBorrowInfo(id)">查看详情</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 模态框（Modal） -->

<script>
function openBorrowInfo(id){
	$("#borrowList").modal("hide");
	setTimeout(function(){
		var url = "${pageContext.request.contextPath}/view/borrow_info";
		LoadAjaxContent(url, "wrapper");
	},300);
	
}
</script>