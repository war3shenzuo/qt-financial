<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<input type="hidden" id="absolute" value="${pageContext.request.contextPath}/mlnx/" />
<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>慢病mlnx专用</a></li>
	<li class="active">病人积分</li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">
				<i class="fa fa-magic"></i> 操作积分设置
			</header>
			<div class="panel-body">
				<div class="adv-table">
					<table class="display table table-bordered table-striped"
						id="dynamic-table">
						<thead>
							<tr>
								<th>操作项</th>
								<th>积分值</th>
								<th>完成条件说明</th>
								<th>每日积分上限</th>
								<th>启用状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="content1">
							<c:forEach items="${PATIENT_SCORE_MANAGEMENTS }" var="PATIENT_SCORE_MANAGEMENT" >
							    <tr>
									<td>${PATIENT_SCORE_MANAGEMENT.actionItems }</td>
									<td>${PATIENT_SCORE_MANAGEMENT.score }</td>
									<td>${PATIENT_SCORE_MANAGEMENT.content }</td>
									<td>${PATIENT_SCORE_MANAGEMENT.dailyScoreLimit }</td>
									<td id="${PATIENT_SCORE_MANAGEMENT.id }status"><c:if test="${PATIENT_SCORE_MANAGEMENT.status==1 }">启用</c:if>
									    <c:if test="${PATIENT_SCORE_MANAGEMENT.status==2 }">禁用</c:if> 
									</td>
									<td>
										<a href="#" onclick="editScoreManagement(${PATIENT_SCORE_MANAGEMENT.id},1,this)">编辑</a>
										<span>|</span>
										
										<c:if test="${PATIENT_SCORE_MANAGEMENT.status==1 }"><a href="#" onclick="changeScore(${PATIENT_SCORE_MANAGEMENT.status},${PATIENT_SCORE_MANAGEMENT.id },this)">禁用</a></c:if>
									    <c:if test="${PATIENT_SCORE_MANAGEMENT.status==2 }"><a href="#" onclick="changeScore(${PATIENT_SCORE_MANAGEMENT.status},${PATIENT_SCORE_MANAGEMENT.id},this)">启用</a></c:if> 
									    
									</td>
								</tr>
						    </c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<th>操作项</th>
								<th>积分值</th>
								<th>完成条件说明</th>
								<th>每日积分上限</th>
								<th>启用状态</th>
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

<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">
				<i class="fa fa-magic"></i> 积分等级配置
			</header>
			<div class="panel-body">
				<div class="adv-table">
					<table class="display table table-bordered table-striped"
						id="dynamic-table2">
						<thead>
							<tr>
								<th>积分值</th>
								<th>等级</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="content2">
							<c:forEach items="${tUserLevels }" var="tUserLevel" >
							    <tr>
									<td>${tUserLevel.experience }</td>
									<td>${tUserLevel.level }</td>
									<td>
										<a href="#" data-toggle="modal" data-target="#myModal-add1">编辑</a>
									</td>
								</tr>
						    </c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<th>积分值</th>
								<th>等级</th>
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
<div aria-hidden="false" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal-add1" class="modal fade">
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
							<th>操作项</th>
							<th>积分值</th>
							<th>完成条件说明</th>
							<th>每日积分上限</th>
							<th>启用状态</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" id="newcaozuo" readonly="readonly"></td>
							<td><input type="text" class="form-control" id="newjifen"></td>
							<td><input type="text" class="form-control" id="newshuoming"></td>
							<td><input type="text" class="form-control" id="newshangxian"  name="newshangxian"></td>
							<td>
								<div class="col-sm-12">
									<select id="el2">
										<option value="1">启用</option>
										<option value="2">禁用</option>
									</select>
								</div>
								
							</td>
						</tr>
					</tbody>
				</table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-success" id="newScoreManegerment">确定</button>
            </div>
        </div>
    </div>
</div>
<!-- 模态框（Modal） -->

<!-- 模态框（Modal） -->
<div aria-hidden="false" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal-add2" class="modal fade">
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
							<th>积分值</th>
							<th>等级</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" name="newjifen"></td>
							<td><input type="text" class="form-control" name="new等级"></td>
						</tr>
					</tbody>
				</table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-success">确定</button>
            </div>
        </div>
    </div>
</div>
<!-- 模态框（Modal） -->

<script type="text/javascript">
$(document).ready(function() {
	Select2Test();
	var url = "${pageContext.request.contextPath}/data/integral_patient";
	LoadAjaxData(url, loadIntegralPatient);
});

