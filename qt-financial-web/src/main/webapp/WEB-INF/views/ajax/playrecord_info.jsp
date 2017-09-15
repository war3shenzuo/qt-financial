<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>清投金服</a></li>
	<li class="active">审核记录</li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">审核记录 </header>
			<div class="panel-body">
				<div class="clearfix">
					<div class="col-sm-3">
						<select id="examine_choice_time" name="examine_choice_time">
							<option value="">选择打款结果</option>
							<option value="">已打款</option>
							<option value="">未打款</option>
						</select>
					</div>
				</div>
				<table class="display table table-bordered table-striped"
					id="dynamic-table">
					<thead>
						<tr>
							<th>订单编号</th>
							<th>客户姓名</th>
							<th>客户手机</th>
							<th>打款情况</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
					<tfoot>
						<tr>
							<th>订单编号</th>
							<th>客户姓名</th>
							<th>客户手机</th>
							<th>打款情况</th>
							<th>操作</th>
						</tr>
					</tfoot>
				</table>
			</div>
		</section>
	</div>
</div>
<div id="pay"></div>
<!--dynamic table-->
<script type="text/javascript"
	src="${ctx}/common/js/advanced-datatable/js/jquery.dataTables.js"></script>
<script type="text/javascript"
	src="${ctx}/common/js/data-tables/DT_bootstrap.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		scrollTo(0, 0);
		Select2Test();
		var sAjaxSource = "${pageContext.request.contextPath}/data/borrow/all/pay";
		$('#dynamic-table').dataTable({
			"bProcessing" : true,
			"bServerSide" : true,
			"aaSorting" : [ [ 4, "desc" ] ],
			"sAjaxSource" : sAjaxSource,
			"fnServerData" : retrieveData, // 获取数据的处理函数, 
			"oLanguage" : {
				"sPlaceholder" : ""
			},
			//列表表头字段
			"aoColumns" : [ {
				"mData" : "id"
			}, {
				"mData" : "user",
				"mRender" : function(data, type, full) {
					if(data==null){
						return "未填写";
					}
					var str = data.truename;
					return str;
				}
			}, {
				"mData" : "user",
				"mRender" : function(data, type, full) {
					if(data==null){
						return "未填写";
					}
					var str = data.usermobile;
					return str;
				}
			},
			 {
				"mData" : "borrowMoneyFlow",
				"mRender" : function(data, type, full) {
					for(var i=0;i<data.length;i++){
						if(data[i].status == '5r'){
							return "已打款";
						}
						if(data[i].status == '5e'){
							return "未打款";
						}
					}
					return "无";
				}
			},{
				"mData" : "id",
				"mRender" : function(data, type, full) {
					var str = '<a href="javascript:void(0)" onclick="LoadAjaxContent(\'${pageContext.request.contextPath}/view/record_detail?id='+data+'\', \'wrapper\');">查看订单</a>';
						str += '&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#" onclick="showPay(\''+data+'\')">打款</a>';
					return str;
				}
			}]
		});
		
		LoadAjaxContent("${pageContext.request.contextPath}/view/modal/pay", "pay");
	});

	// 3个参数的名字可以随便命名,但必须是3个参数,少一个都不行
	function retrieveData(sSource, aoData, fnCallback) {
		$.ajax({
			url : sSource,//这个就是请求地址对应sAjaxSource
			data : {
				"aoData" : JSON.stringify(aoData)
			},//这个是把datatable的一些基本数据传给后台,比如起始位置,每页显示的行数
			type : 'post',
			dataType : 'json',
			async : false,
			success : function(result) {
				fnCallback(result);//把返回的数据传给这个方法就可以了,datatable会自动绑定数据的
			},
			error : function(msg) {
				console.error("retrieveData:" + msg);
			}
		});
	}
	function Select2Test() {
		$("#examine_choice_time").select2();
	}
	function showPay(id){
		$("#payModal").modal("show");
		console.log(id);
	}
</script>
