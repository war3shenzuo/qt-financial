<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<input type="hidden" id="absolute" value="${pageContext.request.contextPath}/" />
<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>慢病mlnx专用</a></li>
	<li class="active">医生积分</li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">
				<i class="fa fa-magic"></i> 医生积分
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
							<c:forEach items="${map['DOCTOR_SCORE_MANAGEMENTS'] }" var="DOCTOR_SCORE_MANAGEMENT" >
							    <tr>
									<td>${DOCTOR_SCORE_MANAGEMENT.actionItems }</td>
									<td>${DOCTOR_SCORE_MANAGEMENT.score }</td>
									<td>${DOCTOR_SCORE_MANAGEMENT.content }</td>
									<td>${DOCTOR_SCORE_MANAGEMENT.dailyScoreLimit }</td>
									<td id="${DOCTOR_SCORE_MANAGEMENT.id }status"><c:if test="${DOCTOR_SCORE_MANAGEMENT.status==1 }">启用</c:if>
									    <c:if test="${DOCTOR_SCORE_MANAGEMENT.status==2 }">禁用</c:if> 
									</td>
									<td>
										<a href="#" onclick="editScoreManagement(${DOCTOR_SCORE_MANAGEMENT.id},1,this)">编辑</a>
										<span>|</span>
										<c:if test="${DOCTOR_SCORE_MANAGEMENT.status==1 }"><a href="#" onclick="changeScore(${DOCTOR_SCORE_MANAGEMENT.status},${DOCTOR_SCORE_MANAGEMENT.id },this)">禁用</a></c:if>
									    <c:if test="${DOCTOR_SCORE_MANAGEMENT.status==2 }"><a href="#" onclick="changeScore(${DOCTOR_SCORE_MANAGEMENT.status},${DOCTOR_SCORE_MANAGEMENT.id},this)">启用</a></c:if>
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
				<i class="fa fa-magic"></i> 签约病人积分配置
			</header>
			<div class="panel-body">
				<div class="adv-table">
					<table class="display table table-bordered table-striped"
						id="dynamic-table2">
						<thead>
							<tr>
								<th>操作项</th>
								<th>积分值</th>
								<th>完成条件说明</th>
								<th>启用状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="content2">
							<c:forEach items="${map['SIGN_PATIENT_SCORES'] }" var="SIGN_PATIENT_SCORE" >
							    <tr>
									<td>${SIGN_PATIENT_SCORE.actionItems }</td>
									<td>${SIGN_PATIENT_SCORE.score }</td>
									<td>${SIGN_PATIENT_SCORE.content }</td>
									<td id="${SIGN_PATIENT_SCORE.id }status"><c:if test="${SIGN_PATIENT_SCORE.status==1 }">启用</c:if>
									    <c:if test="${SIGN_PATIENT_SCORE.status==2 }">禁用</c:if> 
									</td>
									<td>
										<a href="#" onclick="editScoreManagement(${SIGN_PATIENT_SCORE.id},2,this)">编辑</a>
										<span>|</span>
										<c:if test="${SIGN_PATIENT_SCORE.status==1 }"><a href="#" onclick="changeScore(${SIGN_PATIENT_SCORE.status},${SIGN_PATIENT_SCORE.id },this)">禁用</a></c:if>
									    <c:if test="${SIGN_PATIENT_SCORE.status==2 }"><a href="#" onclick="changeScore(${SIGN_PATIENT_SCORE.status},${SIGN_PATIENT_SCORE.id},this)">启用</a></c:if>
									</td>
								</tr>
						    </c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<th>操作项</th>
								<th>积分值</th>
								<th>完成条件说明</th>
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
				<i class="fa fa-magic"></i> 指导医生执照积分配置
			</header>
			<div class="panel-body">
				<div class="adv-table">
					<table class="display table table-bordered table-striped"
						id="dynamic-table3">
						<thead>
							<tr>
								<th>操作项</th>
								<th>指导医生</th>
								<th>完成条件说明</th>
								<th>启用状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="content3">
							<c:forEach items="${map['LICENSE_SCORE_GUIDEDOCS'] }" var="LICENSE_SCORE_GUIDEDOC" >
							    <tr>
									<td>${LICENSE_SCORE_GUIDEDOC.actionItems }</td>
									<td>${LICENSE_SCORE_GUIDEDOC.score }</td>
									<td>${LICENSE_SCORE_GUIDEDOC.content }</td>
									<td id="${LICENSE_SCORE_GUIDEDOC.id }status"><c:if test="${LICENSE_SCORE_GUIDEDOC.status==1 }">启用</c:if>
									    <c:if test="${LICENSE_SCORE_GUIDEDOC.status==2 }">禁用</c:if> 
									</td>
									<td>
										<a href="#" onclick="editScoreManagement(${LICENSE_SCORE_GUIDEDOC.id},1,this)">编辑</a>
										<span>|</span>
										<c:if test="${LICENSE_SCORE_GUIDEDOC.status==1 }"><a href="#" onclick="changeScore(${LICENSE_SCORE_GUIDEDOC.status},${LICENSE_SCORE_GUIDEDOC.id },this)">禁用</a></c:if>
									    <c:if test="${LICENSE_SCORE_GUIDEDOC.status==2 }"><a href="#" onclick="changeScore(${LICENSE_SCORE_GUIDEDOC.status},${LICENSE_SCORE_GUIDEDOC.id},this)">启用</a></c:if>
									</td>
								</tr>
						    </c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<th>操作项</th>
								<th>指导医生</th>
								<th>完成条件说明</th>
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
				<i class="fa fa-magic"></i> 签约医生执照积分配置
			</header>
			<div class="panel-body">
				<div class="adv-table">
					<table class="display table table-bordered table-striped"
						id="dynamic-table4">
						<thead>
							<tr>
								<th>操作项</th>
								<th>签约医生</th>
								<th>完成条件说明</th>
								<th>启用状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="content4">
							<c:forEach items="${map['LICENSE_SCORE_SIGNDOCS']}" var="LICENSE_SCORE_SIGNDOC" >
							    <tr>
									<td>${LICENSE_SCORE_SIGNDOC.actionItems }</td>
									<td>${LICENSE_SCORE_SIGNDOC.score }</td>
									<td>${LICENSE_SCORE_SIGNDOC.content }</td>
									<td id="${LICENSE_SCORE_SIGNDOC.id }status"><c:if test="${LICENSE_SCORE_SIGNDOC.status==1 }">启用</c:if>
									    <c:if test="${LICENSE_SCORE_SIGNDOC.status==2 }">禁用</c:if> 
									</td>
									<td>
										<a href="#" onclick="editScoreManagement(${LICENSE_SCORE_SIGNDOC.id},1,this)">编辑</a>
										<span>|</span>
										<c:if test="${LICENSE_SCORE_SIGNDOC.status==1 }"><a href="#" onclick="changeScore(${LICENSE_SCORE_SIGNDOC.status},${LICENSE_SCORE_SIGNDOC.id },this)">禁用</a></c:if>
									    <c:if test="${LICENSE_SCORE_SIGNDOC.status==2 }"><a href="#" onclick="changeScore(${LICENSE_SCORE_SIGNDOC.status},${LICENSE_SCORE_SIGNDOC.id},this)">启用</a></c:if>
									</td>
								</tr>
						    </c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<th>操作项</th>
								<th>签约医生</th>
								<th>完成条件说明</th>
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
				<i class="fa fa-magic"></i> 护士执照积分配置
			</header>
			<div class="panel-body">
				<div class="adv-table">
					<table class="display table table-bordered table-striped"
						id="dynamic-table5">
						<thead>
							<tr>
								<th>操作项</th>
								<th>护士</th>
								<th>完成条件说明</th>
								<th>启用状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="content5">
							<c:forEach items="${map['LICENSE_SCORE_NURSEDOCS'] }" var="LICENSE_SCORE_NURSEDOC" >
							    <tr>
									<td>${LICENSE_SCORE_NURSEDOC.actionItems }</td>
									<td>${LICENSE_SCORE_NURSEDOC.score }</td>
									<td>${LICENSE_SCORE_NURSEDOC.content }</td>
									<td id="${LICENSE_SCORE_NURSEDOC.id }status"><c:if test="${LICENSE_SCORE_NURSEDOC.status==1 }">启用</c:if>
									    <c:if test="${LICENSE_SCORE_NURSEDOC.status==2 }">禁用</c:if> 
									</td>
									<td>
										<a href="#" onclick="editScoreManagement(${LICENSE_SCORE_NURSEDOC.id},1,this)">编辑</a>
										<span>|</span>
										<c:if test="${LICENSE_SCORE_NURSEDOC.status==1 }"><a href="#" onclick="changeScore(${LICENSE_SCORE_NURSEDOC.status},${LICENSE_SCORE_NURSEDOC.id },this)">禁用</a></c:if>
									    <c:if test="${LICENSE_SCORE_NURSEDOC.status==2 }"><a href="#" onclick="changeScore(${LICENSE_SCORE_NURSEDOC.status},${LICENSE_SCORE_NURSEDOC.id},this)">启用</a></c:if>
									</td>
								</tr>
						    </c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<th>操作项</th>
								<th>护士</th>
								<th>完成条件说明</th>
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
				<i class="fa fa-magic"></i> 证件积分配置
			</header>
			<div class="panel-body">
				<div class="adv-table">
					<table class="display table table-bordered table-striped"
						id="dynamic-table6">
						<thead>
							<tr>
								<th>操作项</th>
								<th>积分值</th>
								<th>完成条件说明</th>
								<th>启用状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="content6">
							<c:forEach items="${map['CERTIFICATE_SCORE']}" var="CERTIFICATE_SCORE" >
							    <tr>
									<td>${CERTIFICATE_SCORE.actionItems }</td>
									<td>${CERTIFICATE_SCORE.score }</td>
									<td>${CERTIFICATE_SCORE.content }</td>
									<td>${CERTIFICATE_SCORE.dailyScoreLimit }</td>
									<td id="${CERTIFICATE_SCORE.id }status"><c:if test="${CERTIFICATE_SCORE.status==1 }">启用</c:if>
									    <c:if test="${CERTIFICATE_SCORE.status==2 }">禁用</c:if> 
									</td>
									<td>
										<a href="#" onclick="editScoreManagement(${CERTIFICATE_SCORE.id},1,this)">编辑</a>
										<span>|</span>
										<c:if test="${CERTIFICATE_SCORE.status==1 }"><a href="#" onclick="changeScore(${CERTIFICATE_SCORE.status},${CERTIFICATE_SCORE.id },this)">禁用</a></c:if>
									    <c:if test="${CERTIFICATE_SCORE.status==2 }"><a href="#" onclick="changeScore(${CERTIFICATE_SCORE.status},${CERTIFICATE_SCORE.id},this)">启用</a></c:if>
									</td>
								</tr>
						    </c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<th>操作项</th>
								<th>积分值</th>
								<th>完成条件说明</th>
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
				<i class="fa fa-magic"></i> 等级积分及权限配置
			</header>
			<div class="panel-body">
				<div class="adv-table">
					<table class="display table table-bordered table-striped"
						id="dynamic-table7">
						<thead>
							<tr>
								<th>积分值</th>
								<th>等级</th>
								<th>称号</th>
								<th>个人可服务人数上限</th>
								<th>报酬加成</th>
								<th>说明</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="content7">
							<c:forEach items="${map['tUserLevels']}" var="tUserLevel" >
							    <tr>
									<td>${tUserLevel.experience }</td>
									<td>${tUserLevel.level }</td>
									<td>${tUserLevel.nickname }</td>
									<td>${tUserLevel.patientLimit }</td>
									<td>${tUserLevel.payInc }</td>
									<td>${tUserLevel.comment }</td>
									<td>
										<a href="#" data-toggle="modal" data-target="#myModal-add1">编辑</a>
										<!-- <span>|</span>
										<a href="#">禁用</a> -->
									</td>
								</tr>
						    </c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<th>积分值</th>
								<th>等级</th>
								<th>称号</th>
								<th>个人可服务人数上限</th>
								<th>报酬加成</th>
								<th>说明</th>
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
							<th>称号</th>
							<th>个人可服务人数上限</th>
							<th>报酬加成</th>
							<th>说明</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" name="newjifen"></td>
							<td><input type="text" class="form-control" name="newdengji"></td>
							<td><input type="text" class="form-control" name="newchenghao"></td>
							<td><input type="text" class="form-control" name="newshangxian"></td>
							<td><input type="text" class="form-control" name="newjiacheng"></td>
							<td><input type="text" class="form-control" name="newshuoming"></td>
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

