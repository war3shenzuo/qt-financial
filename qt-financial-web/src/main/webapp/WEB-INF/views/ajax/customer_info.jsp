<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>清投金服</a></li>
	<li class="active">客户管理</li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">客户管理 </header>
			<div class="panel-body">
				<table class="display table table-bordered table-striped"
					id="dynamic-table">
					<thead>
						<tr>
							<th>客户名称</th>
							<th>联系方式</th>
							<th>客户等级</th>
							<th>客户类型</th>
							<th>借款状态</th>
							<th>逾期记录</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>赵某某</td>
							<td>15945678932</td>
							<td>白银</td>
							<td>未认证客户</td>
							<td>在借中</td>
							<td>有逾期记录</td>
							<td>
								<a href="javascript:void(0)" onclick="LoadAjaxContent('${pageContext.request.contextPath}/view/customer_detail', 'wrapper');">客户信息</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#" onclick="showBorrowList()">借款记录</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#" onclick="customer_edit()">客户设置</a>
							</td>
						</tr>
						<tr>
							<td>钱某某</td>
							<td>15945678932</td>
							<td>黄金</td>
							<td>认证客户</td>
							<td>逾期</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>孙某某</td>
							<td>15945678932</td>
							<td>钻石</td>
							<td>高级客户</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>李某某</td>
							<td>15945678932</td>
							<td></td>
							<td>高危客户</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<th>客户名称</th>
							<th>联系方式</th>
							<th>客户等级</th>
							<th>客户类型</th>
							<th>借款状态</th>
							<th>逾期记录</th>
							<th>操作</th>
						</tr>
					</tfoot>
				</table>
			</div>
		</section>
	</div>
</div>

<div id="borrow_list"></div>
<div aria-hidden="false" aria-labelledby="authIdLabel" role="dialog"
	tabindex="-1" id="apply_again" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button aria-hidden="true" data-dismiss="modal" class="close"
					type="button">×</button>
				<h4 class="modal-title">客户设置</h4>
			</div>
			<div class="modal-body">
				<form class="cmxform form-horizontal adminex-form" role="form"
					method="POST" id="applyForm" action="">
					<div class="form-group">
                        <label class="col-sm-4 col-sm-4 control-label">设置客户类型：</label>
                        <div class="col-sm-6">
                            <select id="customer_edit" name="customer_edit">
								<option value="">未认证客户</option>
								<option value="">认证客户</option>
								<option value="">高级客户</option>
								<option value="">高危客户</option>
							</select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-offset-3 col-lg-10">
                        	<button class="btn btn-default" data-dismiss="modal" style="padding: 6px 50px;">取消</button>
							<button class="btn btn-primary" type="submit" style="padding: 6px 50px;">提交</button>
						</div>
                    </div>
				</form>
			</div>
		</div>
	</div>
</div>
<script src="${ctx}/common/js/index_info.js"></script>
<!--dynamic table-->
<script type="text/javascript"
	src="${ctx}/common/js/advanced-datatable/js/jquery.dataTables.js"></script>
<script type="text/javascript"
	src="${ctx}/common/js/data-tables/DT_bootstrap.js"></script>

<!--dynamic table initialization -->
<script src="${ctx}/common/js/dynamic_table_init.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		scrollTo(0,0);
		var url = "${pageContext.request.contextPath}/view/modal/borrow_list";
		LoadAjaxContent(url, "borrow_list");
		Select2Test();
	});
	function customer_edit(){
		$("#apply_again").modal("show");
	}
	function Select2Test() {
		$("#customer_edit").select2();
	}
</script>
