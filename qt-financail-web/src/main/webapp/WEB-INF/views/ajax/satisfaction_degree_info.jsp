<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>慢病mlnx专用</a></li>
	<li class="active">患者满意度</li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">
				<i class="fa fa-list-ol"></i> 患者满意度
			</header>
			<div class="panel-body">
				<table class="table table-hover">
                             <thead>
                             <tr>
                                 <th>患者满意度等级</th>
						<th>权重</th>
						<th>得分计算</th>
						<th>操作</th>
                             </tr>
                             </thead>
                             <tbody id="content">
                              <c:forEach var="tDoctorTeamCheck" items="${tDoctorTeamChecks }">
					      <tr id="${tDoctorTeamCheck.id }">
								<td id="${ tDoctorTeamCheck.id}project">${tDoctorTeamCheck.project }</td>
								<td id="${ tDoctorTeamCheck.id}weight">${tDoctorTeamCheck.weight }</td>
								<td id="${ tDoctorTeamCheck.id}content">${tDoctorTeamCheck.content }</td>
								<td><a href="#" onclick="change(${tDoctorTeamCheck.id })">编辑</a></td>
						   </tr>
					    </c:forEach>
                             </tbody>
                         </table>
			</div>
			<div class="panel-body">
				<p>备注：</p>
				<p>1、满意度最后得分计算：各项得分之和/（非常满意权重*应投票数）*100；</p>
				<p>2、满意度最高分，全部投非常满意，最终得分100分；</p>
				<p>3、未投票的人数归类到满意这一档（倒数第二档）的票数。</p>
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
				<table class="table table-bordered">
					<thead>
				    	<tr>
				       		<th>患者满意度等级</th>
							<th>权重</th>
							<th>得分计算</th>
				        </tr>
				    </thead>
				    <tbody>
				    	<tr>
							<td>
							    <input type="hidden" name="id" id="projectId">
							    <input type="text" class="form-control" id="newProject" name="project">
							</td>
							<td><input type="text" class="form-control" id="newWeight"  name="weight"></td>
							<td><input type="text" class="form-control" id="newContent"  name="content"></td>
						</tr>
					</tbody>
				</table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-success" onclick="submitChange()">确定修改</button>
            </div>
        </div>
    </div>
</div>
<!-- 模态框（Modal） -->

<script type="text/javascript">
$(document).ready(function() {
	var url = "${pageContext.request.contextPath}/data/satisfaction_degree_info";
	LoadAjaxData(url, loadSatisfactionDegreeInfo);
});

function loadSatisfactionDegreeInfo(data){
	try{
		var htmlStr ="";
		var dataList = data.objList;
		for(var i= 0;i<dataList.length;i++){
			htmlStr += '<tr id='+dataList[i].id+'>'
			+'<td id="'+dataList[i].id+'project">'+dataList[i].project +'</td>'
			+'<td id="'+dataList[i].id+'weight">'+dataList[i].weight+'</td>'
			+'<td id="'+dataList[i].id+'content">'+dataList[i].content+'</td>'
			+'<td><a href="#" onclick="change('+dataList[i].id+')">编辑</a></td>'
	   		+'</tr>';
		}
		$("#content").html(htmlStr);
	}catch (arr){
		console.log(arr);
	}
};
function change(id){
    $("#projectId").val(id);
    var oldProject =id+"project";
    var oldWeight =id+"weight";
    var oldContent =id+"content";
    var oldProjectValue=$("#"+oldProject).text();
    var oldWeightValue=$("#"+oldWeight).text();
    var oldContentValue=$("#"+oldContent).text();
    $("#newProject").val(oldProjectValue);
    $("#newWeight").val(oldWeightValue);
    $("#newContent").val(oldContentValue);
    $("#myModal").modal("show");
	}
function submitChange(){
    var newProject = $("#newProject").val();
    var newWeight = $("#newWeight").val();
    var newContent = $("#newContent").val();
    var id=$("#projectId").val();
    $.ajax({
        url:"${pageContext.request.contextPath}/data/updateCheck",
        type:"post",
        data:"id="+id+"&project="+newProject+"&weight="+newWeight+"&content="+newContent,
        success:function(data){
        	$("#myModal").modal("hide");
            $("#"+id+"project").text(newProject);
            $("#"+id+"weight").text(newWeight);
            $("#"+id+"content").text(newContent);
            }
        });
	}
</script>