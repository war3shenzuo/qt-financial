<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>清投金服</a></li>
	<li class="active">客户分组管理</li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">客户分组管理 </header>
			<div class="panel-body">
				<div class="clearfix">
					<div class="btn-group pull-right">
						<button id="" class="btn btn-success"
							onclick="LoadAjaxContent('${pageContext.request.contextPath}/view/group_add','wrapper')">
							新增客户分组 <i class="fa fa-plus"></i>
						</button>
					</div>
				</div>
				<table class="display table table-bordered table-striped"
					id="dynamic-table">
					<thead>
						<tr>
							<th>客户分组</th>
							<th>分组说明</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="content">
						<tr>
							<td>拒绝客户</td>
							<td>直接拒绝</td>
							<td><a href="javascript:void(0)"
								onclick="LoadAjaxContent('${pageContext.request.contextPath}/view/group_edit', 'wrapper');">编辑</a>
							</td>
						</tr>
						<tr>
							<td>黑名单</td>
							<td>直接拒绝</td>
							<td><a href="javascript:void(0)"
								onclick="LoadAjaxContent('${pageContext.request.contextPath}/view/group_edit', 'wrapper');">编辑</a>
							</td>
						</tr>
						<tr>
							<td>普通客户</td>
							<td>该类客户正常审核即可</td>
							<td><a href="javascript:void(0)"
								onclick="LoadAjaxContent('${pageContext.request.contextPath}/view/group_edit', 'wrapper');">编辑</a>
							</td>
						</tr>
						<tr>
							<td>特约客户</td>
							<td></td>
							<td><a href="javascript:void(0)"
								onclick="LoadAjaxContent('${pageContext.request.contextPath}/view/group_edit', 'wrapper');">编辑</a>
							</td>
						</tr>
						<tr>
							<td>可以发展为特约客户的分组</td>
							<td></td>
							<td><a href="javascript:void(0)"
								onclick="LoadAjaxContent('${pageContext.request.contextPath}/view/group_edit', 'wrapper');">编辑</a>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<th>客户分组</th>
							<th>分组说明</th>
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

<script type="text/javascript">
	$(document).ready(function() {
		scrollTo(0,0);
		var url = "${pageContext.request.contextPath}/data/group/all";
		LoadAjaxData(url, loadGroupInfo);
	});
	function loadGroupInfo(data){
		try{
			console.log(data);
			var htmlStr = "";
			var list = data.objList;
			for(var i = 0;i<list.length;i++){
				htmlStr += '<tr>'
					+'<td>'+list[i].name+'</td>'
					+'<td>'+list[i].description+'</td>'
					+'<td>'
					+'<a href="javascript:void(0)" onclick="LoadAjaxContent(\'${pageContext.request.contextPath}/view/group_edit?id='+list[i].id+'\', \'wrapper\');">编辑</a>'
					+'</td>'
					+'</tr>';
			}
			$('#dynamic-table').dataTable();
		} catch(arr){
			console.log(arr);
		}
	}
	
</script>
