<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>清投金服</a></li>
	<li class="active">活动管理</li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">活动管理 </header>
			<div class="panel-body">
				<div class="clearfix">
					<div class="btn-group pull-right">
						<button id="" class="btn btn-success"
							onclick="LoadAjaxContent('${pageContext.request.contextPath}/view/event_add','wrapper')">
							新增活动<i class="fa fa-plus"></i>
						</button>
					</div>
				</div>
				<table class="display table table-bordered table-striped"
					id="dynamic-table">
					<thead>
						<tr>
							<th>活动名称/th>
							<th>使用状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="content">
						<tr>
							<td>送红包</td>
							<td>使用中</td>
							<td>
								<a href="javascript:void(0)" onclick="LoadAjaxContent('${pageContext.request.contextPath}/view/event_edit', 'wrapper');">编辑</a>
							</td>
						</tr>
						<tr>
							<td>端午节活动</td>
							<td>已结束</td>
							<td>
								<a href="javascript:void(0)" onclick="LoadAjaxContent('${pageContext.request.contextPath}/view/event_edit', 'wrapper');">编辑</a>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<th>活动名称/th>
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
		var url ="${pageContext.request.contextPath}/data/activity/all";
		LoadAjaxData(url,loadData);
		function loadData(data){
			try{
				console.log(data);
				var htmlStr = '';
				for(var i = 0 ;i < data.objList.length;i++){
					htmlStr+='<tr>'
						+'<td>'+data.objList[i].name+'</td>'
						+'<td>'+data.objList[i].activated+'</td>'
						+'<td>'
						+'	<a href="javascript:void(0)" onclick="LoadAjaxContent(\'${pageContext.request.contextPath}/view/event_edit?id='+data.objList[i].id+'\', \'wrapper\');">编辑</a>'
						+'</td>'
						+'</tr>';
				}
				$("#content").html(htmlStr);
			} catch(arr){
				console.log(arr);
			}
		}
	});
	
</script>
