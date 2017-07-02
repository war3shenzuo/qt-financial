﻿<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>慢病mlnx专用</a></li>
	<li class="active">护士审核</li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">
				<i class="fa fa-plus-square"></i> 护士信息
			</header>
			<div class="panel-body">
				<div class="adv-table">
					<table class="display table table-bordered table-striped"
						id="dynamic-table">
						<thead>
							<tr>
								<th>头像名字</th>
								<th>身份证正面</th>
								<th>身份证反面</th>
								<th>手持身份证</th>
								<th>护士资格证</th>
								<th>申请内容</th>
								<th>申请类型</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="content">
						</tbody>
						<tfoot>
							<tr>
								<th>头像名字</th>
								<th>身份证正面</th>
								<th>身份证反面</th>
								<th>手持身份证</th>
								<th>护士资格证</th>
								<th>申请内容</th>
								<th>申请类型</th>
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
<div aria-hidden="false" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
	<div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                <h4 class="modal-title">提示</h4>
            </div>
            <div class="modal-body">
				<form class="form-horizontal" role="form" method="POST" action="">
				<div class="form-group">
					<label class="col-sm-4 control-label">类型选择：</label>
					<div class="col-sm-6">
						<select id="selecttype" name="selecttype">
							<option value="LICENSE_SCORE_NURSEDOC">护士</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 control-label">积分选择：</label>
					<div class="col-sm-6">
						<select id="integraltype" name="integraltype">
						    <option value="重复提交不予积分">重复提交不予积分</option>
							<option value="一年以内执照">一年以内执照</option>
							<option value="一年到三年内">一年到三年内</option>
							<option value="三年到五年">三年到五年</option>
							<option value="五年以上">五年以上</option>
						</select>
					</div>
				</div>
				</form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-success" id="giveDoctorQualityScore">确定</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
$(document).ready(function() {
	var url = "${pageContext.request.contextPath}/data/getCheckNurses";
	LoadAjaxData(url,loadNurseCheck);
	Select2Test();
});
function loadNurseCheck(data){
	try{
		var img_url = $("#img_url").val();
		var htmlStr ="";
		var dataList = data.objList;
		for(var i= 0;i<dataList.length;i++){
			htmlStr += '<tr class="gradeX">'
		           +' <td><a class="example-image-link" data-lightbox="example-set1" href="'+img_url+dataList[i].userPic+'" title="'+dataList[i].userName+'"><img src="'+img_url+dataList[i].userPic+'?x-oss-process=image/resize,w_40" alt="头像" onerror="this.src=\'${pageContext.request.contextPath}/common/img/no_pic40.png\'" style="width: 40px; height: auto;" /></a>'+dataList[i].userName+'</td>'
		           +'<td><a class="example-image-link" data-lightbox="example-set2" href="'+img_url+dataList[i].urlFront+'" title="身份证正面"><img src="'+img_url+dataList[i].urlFront+'?x-oss-process=image/resize,w_40" alt="身份证正面" onerror="this.src=\'${pageContext.request.contextPath}/common/img/no_pic40.png\'" style="width: 40px; height: auto;" /></a></td>'
		           +'<td><a class="example-image-link" data-lightbox="example-set3" href="'+img_url+dataList[i].urlBack+'" title="身份证反面"><img src="'+img_url+dataList[i].urlBack+'?x-oss-process=image/resize,w_40" alt="身份证反面" onerror="this.src=\'${pageContext.request.contextPath}/common/img/no_pic40.png\'" style="width: 40px; height: auto;" /></a></td>'
		           +'<td><a class="example-image-link" data-lightbox="example-set4" href="'+img_url+dataList[i].scUrl+'" title="手持身份证"><img src="'+img_url+dataList[i].scUrl+'?x-oss-process=image/resize,w_40" alt="手持身份证" onerror="this.src=\'${pageContext.request.contextPath}/common/img/no_pic40.png\'" style="width: 40px; height: auto;" /></a></td>'
		           +' <td>';
		           for(var j = 0 ;j<dataList[i].zgUrl.length;j++){
		        	  htmlStr += '<a class="example-image-link" data-lightbox="example-set5" href="'+img_url+dataList[i].zgUrl[j]+'" title="医师资格证"><img src="'+img_url+dataList[i].zgUrl[j]+'?x-oss-process=image/resize,w_40" alt="医师资格证" onerror="this.src=\'${pageContext.request.contextPath}/common/img/no_pic40.png\'" style="width: 40px; height: auto;" /></a>';
			       }
			          htmlStr +='</td><td>';
			       for(var h = 0;h<dataList[i].content.length;h++){
				       if(h==dataList[i].content.length-1){
					       if(dataList[i].content[h]=='NURSE'){
					    	   htmlStr +='签约护士';
						    } 
					    }
				   }
			       htmlStr+='</td><td>';
			       if(dataList[i].state=='CHECK_QUALITY_VERIFY'){
			    	   htmlStr +='资质申请';
				   }
			       if(dataList[i].state=='CHECK_QUALITY_UPDATE_VERIFY'){
			    	   htmlStr +='更新资质';
				   }
			        htmlStr+=' </td>'
			                +' <td><a href="#" onclick="update('+dataList[i].id+',this,'+dataList[i].userId+',\''+dataList[i].state+'\')">通过</a>|<a href="#" onclick="refuse('+dataList[i].id+',this,'+dataList[i].userId+',\''+dataList[i].state+'\')">拒绝</a></td> '
			                +'</tr>';
			}
		$("#content").html(htmlStr);
		$('#dynamic-table').dataTable( {
	        "aaSorting": [[ 4, "desc" ]]
	    } );
		} catch(arr){
			console.log(arr);
		}
}
function Select2Test(){
	$("#selecttype").select2();
	$("#integraltype").select2();
}
//审核js
function update(id,el,userId,state){
	$.ajax({
		 type: "POST",
		 url: "${pageContext.request.contextPath}/date/nurse_info_update",
		 data:"id="+id+"&userId="+userId+"&state="+state,
		 context: el,
		 success: function(result){
			 if(result.responseCode=='200'){
				 $(this).parent().html("已通过");
	            /*  $("#selecttype").attr("onchange","changeDoctorType("+userId+")") */
	             $("#giveDoctorQualityScore").attr("onclick","giveDoctorQualityScore("+userId+")")
				 $("#myModal").modal("show");
			 }
    	 }
      });
}
//拒绝js
function refuse(id,el,userId,state){
	$.ajax({
		 type: "POST",
		 url: "${pageContext.request.contextPath}/data/nurse_info_refuse",
		 data:"id="+id+"&userId="+userId+"&state="+state,
		 context: el,
		 success: function(result){
			 $(this).parent().html("已拒绝");
    	 }
      });
}
//给予医生申请资质成功之后的积分
function giveDoctorQualityScore(userId){
	$("#myModal").modal("hide");
	var  selecttype = $("#selecttype option:selected").val();
	var  option = $("#integraltype option:selected").val();
	
	$.ajax({
	       url:"${pageContext.request.contextPath}/mlnx/giveDoctorQualityScore",
	       type:"post",
	       data:"userId="+userId+"&type="+selecttype+"&year="+option,
	       success:function(data){
	
	           }
		});
}
</script>