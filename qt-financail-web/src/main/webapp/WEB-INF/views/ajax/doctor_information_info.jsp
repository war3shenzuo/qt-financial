<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>慢病mlnx专用</a></li>
	<li class="active">医生百科审核</li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">
				<i class="fa fa-plus-square"></i> 医生百科信息
			</header>
			<div class="panel-body">
				<div class="adv-table">
					<table class="display table table-bordered table-striped"
						id="dynamic-table"
						style="TABLE-LAYOUT: fixed; WORD-BREAK: break-all">
						<thead>
							<tr>
								<th>医生头像名字</th>
								<th>百科标题</th>
								<th>概要</th>
								<th>发布时间</th>
								<th>详情</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
<%-- 							<c:forEach items="${map['InformationVo']}" var="news"> --%>
<%-- 								<c:if test="${news.userName!=null}"> --%>
<!-- 									<tr> -->
<!-- 										<td><a class="example-image-link" -->
<%-- 											data-lightbox="example-set1" href="${img_url}${news.userPic}" --%>
<%-- 											title="${news.userName}"><img --%>
<%-- 												src="${img_url}${doctor.userPic}" alt="头像" --%>
<%-- 												onerror="this.src='${pageContext.request.contextPath}/common/img/no_pic200.png'" --%>
<%-- 												style="width: 40px; height: auto;" /></a>${news.userName}</td> --%>
<%-- 										<td>${news.title}</td> --%>
<%-- 										<td>${news.summary}</td> --%>
<%-- 										<td><fmt:formatDate value='${news.publishTime}' --%>
<%-- 												pattern='yyyy-MM-dd' /></td> --%>
<!-- 										<td style="text-align: center;"><a href="#" -->
<%-- 											onclick="winOpen(${news.id})">查看</a></td> --%>
<%-- 										<c:if test="${news.valid==null}"> --%>
<!-- 											<td><a href="#" -->
<%-- 												onclick="update(${news.id},'${news.valid}')">通过</a>|<a --%>
<%-- 												href="#" onclick="refuse(${news.id},'${news.valid}')">拒绝</a></td> --%>
<%-- 										</c:if> --%>
<%-- 										<c:if test="${news.valid==1}"> --%>
<!-- 											<td>已通过</td> -->
<%-- 										</c:if> --%>
<%-- 										<c:if test="${news.valid==2}"> --%>
<!-- 											<td>已拒绝</td> -->
<%-- 										</c:if> --%>
<!-- 									</tr> -->
<%-- 								</c:if> --%>
<%-- 							</c:forEach> --%>
						</tbody>
						<tfoot>
							<tr>
								<th>医生头像名字</th>
								<th>百科标题</th>
								<th>概要</th>
								<th>发布时间</th>
								<th>详情</th>
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
<!--dynamic table initialization -->
<script src="${ctx}/common/js/dynamic_table_init.js"></script>

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
								"sAjaxSource" : "${ctx}/data/information_doctor_list",
								"fnServerData" : retrieveData, // 获取数据的处理函数, 
								//列表表头字段
								"aoColumns" : [
										{   "mData":"userId",
											"mRender":function(data,type,full){
												return data;
											}
										},
										{
											"mData" : "title",
										},
										{
											"mData" : "summary",
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
											},
												
										},
										{
											"mData" : "type",
										},
										{
											"mData" : "id",
											"mRender" : function(
													data, type,
													full) {
												var str = '<a href="#" onclick="winOpen('+data+')">预览</a> | <a '
														+ '					href="#" '
														+ '						onclick="javacript:LoadAjaxContent(\'${pageContext.request.contextPath}/data/own_information_edit?id='+data+'\',\'wrapper\')">公开</a> ';
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
function winOpen(id){
	window.open ('${pageContext.request.contextPath}/mlnx/own_information_detail?id='+id, '', 'height=568, width=320, top=0, left=550, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no');
}

//审核js
// function update(id,el,state){
// 	$.ajax({
// 		 type: "POST",
// 		 url: "${pageContext.request.contextPath}/mlnx/info_update",
// 		 data:"id="+id+"&state="+state,
// 		 context: el,
// 		 success: function(result){
// 			 $(this).parent().html("已通过");
// 			 LoadAjaxContent('doctor_information_info','wrapper'); 
//     	 }
//       });
// }
//拒绝js
// function refuse(id,el,state){
// 	$.ajax({
// 		 type: "POST",
// 		 url: "${pageContext.request.contextPath}/mlnx/info_refuse",
// 		 data:"id="+id+"&state="+state,
// 		 context: el,
// 		 success: function(result){
// 			 $(this).parent().html("已拒绝");
// 			 LoadAjaxContent('doctor_information_info','wrapper');
//     	 }
//       });
// }
</script>