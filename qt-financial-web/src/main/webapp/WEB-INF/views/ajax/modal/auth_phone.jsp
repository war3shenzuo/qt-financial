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
				<h4 class="modal-title">手机认证</h4>
			</div>
			<div class="modal-body">
				<table class="table table-bordered">
					<caption>手机信息</caption>
					<tbody>
						<tr>
							<td>手机号</td>
							<td>13711232145</td>
						</tr>
					</tbody>
				</table>
				<table class="table table-bordered">
					<caption>认证时间</caption>
					<tbody>
						<tr>
							<td>提交时间</td>
							<td>2017-06-26 14:11</td>
						</tr>
						<tr>
							<td>通过时间</td>
							<td>2017-06-26 14:11</td>
						</tr>
						<tr>
							<td>操作人</td>
							<td>无</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 模态框（Modal） -->