<script src="${ctx}/common/js/xyw/integral.js"></script>

<script src="${ctx}/common/js/xyw/score.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	Select2Test();
	var url = "${pageContext.request.contextPath}/data/integral_doctor";
	LoadAjaxData(url, loadIntegralDoctor);
});
function loadIntegralDoctor(data){
	try{
		var htmlStr1 ="";
		var doctorScore = data.DOCTOR_SCORE_MANAGEMENTS;
		if(doctorScore!=null){
			for(var i=0;i<doctorScore.length;i++){
				htmlStr1 += '<tr>'
	              		+  '<td>'+doctorScore[i].actionItems+'</td>'
	              		+  '<td>'+doctorScore[i].score+'</td>'
	              		+  '<td>'+doctorScore[i].content+'</td>'
	              		+  '<td>'+doctorScore[i].dailyScoreLimit+'</td>'
	              		+  '<td id="'+doctorScore[i].id+'status">';
	              		if(doctorScore[i].status==1){
	              			htmlStr1 += '启用';
	                  	}else if(doctorScore[i].status==2){
	                  		htmlStr1 += '禁用';
	                    }
	            htmlStr1 += '</td>'
	           			+  '<td>'
						+  '<a href="#" onclick="editScoreManagement('+doctorScore[i].id+',1,this)">编辑</a>'
						+  '<span>|</span>';
						if(doctorScore[i].status==1){
	              			htmlStr1 += '<a href="#" onclick="changeScore('+doctorScore[i].status+','+doctorScore[i].id+',this)">禁用</a>';
	                  	}else if(doctorScore[i].status==2){
	                  		htmlStr1 += '<a href="#" onclick="changeScore('+doctorScore[i].status+','+doctorScore[i].id+',this)">启用</a>';
	                    }
				htmlStr1 += '</td></tr>';    
			}
		}
		$("#content1").html(htmlStr1);
		$('#dynamic-table').dataTable( {
	        "aaSorting": [[ 4, "desc" ]]
	    } );

		var htmlStr2 ="";
		var patientScore = data.SIGN_PATIENT_SCORES;
		if(patientScore!=null){
			for(var i=0;i<patientScore.length;i++){
				htmlStr2 += '<tr>'
	         			 +  '<td>'+patientScore[i].actionItems+'</td>'
	         			 +  '<td>'+patientScore[i].score+'</td>'
	              		 +  '<td>'+patientScore[i].content+'</td>'
						 +  '<td id="'+patientScore[i].id+'status">';
			      		 if(patientScore[i].status==1){
			      			 htmlStr2 += '启用';
			          	 }else if(patientScore[i].status==2){
			          		 htmlStr2 += '禁用';
			             }
	    		htmlStr2 += '</td>'
		    			 +  '<td>'
						 +  '<a href="#" onclick="editScoreManagement('+patientScore[i].id+',2,this)">编辑</a>'
						 +  '<span>|</span>';
						 if(patientScore[i].status==1){
		          			 htmlStr2 += '<a href="#" onclick="changeScore('+patientScore[i].status+','+patientScore[i].id+',this)">禁用</a>';
		              	 }else if(patientScore[i].status==2){
		              		 htmlStr2 += '<a href="#" onclick="changeScore('+patientScore[i].status+','+patientScore[i].id+',this)">启用</a>';
		                 }
						 htmlStr2 += '</td></tr>'; 
			}
		}
		$("#content2").html(htmlStr2);
		$('#dynamic-table2').dataTable( {
	        "aaSorting": [[ 4, "desc" ]]
	    } );

		var htmlStr3 ="";
		var guideDocs = data.LICENSE_SCORE_GUIDEDOCS;
		if(guideDocs!=null){
			for(var i=0;i<guideDocs.length;i++){
				htmlStr3 += '<tr>'
	         			 +  '<td>'+guideDocs[i].actionItems+'</td>'
	         			 +  '<td>'+guideDocs[i].score+'</td>'
	              		 +  '<td>'+guideDocs[i].content+'</td>'
						 +  '<td id="'+guideDocs[i].id+'status">';
			      		 if(guideDocs[i].status==1){
			      			 htmlStr3 += '启用';
			          	 }else if(guideDocs[i].status==2){
			          		 htmlStr3 += '禁用';
			             }
	    		htmlStr3 += '</td>'
		    			 +  '<td>'
						 +  '<a href="#" onclick="editScoreManagement('+guideDocs[i].id+',1,this)">编辑</a>'
						 +  '<span>|</span>';
						 if(guideDocs[i].status==1){
		          			 htmlStr3 += '<a href="#" onclick="changeScore('+guideDocs[i].status+','+guideDocs[i].id+',this)">禁用</a>';
		              	 }else if(guideDocs[i].status==2){
		              		 htmlStr3 += '<a href="#" onclick="changeScore('+guideDocs[i].status+','+guideDocs[i].id+',this)">启用</a>';
		                 }
						 htmlStr3 += '</td></tr>'; 
			}
		}
		$("#content3").html(htmlStr3);
		$('#dynamic-table3').dataTable( {
	        "aaSorting": [[ 4, "desc" ]]
	    } );
		
		var htmlStr4 ="";
		var signDocs = data.LICENSE_SCORE_SIGNDOCS;
		if(signDocs!=null){
			for(var i=0;i<signDocs.length;i++){
				htmlStr4 += '<tr>'
	         			 +  '<td>'+signDocs[i].actionItems+'</td>'
	         			 +  '<td>'+signDocs[i].score+'</td>'
	              		 +  '<td>'+signDocs[i].content+'</td>'
						 +  '<td id="'+signDocs[i].id+'status">';
			      		 if(signDocs[i].status==1){
			      			 htmlStr4 += '启用';
			          	 }else if(signDocs[i].status==2){
			          		 htmlStr4 += '禁用';
			             }
	    		htmlStr4 += '</td>'
		    			 +  '<td>'
						 +  '<a href="#" onclick="editScoreManagement('+signDocs[i].id+',1,this)">编辑</a>'
						 +  '<span>|</span>';
						 if(signDocs[i].status==1){
		          			 htmlStr4 += '<a href="#" onclick="changeScore('+signDocs[i].status+','+signDocs[i].id+',this)">禁用</a>';
		              	 }else if(signDocs[i].status==2){
		              		 htmlStr4 += '<a href="#" onclick="changeScore('+signDocs[i].status+','+signDocs[i].id+',this)">启用</a>';
		                 }
						 htmlStr4 += '</td></tr>'; 
			}
		}
		$("#content4").html(htmlStr4);
		$('#dynamic-table4').dataTable( {
	        "aaSorting": [[ 4, "desc" ]]
	    } );
		
		var htmlStr5 ="";
		var nurseDocs = data.LICENSE_SCORE_NURSEDOCS;
		if(nurseDocs!=null){
			for(var i=0;i<nurseDocs.length;i++){
				htmlStr5 += '<tr>'
	         			 +  '<td>'+nurseDocs[i].actionItems+'</td>'
	         			 +  '<td>'+nurseDocs[i].score+'</td>'
	              		 +  '<td>'+nurseDocs[i].content+'</td>'
						 +  '<td id="'+nurseDocs[i].id+'status">';
			      		 if(nurseDocs[i].status==1){
			      			 htmlStr5 += '启用';
			          	 }else if(nurseDocs[i].status==2){
			          		 htmlStr5 += '禁用';
			             }
	    		htmlStr5 += '</td>'
		    			 +  '<td>'
						 +  '<a href="#" onclick="editScoreManagement('+nurseDocs[i].id+',1,this)">编辑</a>'
						 +  '<span>|</span>';
						 if(nurseDocs[i].status==1){
		          			 htmlStr5 += '<a href="#" onclick="changeScore('+nurseDocs[i].status+','+nurseDocs[i].id+',this)">禁用</a>';
		              	 }else if(nurseDocs[i].status==2){
		              		 htmlStr5 += '<a href="#" onclick="changeScore('+nurseDocs[i].status+','+nurseDocs[i].id+',this)">启用</a>';
		                 }
						 htmlStr5 += '</td></tr>'; 
			}
		}
		$("#content5").html(htmlStr5);
		$('#dynamic-table5').dataTable( {
	        "aaSorting": [[ 4, "desc" ]]
	    } );
		
		var htmlStr6 ="";
		var certificateScore = data.CERTIFICATE_SCORE;
		if(certificateScore!=null){
			for(var i=0;i<certificateScore.length;i++){
				htmlStr6 += '<tr>'
	              		+  '<td>'+certificateScore[i].actionItems+'</td>'
	              		+  '<td>'+certificateScore[i].score+'</td>'
	              		+  '<td>'+certificateScore[i].content+'</td>'
	              		+  '<td>'+certificateScore[i].dailyScoreLimit+'</td>'
	              		+  '<td id="'+certificateScore[i].id+'status">';
	              		if(certificateScore[i].status==1){
	              			htmlStr6 += '启用';
	                  	}else if(certificateScore[i].status==2){
	                  		htmlStr6 += '禁用';
	                    }
	            htmlStr6 += '</td>'
	           			+  '<td>'
						+  '<a href="#" onclick="editScoreManagement('+certificateScore[i].id+',1,this)">编辑</a>'
						+  '<span>|</span>';
						if(certificateScore[i].status==1){
	              			htmlStr6 += '<a href="#" onclick="changeScore('+certificateScore[i].status+','+certificateScore[i].id+',this)">禁用</a>';
	                  	}else if(certificateScore[i].status==2){
	                  		htmlStr6 += '<a href="#" onclick="changeScore('+certificateScore[i].status+','+certificateScore[i].id+',this)">启用</a>';
	                    }
				htmlStr6 += '</td></tr>';
			} 
		}
		$("#content6").html(htmlStr6);
		$('#dynamic-table6').dataTable( {
	        "aaSorting": [[ 4, "desc" ]]
	    } );   

		var htmlStr7 ="";
		var userLevel = data.tUserLevels;
		if(userLevel!=null){
			for(var i=0;i<userLevel.length;i++){
				htmlStr7 += '<tr>'
		          		 +  '<td>'+userLevel[i].experience+'</td>'
		          		 +  '<td>'+userLevel[i].level+'</td>'
		          		 +  '<td>'+userLevel[i].nickname+'</td>'
		          		 +  '<td>'+userLevel[i].patientLimit+'</td>'
		          		 +  '<td>'+userLevel[i].payInc+'</td>'
		          		 +  '<td>'+userLevel[i].comment+'</td>'
		          		 +  '<td>'
		        		 +	'<a href="#" data-toggle="modal" data-target="#myModal-add1">编辑</a>'
		          		 +  '</td></tr>'
			}
		}
		$("#content7").html(htmlStr7);
		$('#dynamic-table7').dataTable( {
	        "aaSorting": [[ 4, "desc" ]]
	    } );   
		}catch (arr){
			console.log(arr);
		}
};
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
            var data = result.obj;
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
</script>
<%-- <!--dynamic table initialization -->
<script src="${ctx}/common/js/dynamic_table_init.js"></script> --%>