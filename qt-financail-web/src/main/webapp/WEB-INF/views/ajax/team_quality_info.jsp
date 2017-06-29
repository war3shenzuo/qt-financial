<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>慢病mlnx专用</a></li>
	<li class="active">团队质量分析</li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">
				<i class="fa fa-list-ol"></i> 团队质量分析
			</header>
			<div class="panel-body">
				<div class="adv-table">
					<table class="display table table-bordered table-striped"
						id="dynamic-table">
						<thead>
							<tr>
								<th>名称</th>
								<th>团队发起人姓名</th>
								<th>当前状态</th>
								<th>指标得分</th>
								<th>档案得分</th>
								<th>患者满意度</th>
								<th>随访得分</th>
								<th>及时干预得分</th>
								<th>医嘱得分</th>
								<th>得分</th>
							</tr>
						</thead>
						<tbody id="content">
							<c:forEach items="${teamQualityVos}" var="teamQualityVo">
								<tr>
									<td>${teamQualityVo.name}</td>
									<td>${teamQualityVo.userName}</td>
									<td>${teamQualityVo.status.description}</td>
									<td><c:if test="${teamQualityVo.indicatorsScore==null}">0</c:if>${teamQualityVo.indicatorsScore}</td>
									<td><c:if test="${teamQualityVo.archivesScore==null}">0</c:if>${teamQualityVo.archivesScore}</td>
									<td><c:if test="${teamQualityVo.satisfiedScore==null}">0</c:if>${teamQualityVo.satisfiedScore}</td>
									<td><c:if test="${teamQualityVo.visitScore==null}">0</c:if>${teamQualityVo.visitScore}</td>
									<td><c:if test="${teamQualityVo.timelyinterventionScore==null}">0</c:if>${teamQualityVo.timelyinterventionScore}</td>
									<td><c:if test="${teamQualityVo.timelyinterventionScore==null}">0</c:if>${teamQualityVo.timelyinterventionScore}</td>
									<td><c:if test="${teamQualityVo.resultScore==null}">0</c:if>${teamQualityVo.resultScore}</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<th>名称</th>
								<th>团队发起人姓名</th>
								<th>当前状态</th>
								<th>指标得分</th>
								<th>档案得分</th>
								<th>患者满意度</th>
								<th>随访得分</th>
								<th>及时干预得分</th>
								<th>医嘱得分</th>
								<th>得分</th>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
			<div class="panel-body">
				<p>备注：</p>
				<p>1、团队质量分析，分析的是一个周期以来，对各个病人服务的完成情况的统计，有有效数据的进入统计。</p>
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
	var url = "${pageContext.request.contextPath}/data/team_quality_info";
	LoadAjaxData(url, loadTeamQualityInfo);
});

function loadTeamQualityInfo(data){
	try{
		var htmlStr ="";
		var objList = data.objList;
		for(var i= 0;i<objList.length;i++){
			htmlStr += '<tr>'
					+  '<td>'+ objList[i].name+'</td>'
					+  '<td>'+ objList[i].userName+'</td>'
					+  '<td>'+ objList[i].statusDescription+'</td>';
					if(objList[i].indicatorsScore==null){
						htmlStr +=  '<td>0</td>';
					}else{
						htmlStr +=  '<td>'+ objList[i].indicatorsScore+'</td>';
					}
					if(objList[i].archivesScore==null){
						htmlStr +=  '<td>0</td>';
					}else{
						htmlStr +=  '<td>'+ objList[i].archivesScore+'</td>';
					}
					if(objList[i].satisfiedScore==null){
						htmlStr +=  '<td>0</td>';
					}else{
						htmlStr +=  '<td>'+ objList[i].satisfiedScore+'</td>';
					}
					if(objList[i].visitScore==null){
						htmlStr +=  '<td>0</td>';
					}else{
						htmlStr +=  '<td>'+ objList[i].visitScore+'</td>';
					}
					if(objList[i].timelyinterventionScore==null){
						htmlStr +=  '<td>0</td>';
					}else{
						htmlStr +=  '<td>'+ objList[i].timelyinterventionScore+'</td>';
					}
					if(objList[i].doctorAdvinceScore==null){
						htmlStr +=  '<td>0</td>';
					}else{
						htmlStr +=  '<td>'+ objList[i].doctorAdvinceScore+'</td>';
					}
					if(objList[i].resultScore==null){
						htmlStr +=  '<td>0</td>';
					}else{
						htmlStr +=  '<td>'+ objList[i].resultScore+'</td>';
					}
					htmlStr += '</tr>';
		}
		$("#content").html(htmlStr);

		$('#dynamic-table').dataTable( {
	        "aaSorting": [[ 4, "desc" ]]
	    } );
	}catch (arr){
		console.log(arr);
	}
};
function getScore(){
    $.ajax({
        url:'${pageContext.request.contextPath}/mlnx/get_team_quality_result',
        type:'post',
        success:function(data){

        	for(var key in data){
                $("#"+key).html(data[key]);
 
        		}
           
            }
        });         
	}
</script>