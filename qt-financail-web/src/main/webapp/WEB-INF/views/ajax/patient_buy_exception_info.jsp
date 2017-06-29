<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>慢病mlnx专用</a></li>
	<li class="active">病人异常购买</li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">
				<i class="fa fa-exclamation-triangle"></i> 异常购买信息
			</header>
			<div class="panel-body">
				<div class="adv-table">
					<div class="clearfix">
						<div class="form-group" style="font-size: 18px;">
							<div class="col-sm-2" style="width: 120px; padding: 7px 0px;">单日购买次数</div>
							<div class="col-sm-2"><input type="text" class="form-control" name="time" onblur="changeTime(this)" id="buytimes"></div>
							<div class="col-sm-2" style="width: 20px; padding: 7px 0px;">次</div>
						</div>
					</div>
					<table class="display table table-bordered table-striped"
						id="dynamic-table">
						<thead>
							<tr>
								<th>病人头像名字</th>
								<th>病人手机号</th>
								<th>单日次数</th>
								<th>日期</th>
								<th>详情</th>
							</tr>
						</thead>
						<tbody id="formContent">
						</tbody>
						<tfoot>
							<tr>
								<th>病人头像名字</th>
								<th>病人手机号</th>
								<th>单日次数</th>
								<th>日期</th>
								<th>详情</th>
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
				<form class="cmxform form-horizontal adminex-form" action="">
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">类型选择：</label>
						<div class="col-sm-6">
							<select id="selecttype" name="selecttype">
								<option value="LICENSE_SCORE_NURSEDOC">护士</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">积分选择：</label>
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
<!-- 模态框（Modal） -->

<!--dynamic table initialization -->
<script src="${ctx}/common/js/dynamic_table_init.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	Select2Test();
	var url = '${ctx}/data/exception_patient_buy?time=1';
	LoadAjaxData(url, function(data){
		var objList = data.objList;
		$("#formContent").html(" ");
        var html = "";
        for(var i = 0 ;i<objList.length;i++){
            var day = new Date(objList[i].date);
            var dateString = formatDate(day);
            html+="<tr><td><img src='${img_url}"+objList[i].pic+"?x-oss-process=image/resize,w_40' alt='头像'  style='width: 30px;height: 30px'/>"+objList[i].userName+"</td><td>"+objList[i].phone+"</td><td>"+objList[i].buyCount+"</td><td>"+dateString+"</td><td>详情</td></tr>";
            }
        $("#formContent").html(html);
        $('#dynamic-table').dataTable( {
           	"aaSorting": [[ 4, "desc" ]]
      	});
      	$("#buytimes").val('1'); 
	});
});
function Select2Test(){
	$("#selecttype").select2();
	$("#integraltype").select2();
}
//审核js
function update(id,el,userId,state){
	$.ajax({
		 type: "POST",
		 url: "${pageContext.request.contextPath}/mlnx/nurse_info_update",
		 data:"id="+id+"&userId="+userId+"&state="+state,
		 context: el,
		 success: function(result){
			 $(this).parent().html("已通过");
            /*  $("#selecttype").attr("onchange","changeDoctorType("+userId+")") */
             $("#giveDoctorQualityScore").attr("onclick","giveDoctorQualityScore("+userId+")")
			 $("#myModal").modal("show");
			 
    	 }
      });
}
//拒绝js
function refuse(id,el,userId,state){
	$.ajax({
		 type: "POST",
		 url: "nurse_info_refuse",
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
        url:"${ctx}/data/giveDoctorQualityScore",
        type:"post",
        data:"userId="+userId+"&type="+selecttype+"&year="+option,
        success:function(data){

            }
		});
	}

function formatDate(date){
	var html = (date.getFullYear())+"-"+(date.getMonth()+1)+"-"+(date.getDate());
	return html;
	}

function changeTime(el){
	
	$this = $(el);
	var time = $this.val();
	$.ajax({
        url:'${ctx}/data/exception_patient_buy',
        type:'post',
        data:'time='+time,
        success:function(data){
            var objList = data.objList;
            $("#formContent").html(" ");
            var html = "";
            for(var i = 0 ;i<objList.length;i++){
                var day = new Date(objList[i].date);
                var dateString = formatDate(day);
                html+="<tr><td><img src='${img_url}"+objList[i].pic+"' alt='头像'  style='width: 30px;height: 30px'/>"+objList[i].userName+"</td><td>"+objList[i].phone+"</td><td>"+objList[i].buyCount+"</td><td>"+dateString+"</td><td>详情</td></tr>";
                }
            $("#formContent").html(html);
// 		 	$('#dynamic-table').dataTable( {
//                 "aaSorting": [[ 4, "desc" ]]
//             } ); 
            }
		});
	}
</script>