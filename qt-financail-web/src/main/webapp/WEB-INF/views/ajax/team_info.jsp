<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<input type="hidden" value="${param.type}" id="type" />
<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>慢病mlnx专用</a></li>
	<li class="active">团队审核</li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">
				<i class="fa fa-list-ol"></i> 团队信息
			</header>
			<div class="panel-body">
				<div class="adv-table">
					<table class="display table table-bordered table-striped"
						id="dynamic-table">
						<thead>
							<tr>
								<th>头像名字</th>
								<th>团队名称</th>
								<th>团队成员</th>
								<th>计划服务人数</th>
								<th style="width: 30%;">擅长领域</th>
								<th>已选套餐</th>
								<th>审核内容</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="content">
						</tbody>
						<tfoot>
							<tr>
								<th>头像名字</th>
								<th>团队名称</th>
								<th>团队成员</th>
								<th>计划服务人数</th>
								<th>擅长领域</th>
								<th>已选套餐</th>
								<th>审核内容</th>
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

<div aria-hidden="false" aria-labelledby="myModalLabel" role="dialog"
	tabindex="-1" id="remarkModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button aria-hidden="true" data-dismiss="modal" class="close"
					type="button">×</button>
				<h4 class="modal-title">拒绝团队</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="remarkForm">
					<input type="hidden" id="teamId" name="teamId"/>
					<div class="form-group">
						<label class="col-sm-2 col-sm-2 control-label">理由</label>
						<div class="col-sm-9">
							<textarea class="form-control" id="remark" name="remark" />
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-success" onclick="refuse()">确定</button>
			</div>
		</div>
	</div>
</div>
<!-- 模态框（Modal） -->

<script type="text/javascript">
$(document).ready(function() {
	var url = "${pageContext.request.contextPath}/data/getTeams?type="+$("#type").val();
	LoadAjaxData(url,loadTeamInfoCheck);
});
function loadTeamInfoCheck(data){
	try{
		var img_url = $("#img_url").val();
		var htmlStr ="";
		var dataList = data.objList;
		for(var i= 0;i<dataList.length;i++){
			htmlStr +='<tr>'
					+'<td><a class="example-image-link" data-lightbox="example-set" href="'+img_url+dataList[i].userPic+'" title="'+dataList[i].userName+'"><img src="'+img_url+dataList[i].userPic+'?x-oss-process=image/resize,w_40" onerror="this.src=\'${pageContext.request.contextPath}/common/img/no_pic40.png\'" '
					+' alt="" style="width: 40px; height: auto;" /></a>'+dataList[i].userName+'</td>'
					+'	<td><a href="#" '
					+'		onclick="javacript:LoadAjaxContent(\'${pageContext.request.contextPath}/mlnx/team_detail?teamId='+dataList[i].id+'\',\'wrapper\')">'+dataList[i].name+'</a></td>'
					+'	<td>';
					for(var j=0;j <dataList[i].doctors.length;j++){
						htmlStr += dataList[i].doctors[j].name
						        +'<br />';
					}
			htmlStr +='	</td> '
					+'	<td>'
					+ dataList[i].acceptAccount
					+'</td> '
				    +'	<td>'
				    + dataList[i].advantage
				    + '</td>'
				    +'	<td>';
					for(var k=0;k <dataList[i].tDoctorTeamTreatments.length;k++){
						htmlStr += dataList[i].tDoctorTeamTreatments[k].name
						        +'<br />';
					}
			htmlStr +='	</td>'
					+'	<td>'
					+ dataList[i].statusDescription
					+'</td>'
					+'	<td id="cz'+dataList[i].id+'"><a href="#" onclick="update('+dataList[i].id+',this)">通过</a>|<a'
					+'	href="#" onclick="openModal('+dataList[i].id+')">拒绝</a></td>'
					+'</tr>';
		}
		$("#content").html(htmlStr);

		$('#dynamic-table').dataTable( {
	        "aaSorting": [[ 4, "desc" ]]
	    } );
	}catch (arr){
		console.log(arr);
	}
	
}
//审核js
function update(id,el){
	$.ajax({
		 type: "POST",
		 url: "${pageContext.request.contextPath}/data/team_info_update",
		 data:"id="+id, 
		 context: el,
		 success: function(result){
			if(result.responseCode=="200"){
				$(this).parent().html("已通过");
				LoadAjaxData("${pageContext.request.contextPath}/data/addCreateTeamScore?id="+result.obj.creatorId, function(data){})
			}
    	 }
      });
}
function openModal(id){
	$("#remarkModal").modal("show");
	$("#teamId").val(id);
}
//拒绝js
function refuse(){
	$.ajax({
		 type: "POST",
		 url: "${pageContext.request.contextPath}/data/team_info_refuse",
		 data: $("#remarkForm").serialize(),
		 success: function(result){
			if(result.responseCode=="200"){
				 var teamId = $("#teamId").val();
				 $("#cz"+teamId).html("已拒绝");
				 $("#remarkModal").modal("hide");
				 $("#remark").val("");
			}
    	 }
      });
}
</script>