<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>清投金服</a></li>
	<li class="active">CEO留言管理</li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">CEO留言管理 </header>
			<div class="panel-body">
				<table class="display table table-bordered table-striped"
					id="dynamic-table">
					<thead>
						<tr>
							<th>留言内容</th>
							<th>留言客户id</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>请问这个到底怎么操作呢？客服电话是多少？</td>
							<td>111313112a</td>
							<td>
								<a href="javascript:void(0)" onclick="">删除</a>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<th>留言内容</th>
							<th>留言客户id</th>
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
