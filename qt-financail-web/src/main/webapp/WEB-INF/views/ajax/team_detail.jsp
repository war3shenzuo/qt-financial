<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>慢病mlnx专用</a></li>
	<li><a href="#" onclick="LoadAjaxContent('${pageContext.request.contextPath}/mlnx/team_info','wrapper')">团队审核</a></li>
	<li class="active">团队详情</li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">
				团队详情 <span class="tools pull-right"> <a
					class="fa fa-chevron-down" href="javascript:;"></a> <!--                                 <a class="fa fa-times" href="javascript:;"></a> -->
				</span>
			</header>
			<div class="panel-body">
				<form class="cmxform form-horizontal adminex-form" role="form"
					method="POST" id="patientForm" action="team_update_json">
					<input type="hidden" name="teamId" value="${teamId }">
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">团队名称：</label>
						<div class="col-sm-6">
							<input type="text" value="${map['teamVoAll'].name }"
								class="form-control" name="name" id="name" readonly="readonly"
								style="border: none; background: none;">
						</div>
<!-- 						<label class="col-sm-2 col-sm-2 control-label"><a href="#" -->
<%-- 							onclick="LoadAjaxContent('${ctx }/view/team_edit?teamId=${param.teamId}','wrapper')"><i --%>
<!-- 								class="fa fa-edit"></i>修改</a></label> -->
					</div>
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">团队成员：</label>
						<div class="col-sm-6" id="teamDoctors">
							<!-- 					        <input type="text" class="form-control" name="name" readonly="readonly" style="border: none; background: none;"> -->
							<div class="teamDoctorsbox" 
								style="background: none; border: none;">
								<c:forEach items="${map['teamVoAll'].doctors }" var="doctor"
									varStatus="s">
									<c:if test="${map['teamVoAll'].doctors.size()==s.count }">
								      ${doctor.name }
								   </c:if>
									<c:if test="${map['teamVoAll'].doctors.size()!=s.count }">
								      ${doctor.name },
								   </c:if>
								</c:forEach>
							</div>
							<c:forEach items="${map['teamVoAll'].doctors }" var="doctor"
								varStatus="s">
								<input type="hidden" name="doctorId[${s.index }]"
									value="${doctor.id }">
							</c:forEach>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">计划服务人数：</label>
						<div class="col-sm-6">
							<input type="text" value="${map['teamVoAll'].acceptAccount}" id="acceptAccount"
								class="form-control" name="acceptAccount" readonly="readonly"
								style="border: none; background: none;">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">团队介绍：</label>
						<div class="col-sm-6">
							<textarea name="advantage" class=" col-lg-12 form-control" id="advantage"
								readonly="readonly" style="border: none; background: none;">${map['teamVoAll'].advantage }</textarea>
						</div>
					</div>
					<div class="form-group" style="border-bottom: 0px;">
						<label class="col-sm-4 col-sm-4 control-label">团队套餐：</label>
						<div class="col-sm-8"></div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 col-sm-3 control-label"></label>
						<div class="col-sm-7">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th class="col-xs-4 text-center">套餐名称</th>
										<th class="col-xs-2 text-center">套餐操作</th>
									</tr>
								</thead>
								<tbody id="content">
									<c:forEach items="${map['tDoctorTeamTreatmentConstants'] }"
										var="tDoctorTeamTreatmentConstant">
										<tr>
											<td class="text-center"><input type="hidden"
												name="treatmentId"
												value="${tDoctorTeamTreatmentConstant.id}">${tDoctorTeamTreatmentConstant.treatmentName}</td>
											<td><div class="col-md-9">${tDoctorTeamTreatmentConstant.treatmentItem}</div>
												<div class="col-md-3 text-right">${tDoctorTeamTreatmentConstant.treatmentTimes}次</div></td>
											<td class="text-center"></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="form-group" style="border-bottom: 0px;">
						<label class="col-sm-4 col-sm-4 control-label">薪资分配：</label>
						<div class="col-sm-8"></div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 col-sm-3 control-label"></label>
						<div class="col-sm-7 ui-chronic-archives-input">
							<div class="col-sm-12 no-padding"
								style="border-top: 1px solid #ccc; border-left: 1px solid #ccc;">
								<div class="col-sm-6 text-center ui-proportion-border">分配人员</div>
								<div class="col-sm-6 text-center ui-proportion-border">分配比重</div>

								<div id="proportion">
									<c:forEach items="${map['teamVoAll'].doctors }" var="doctor"
										varStatus="s">
										<div class="col-sm-6 text-center ui-proportion-border">${doctor.name }</div>
										<div class="col-sm-6 text-center ui-proportion-border">
											<div class="ui-chronic-archives-control">
												<input type="number" class="form-control"
													name="proportion[${s.index }]"
													value="${doctor.wagesProportion }" readonly="readonly"
													style="border: none; background: none;" />
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</section>
		<!--notification end-->
	</div>
