<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>清投金服</a></li>
	<li><a href="javascript:void(0)" onclick="LoadAjaxContent('${pageContext.request.contextPath}/view/coupon_info', 'wrapper');">优惠券管理</a></li>
	<li class="active">查看优惠码</li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">查看优惠码 </header>
			<div class="panel-body">
				<div class="clearfix">
					<div class="col-sm-2" style="padding-left: 0;">
	                    <select id="coupon_receive_choice" name="coupon_receive_choice">
							<option value="">选择领取状态</option>
						</select>
	                </div>
	                <div class="col-sm-2" style="padding-left: 0;">
	                    <select id="coupon_use_choice" name="coupon_use_choice">
							<option value="">选择使用状态</option>
						</select>
	                </div>
                </div>
				<table class="display table table-bordered table-striped"
					id="dynamic-table">
					<thead>
						<tr>
							<th>码体</th>
							<th>领取客户id</th>
							<th>领取状态</th>
							<th>使用状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>211331122131</td>
							<td>111313112a</td>
							<td>已经领取</td>
							<td>已经使用</td>	
							<td>
								<a href="javascript:void(0)" onclick="">复制码体</a>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<th>码体</th>
							<th>领取客户id</th>
							<th>领取状态</th>
							<th>使用状态</th>
							<th>操作</th>
						</tr>
					</tfoot>
				</table>
			</div>
		</section>
	</div>
</div>

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
		Select2Test();
	});
	function Select2Test() {
		$("#coupon_receive_choice").select2();
		$("#coupon_use_choice").select2();
	}
	
</script>
