<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>清投金服</a></li>
	<li class="active">等待打款</li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">等待打款 </header>
			<div class="panel-body">
				<table class="display table table-bordered table-striped"
					id="dynamic-table">
					<thead>
						<tr>
							<th>时间</th>
							<th>订单编号</th>
							<th>客户名称</th>
							<th>客户手机</th>
							<th>客户等级</th>
							<th>客户状态</th>
							<th>初审结果</th>
							<th>复审结果</th>
							<th>终审结果</th>
							<th>打款情况</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="content">
						<tr>
							<td>2017-07-30</td>
							<td>124154635478</td>
							<td>张某某</td>
							<td>13812345678</td>
							<td>白银</td>
							<td>高级</td>
							<td>同意</td>
							<td>同意</td>
							<td>同意打款</td>
							<td>未打款</td>
							<td>
								<a href="javascript:void(0)" onclick="LoadAjaxContent('${pageContext.request.contextPath}/view/playmoney_detail', 'wrapper');">订单情况</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#" onclick="">终审</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#" onclick="">打款</a>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<th>时间</th>
							<th>订单编号</th>
							<th>客户名称</th>
							<th>客户手机</th>
							<th>客户等级</th>
							<th>客户状态</th>
							<th>初审结果</th>
							<th>复审结果</th>
							<th>终审结果</th>
							<th>打款情况</th>
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
		var url = "${pageContext.request.contextPath}/data/all?borrowType=3r";
		LoadAjaxData(url, loadBorrowList);
	});
	function loadBorrowList(data){
		try{
			console.log(data);
			var list = data.objList;
			var htmlStr = "";
			for(var i= 0;i<list.length;i++){
				htmlStr += '<tr><td>2017-07-30</td>'
				+'<td>'+list[i].id+'</td>'
				+'<td>'+list[i].userId+'</td>'
				+'<td>15768731245</td>'
				+'<td>白银</td>'
				+'<td>正常</td>'
				+'<td>同意</td>'
				+'<td>同意</td>'
				+'<td>同意</td>'
				+'<td>未打款</td>'
				+'<td><a href="javascript:void(0)" onclick="LoadAjaxContent(\'${pageContext.request.contextPath}/view/playmoney_detail\', \'wrapper\');">订单情况</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#" onclick="">终审</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#" onclick="payMoney(\''+list[i].id+'\')">打款</a></td></tr>'
				;
			}
			$("#content").html(htmlStr);
		} catch(arr){
			console.log(data);
		}
	}
	function payMoney(id){
		var url = "${pageContext.request.contextPath}/data/borrow/agree";
		var param = "id="+id+"&type=4r";
		submitAjaxData(url,param,function(data){
			LoadAjaxContent('${pageContext.request.contextPath}/view/playmoney_info','wrapper');
		});
	}
</script>
