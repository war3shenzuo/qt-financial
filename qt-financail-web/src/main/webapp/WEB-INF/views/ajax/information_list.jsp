<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>慢病mlnx专用</a></li>
	<li class="active">百科列表</li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">
				<i class="fa fa-plus-square"></i> 百科信息
			</header>
			<div class="panel-body">
				<div class="adv-table">
					<div class="clearfix">
						<div class="btn-group" style="font-size: 18px;">资讯</div>
						<div class="btn-group pull-right">
							<button id="" class="btn btn-success"
								onclick="javacript:LoadAjaxContent('${pageContext.request.contextPath}/mlnx/own_information_add','wrapper')">
								新增百科 <i class="fa fa-plus"></i>
							</button>
						</div>
					</div>
					<table class="display table table-bordered table-striped"
						id="dynamic-table"
						style="TABLE-LAYOUT: fixed; WORD-BREAK: break-all">
						<thead>
							<tr>
								<th>百科标题</th>
								<th>概要</th>
								<th>发布时间</th>
								<th>来源</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
						<tfoot>
							<tr>
								<th>百科标题</th>
								<th>概要</th>
								<th>发布时间</th>
								<th>来源</th>
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


<script type="text/javascript">
	$(document)
			.ready(
					function() {
						Select2Test();
						$('#dynamic-table')
								.dataTable(
										{
											"bProcessing" : true,
											"bServerSide" : true,
											"aaSorting" : [ [ 2, "desc" ] ],
											"sAjaxSource" : "${ctx}/data/information_list",
											"fnServerData" : retrieveData, // 获取数据的处理函数, 
											//列表表头字段
											"aoColumns" : [
													{
														"mData" : "title"
													},
													{
														"mData" : "summary"
													},
													{
														"mData" : "publishTime",
														"mRender" : function(
																data, type,
																full) {
															var currentDate = new Date(full.publishTime);
															var day = currentDate.getDate();
															var month = currentDate.getMonth() + 1;
															var year = currentDate.getFullYear();
															var publish_time = year + '-' + month + '-' + day;
															return publish_time;
														}
															
													},
													{
														"mData" : "type"
													},
													{
														"mData" : "id",
														"mRender" : function(
																data, type,
																full) {
															var str = '<a href="#" onclick="winOpen('+data+')">预览</a> | <a '
																	+ '					href="#" '
																	+ '						onclick="javacript:LoadAjaxContent(\'${pageContext.request.contextPath}/mlnx/own_information_edit?id='+data+'\',\'wrapper\')">修改</a> '
																	+ '							| <a href="#" onclick="deleteNews('+data+')">删除</a>';
															return str;
														}
													} ]

										});
					});
	// 3个参数的名字可以随便命名,但必须是3个参数,少一个都不行
	function retrieveData(sSource111, aoData111, fnCallback111) {
		$.ajax({
			url : sSource111,//这个就是请求地址对应sAjaxSource
			data : {
				"aoData" : JSON.stringify(aoData111)
			},//这个是把datatable的一些基本数据传给后台,比如起始位置,每页显示的行数
			type : 'post',
			dataType : 'json',
			async : true,
			success : function(result) {
				fnCallback111(result);//把返回的数据传给这个方法就可以了,datatable会自动绑定数据的
			},
			error : function(msg) {
				console.error("retrieveData:"+msg);
			}
		});
	}
	function Select2Test() {
		$("#selecttype").select2();
		$("#integraltype").select2();
	}
	function winOpen(id) {
		window
				.open(
						'${pageContext.request.contextPath}/mlnx/own_information_detail?id='
								+ id,
						'',
						'height=568, width=320, top=0, left=550, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no');
	}
	function deleteNews(id) {
		var url = "${ctx}/data/information_delete_json?id=" + id;
		$.ajax({
			url : url,
			type : 'POST',
			success : function(data) {
				LoadAjaxContent('information_list', 'wrapper');
				console.log("操作成功");
			},
			error : function(jqXHR, textStatus, errorThrown) {
				console.error("加载出错");
			},
			dataType : "html",
			async : true
		});
	}
</script>