function loadIntegralPatient(data){
	try{
		var htmlStr1 ="";
		var patientScore = data.PATIENT_SCORE_MANAGEMENTS;
		if(patientScore!=null){
			for(var i=0;i<patientScore.length;i++){
				htmlStr1 += '<tr>'
	              		+  '<td>'+patientScore[i].actionItems+'</td>'
	              		+  '<td>'+patientScore[i].score+'</td>'
	              		+  '<td>'+patientScore[i].content+'</td>'
	              		+  '<td>'+patientScore[i].dailyScoreLimit+'</td>'
	              		+  '<td id="'+patientScore[i].id+'status">';
	              		if(patientScore[i].status==1){
	              			htmlStr1 += '启用';
	                  	}else if(patientScore[i].status==2){
	                  		htmlStr1 += '禁用';
	                    }
	            htmlStr1 += '</td>'
	           			+  '<td>'
						+  '<a href="#" onclick="editScoreManagement('+patientScore[i].id+',1,this)">编辑</a>'
						+  '<span>|</span>';
						if(patientScore[i].status==1){
	              			htmlStr1 += '<a href="#" onclick="changeScore('+patientScore[i].status+','+patientScore[i].id+',this)">禁用</a>';
	                  	}else if(patientScore[i].status==2){
	                  		htmlStr1 += '<a href="#" onclick="changeScore('+patientScore[i].status+','+patientScore[i].id+',this)">启用</a>';
	                    }
				htmlStr1 += '</td></tr>';    
			}
		}
		$("#content1").html(htmlStr1);
		$('#dynamic-table').dataTable( {
	        "aaSorting": [[ 4, "desc" ]]
	    } );

		var htmlStr2 ="";
		var userLevel = data.tUserLevels;
		if(userLevel!=null){
			for(var i=0;i<userLevel.length;i++){
				htmlStr2 += '<tr>'
              		 	 +  '<td>'+userLevel[i].experience+'</td>'
              		 	 +  '<td>'+userLevel[i].level+'</td>'
              		 	 +  '<td>'
              		 	 +  '<a href="#" data-toggle="modal" data-target="#myModal-add1">编辑</a>'
         				 +  '</td></tr>';
			}
		}
	    $("#content2").html(htmlStr2);
		$('#dynamic-table2').dataTable( {
	        "aaSorting": [[ 4, "desc" ]]
	    } );
	}catch (arr){
		console.log(arr);
	}
function Select2Test(){
	$("#el2").select2();
}
function editScoreManagement(id,number,el){
	var obj = $(el);
	
    $.ajax({
        url:"${pageContext.request.contextPath}/data/selectScoreManagementById",
        type:"post",
        data:"id="+id,
        success:function(result){
            var data = resulte.obj;
            if(number==1){
                  $("#newcaozuo").val(data.actionItems);
                  $("#newjifen").val(data.score);
                  $("#newshuoming").val(data.content);
                  $("#newshangxian").removeAttr("disabled");
                  $("#newshangxian").val(data.dailyScoreLimit);
                  $("#el2 option[value='"+data.status+"']").attr("selected","selected");
                  $("#el2").select2();
                  $("#newScoreManegerment").attr("onclick","editScoreManagementJson("+data.id+")");

                  $("#editNow").removeAttr("id");
                  obj.attr("id","editNow");
                  
                  $("#myModal-add1").modal("show");
                }
            if(number==2){
            	 $("#newcaozuo").val(data.actionItems);
                 $("#newjifen").val(data.score);
                 $("#newshuoming").val(data.content);
                 $("#newshangxian").val(null);
                 $("#newshangxian").attr("disabled","disabled");
                 $("#el2 option[value='"+data.status+"']").attr("selected","selected");
                 $("#el2").select2();
                 $("#newScoreManegerment").attr("onclick","editScoreManagementJson("+data.id+")");

                 $("#editNow").removeAttr("id");
                 obj.attr("id","editNow");
                 
                 $("#myModal-add1").modal("show");
                }
            }
        });
	}
function editScoreManagementJson(id){
	
	var  newcaozuo = $("#newcaozuo").val();
	var  newjifen = $("#newjifen").val();
	var  newshuoming = $("#newshuoming").val();
	var  newshangxian = $("#newshangxian").val();
	var  selected= $("#el2 option:selected").val();
    $.ajax({
        url:"${pageContext.request.contextPath}/data/edit_score_management_json",
        type:'post',
        data:'id='+id+'&actionItems='+newcaozuo+'&score='+newjifen+'&content='+newshuoming+'&dailyScoreLimit='+newshangxian+'&status='+selected,
        success:function(data){
              $this = $("#editNow");
              var tr=$this.parent().parent("tr");
              var td = tr.find("td");
              td.eq("0").html(newcaozuo);
              td.eq("1").html(newjifen);
              td.eq("2").html(newshuoming);
              td.eq("3").html(newshangxian);
              
              if(selected==1){
            	  td.eq("4").html("启用");
                  }
              else{
            	  td.eq("4").html("禁用");
                  }
              $("#myModal-add1").modal("hide");
            }
        });
	}
}
</script>