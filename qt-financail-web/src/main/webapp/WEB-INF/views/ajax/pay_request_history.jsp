<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>慢病mlnx专用</a></li>
	<li class="active">历史提现记录</li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">
				<i class="fa fa-tags"></i> 历史提现记录
			</header>
			<div class="panel-body">
				<div class="adv-table">
					<table class="display table table-bordered table-striped"
						id="dynamic-table">
						<thead>
							<tr>
								<th>头像名字</th>
								<th>账号</th>
								<th>金额</th>
								<th>类型</th>
								<th>提现账号</th>
								<th>备注</th>
								<th>状态</th>
							</tr>
						</thead>
						<tbody id="content">
						</tbody>
						<tfoot>
							<tr>
								<th>头像名字</th>
								<th>账号</th>
								<th>金额</th>
								<th>类型</th>
								<th>提现账号</th>
								<th>备注</th>
								<th>状态</th>
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
<div aria-hidden="false" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
	<div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                <h4 class="modal-title" id="myModalLabel">提示</h4>
            </div>
            <div class="modal-body" id="message">
				${param.message}
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<!-- 模态框（Modal） -->

<script type="text/javascript">
$(document).ready(function() {
	var url = "${pageContext.request.contextPath}/data/pay_request_history";
	LoadAjaxData(url, loadPayRequestHistory);
});

function loadPayRequestHistory(data){
	try{
		var htmlStr ="";
		var dataList = data.objList;
		for(var i=0;i<dataList.length;i++){
			htmlStr += '<tr>'
           			+  '<td><a class="example-image-link" data-lightbox="example-set" href="${img_url}'+dataList[i].userPic+'" title="'+dataList[i].userName+'"><img src="${img_url}'+dataList[i].userPic+'?x-oss-process=image/resize,w_40" alt="头像" onerror="this.src=\'${pageContext.request.contextPath}/common/img/no_pic40.png\'"  style="width: 40px;height: auto;"/></a>'+dataList[i].userName+'</td>'
              		+  '<td>'+dataList[i].userPhone+'</td>'
              		+  '<td>'+dataList[i].withdraw+'</td>'
             		+  '<td>'+dataList[i].accountTypeDescription+'</td>'
              		+  '<td>'+dataList[i].account+'</td>'
              		+  '<td>'+dataList[i].remark+'</td>'
              		+  '<td>'+dataList[i].statusDescription+'</td>'
              		+  '</tr>';
		}
		$("#content").html(htmlStr);

		$('#dynamic-table').dataTable( {
	        "aaSorting": [[ 4, "desc" ]]
	    } );
	}catch (arr){
		console.log(arr);
	}
};

</script>