</div>

<input type="hidden" id="teamIda" value="${param.teamId }" />

<!--body wrapper end-->

<script type="text/javascript">
	$(document).ready(
		function() {
			var teamId = $("#teamIda").val();
			var url1 = "${ctx}/data/team_detail_team?teamId="+teamId;
			LoadAjaxData(url1, loadTeamDetailTeam);
			var url2 = "${ctx}/data/team_detail_treat?teamId="+teamId;
			LoadAjaxData(url2, loadTeamDetailTreat);
	});

	function loadTeamDetailTeam(data){
		try{
			var dataObj = data.obj;
			var htmlStr = '';
			var htmlStr1 = '';
			if(dataObj!=null){
				$("#name").val(dataObj.name);
				htmlStr +=	'<div class="teamDoctorsbox" '
						+	'style="background: none; border: none;">';
				for(var i=0;i<dataObj.doctors.length;i++){
					if(i==dataObj.doctors.length-1){
						htmlStr +=	dataObj.doctors[i].name;
					}else{
						htmlStr +=	dataObj.doctors[i].name+',';
					}
				}
				htmlStr += '</div>';
				for(var i=0;i<dataObj.doctors.length;i++){
					htmlStr +=	'<input type="hidden" name="doctorId['+(i+1)+']" value="'+ dataObj.doctors[i].id +'">';
				}
				$("#teamDoctors").html(htmlStr);
				$("#acceptAccount").val(dataObj.acceptAccount);
				$("#advantage").text(dataObj.advantage);

				for(var i=0;i<dataObj.doctors.length;i++){
					htmlStr1 += '<div class="col-sm-6 text-center ui-proportion-border">'+dataObj.doctors[i].name+'</div>'
							 +	'<div class="col-sm-6 text-center ui-proportion-border">'
							 +	'<div class="ui-chronic-archives-control">'
							 +	'<input type="number" class="form-control"'
							 +	'name="proportion['+(i+1)+']"'
							 +	'value="'+dataObj.doctors[i].wagesProportion+'" readonly="readonly"'
							 +	'style="border: none; background: none;" />'
							 +	'</div>'
							 +	'</div>';
				}
				$("#proportion").html(htmlStr1);
			}
		}catch(e){
			console.log(e);
		}
	}

	function loadTeamDetailTreat(data){
		try{
			var objList = data.objList;
			var htmlStr = '';
			if(objList!=null){
				for(var i=0;i<objList.length;i++){
					htmlStr +=	'<tr>'
							+	'<td class="col-xs-4 text-center"><input type="hidden"'
							+	'name="treatmentId" '
							+	'value="'+objList[i].id+'">'+objList[i].name+'</td>'
							+	'<td class="col-xs-2 text-center"><a href="javascript:LoadAjaxContent(\'${ctx}/mlnx/team_package_detail?id='+objList[i].id+'&teamId='+$("#teamIda").val()+'&price='+objList[i].monthPrice+'\',\'wrapper\')">查看</a></td>'
							+	'</tr>';
				}
			}
			$('#content').html(htmlStr);
		}catch(e){
			console.log(e);
		}
	}
</script>