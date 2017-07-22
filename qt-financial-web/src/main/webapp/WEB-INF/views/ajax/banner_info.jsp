<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>清投金服</a></li>
	<li class="active">banner管理</li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">banner管理 </header>
			<div class="panel-body">
				<div class="clearfix">
					<div class="btn-group pull-right">
						<button id="" class="btn btn-success"
							onclick="LoadAjaxContent('${pageContext.request.contextPath}/view/banner_add','wrapper')">
							新增banner <i class="fa fa-plus"></i>
						</button>
					</div>
				</div>
				<table class="display table table-bordered table-striped"
					id="dynamic-table">
					<thead>
						<tr>
							<th>图片</th>
							<th>链接</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="content">
					</tbody>
					<tfoot>
						<tr>
							<th>图片</th>
							<th>链接</th>
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
	$(document)
			.ready(
					function() {
						scrollTo(0, 0);
						var url = "${pageContext.request.contextPath}/data/getBanner";
						LoadAjaxData(url, loadData);
						function loadData(data) {
							try {
								var htmlStr = '';
								for (var i = 0; i < data.objList.length; i++) {
									htmlStr += '<tr>'
											+ '<td><img src="${img_url}' 
											+ data.objList[i].pic
											+ '"></td>'
											+ '<td>'
											+ data.objList[i].url
											+ '</td>'
											+ '<td><a href="#" onclick="editBanner('
											+ data.objList[i].id
											+ ')">编辑</a>&nbsp;&nbsp;<a href="#" onclick="deleteBanner('
											+ data.objList[i].id
											+ ')">删除</a></td>' 
											+ '</tr>';
								}
								$("#content").html(htmlStr);
							    $('#dynamic-table').dataTable();
							} catch (arr) {
								console.log(arr);
							}

						}
					});
	
	function editBanner(id){
		LoadAjaxContent('banner_edit?id='+id,'wrapper')
	}
	
	function deleteBanner(id){
		var url = "${pageContext.request.contextPath}/data/banner/delete";
		var param = "id="+id;
		submitAjaxData(url, param, function(data){
			LoadAjaxContent('banner_info','wrapper');
		});
	}
</script>
