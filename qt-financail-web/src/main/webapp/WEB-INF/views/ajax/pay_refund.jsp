<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>慢病mlnx专用</a></li>
	<li class="active">退款审核</li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">
				<i class="fa fa-tags"></i> 退款审核
			</header>
			<div class="panel-body">
				<div class="adv-table">
					<table class="display table table-bordered table-striped"
						id="dynamic-table">
						<thead>
							<tr>
								<th>编号</th>
								<th>交易号</th>
								<th>金额</th>
								<th>账号类型</th>
								<th>状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="content">
						</tbody>
						<tfoot>
							<tr>
								<th>编号</th>
								<th>交易号</th>
								<th>金额</th>
								<th>账号类型</th>
								<th>状态</th>
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
						var sAjaxSource = "${ctx}/data/refund_info";
						$('#dynamic-table')
								.dataTable(
										{
											"bProcessing" : true,
											"bServerSide" : true,
											"aaSorting" : [ [ 4, "desc" ] ],
											"sAjaxSource" : sAjaxSource,
											"fnServerData" : retrieveData, // 获取数据的处理函数, 
											"oLanguage" : {
												"sPlaceholder" : "编号/交易号/金额/账号类型(0或1)"
											},
											//列表表头字段
											"aoColumns" : [
													{
														"mData" : "id"
													},
													{
														"mData" : "tradeNo"
													},
													{
														"mData" : "total"
													},
													{
														"mData" : "accountType"
													},
													{
														"mData" : "state",
														"mRender" : function(
																data, type,
																full) {
															var str = "";
															if (data == "0") {
																str = "退款中";
															}
															if (data == "1") {
																str = "退款成功";
															}
															return str;
														}
													},
													{
														"mData" : "id",
														"mRender" : function(
																data, type,
																full) {
															var str = "<a href='#' onclick='checkRefund("
																	+ data
																	+ ")'>确认退款</a>";
															if (full.state == 1) {
																str = "已退款";
															}
															return str;
														}
													} ]
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
					});

	function checkRefund(id) {
		console.log(id);
		var url = "${ctx}/data/check_refund";
		var param = "id=" + id;
		submitAjaxData(url, param, function(data) {
			if (data.responseCode == "200") {
				$("#info_type").attr('src',
						'${ctx}/common/img/admin/icon_success.jpg');
				$("#info_msg").html("请确认是否已通过企业支付宝发起退款！！！记录已修改成功~");
			} else {
				$("#info_type").attr('src',
						'${ctx}/common/img/admin/icon_error.jpg');
				$("#info_msg").html("修改记录失败，请及时通知管理员！");
			}
			$("#myModal_info_button").on("click", function() {
				LoadAjaxContent('pay_refund', 'wrapper');
			});
			$("#myModal_info").modal("show");
		});
	}
</script>