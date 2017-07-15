<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>清投金服</a></li>
	<li class="active">优惠券管理</li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">优惠券管理 </header>
			<div class="panel-body">
				<div class="clearfix">
					<div class="btn-group pull-right">
						<button id="" class="btn btn-success"
							onclick="LoadAjaxContent('${pageContext.request.contextPath}/view/coupon_add','wrapper')">
							新增优惠券 <i class="fa fa-plus"></i>
						</button>
					</div>
				</div>
				<table class="display table table-bordered table-striped"
					id="dynamic-table">
					<thead>
						<tr>
							<th>批号</th>
							<th>券面金额</th>
							<th>优惠券数量</th>
							<th>优惠券描述</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>002</td>
							<td>-10</td>
							<td>100</td>
							<td>新用户10元券</td>
							<td>使用中</td>
							<td>
								<a href="javascript:void(0)" onclick="LoadAjaxContent('${pageContext.request.contextPath}/view/couponcode_info', 'wrapper');">查看优惠码</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="javascript:void(0)" onclick="LoadAjaxContent('${pageContext.request.contextPath}/view/coupon_edit', 'wrapper');">编辑</a>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<th>批号</th>
							<th>券面金额</th>
							<th>优惠券数量</th>
							<th>优惠券描述</th>
							<th>状态</th>
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
		
	});
	
</script>
