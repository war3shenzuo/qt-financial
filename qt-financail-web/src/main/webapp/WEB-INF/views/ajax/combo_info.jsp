<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>慢病mlnx专用</a></li>
	<li class="active">制定套餐</li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">
				<i class="fa fa-list-ol"></i> 套餐信息
			</header>
			<div class="panel-body">
				<div class="clearfix">
					<div class="btn-group" style="font-size: 18px;">目前已有套餐：3个</div>
					<div class="btn-group pull-right">
						<button id="" class="btn btn-success"
							onclick="LoadAjaxContent('${pageContext.request.contextPath}/mlnx/combo_add','wrapper')">
							新增套餐 <i class="fa fa-plus"></i>
						</button>
					</div>
				</div>
				<div class="adv-table">
					<table class="display table table-bordered table-striped"
						id="dynamic-table">
						<thead>
							<tr>
								<th class="col-md-2">套餐名称</th>
								<th class="col-md-5">套餐内容</th>
								<th class="col-md-2">使用人群</th>
								<th class="col-md-2">套餐价格</th>
								<th class="col-md-1">操作</th>
							</tr>
						</thead>
						<tbody id="content">
<%-- 							<c:forEach items="${combos}" var="combo"> --%>
<!-- 								<tr> -->
<%-- 									<td>${combo.name}</td> --%>
<%-- 									<td>${combo.content}</td> --%>
<%-- 									<td>${combo.adaptGroup}</td> --%>
<%-- 									<td>${combo.price}</td> --%>
<!-- 									<td><a href="#" -->
<%-- 										onclick="javacript:LoadAjaxContent('${pageContext.request.contextPath}/mlnx/combo_edit?id=${combo.id}','wrapper')">编辑</a>|<a --%>
<!-- 										href="#" -->
<%-- 										onclick="javacript:LoadAjaxContent('${pageContext.request.contextPath}/mlnx/combo_delete?id=${combo.id}','wrapper')">删除</a></td> --%>
<!-- 								</tr> -->
<%-- 							</c:forEach> --%>
						</tbody>
						<tfoot>
							<tr>
								<th>套餐名称</th>
								<th>套餐内容</th>
								<th>使用人群</th>
								<th>套餐价格</th>
								<th>操作</th>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</section>
		<!--notification end-->
	</div>
</div>
<!-- 模态框（Modal） -->
<div aria-hidden="false" aria-labelledby="myModalLabel" role="dialog"
	tabindex="-1" id="myModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button aria-hidden="true" data-dismiss="modal" class="close"
					type="button">×</button>
				<h4 class="modal-title" id="myModalLabel">提示</h4>
			</div>
			<div class="modal-body" id="message">${param.message}</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>
<!-- 模态框（Modal） -->

<script type="text/javascript">
	$(document).ready(function() {
		var url = "${pageContext.request.contextPath}/data/getCombos";
		LoadAjaxData(url, loadComboInfo);
	});
	function loadComboInfo(data) {
		try {
			console.log(data);
			var htmlStr = "";
			var dataList = data.objList;
			for (var i = 0; i < dataList.length; i++) {
				htmlStr += '<tr>'
						+ '<td>'
						+ dataList[i].name
						+ '</td>'
						+ '	<td>'
						+ dataList[i].content
						+ '</td>'
						+ '<td>'
						+ dataList[i].adaptGroup
						+ '</td>'
						+ '<td>'
						+ dataList[i].price
						+ '</td>'
						+ '<td><a href="#"'
						+ '	onclick="javacript:LoadAjaxContent(\'${pageContext.request.contextPath}/mlnx/combo_edit?id='
						+ dataList[i].id
						+ '\',\'wrapper\')">编辑</a>|<a'
						+ '	href="#"'
						+ 'onclick="javacript:LoadAjaxContent(\'${pageContext.request.contextPath}/mlnx/combo_delete?id='
						+ dataList[i].id + '\',\'wrapper\')">删除</a></td>'
						+ '</tr>';
			}
			$("#content").html(htmlStr);

			$('#dynamic-table').dataTable( {
		        "aaSorting": [[ 4, "desc" ]]
		    } );
		} catch (arr) {
			console.log(arr);
		}
	}
</script>