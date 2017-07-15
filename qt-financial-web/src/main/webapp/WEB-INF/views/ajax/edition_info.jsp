<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>清投金服</a></li>
	<li class="active">版本管理</li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">版本管理 </header>
			<div class="panel-body">
				<div class="clearfix">
					<div class="btn-group pull-right">
						<button id="" class="btn btn-success"
							onclick="LoadAjaxContent('${pageContext.request.contextPath}/view/edition_add','wrapper')">
							新增版本 <i class="fa fa-plus"></i>
						</button>
					</div>
				</div>
				<table class="display table table-bordered table-striped"
					id="dynamic-table">
					<thead>
						<tr>
							<th>平台</th>
							<th>版本号</th>
							<th>更新提醒</th>
							<th>版本更新说明</th>
							<th>描述</th>
							<th>创建日期</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>iOS</td>
							<td>1.0.0</td>
							<td>强制更新</td>
							<td>版本修复了一些bug</td>
							<td>这是第一个版本</td>
							<td>2017-07-23</td>
							<td>
								<a href="javascript:void(0)" onclick="LoadAjaxContent('${pageContext.request.contextPath}/view/edition_edit', 'wrapper');">编辑</a>
							</td>
						</tr>
						<tr>
							<td>android</td>
							<td>1.0.0</td>
							<td>提醒更新</td>
							<td>版本修复了一些bug</td>
							<td>这是第一个版本</td>
							<td>2017-07-23</td>
							<td>
								<a href="javascript:void(0)" onclick="LoadAjaxContent('${pageContext.request.contextPath}/view/edition_edit', 'wrapper');">编辑</a>
							</td>
						</tr>
						<tr>
							<td>android</td>
							<td>1.0.0</td>
							<td>无更新提醒</td>
							<td>版本修复了一些bug</td>
							<td>这是第一个版本</td>
							<td>2017-07-23</td>
							<td>
								<a href="javascript:void(0)" onclick="LoadAjaxContent('${pageContext.request.contextPath}/view/edition_edit', 'wrapper');">编辑</a>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<th>平台</th>
							<th>版本号</th>
							<th>更新提醒</th>
							<th>版本更新说明</th>
							<th>描述</th>
							<th>创建日期</th>
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
