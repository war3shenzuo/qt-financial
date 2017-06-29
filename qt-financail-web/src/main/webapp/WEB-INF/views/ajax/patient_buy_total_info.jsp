<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>慢病mlnx专用</a></li>
	<li class="active">病人购买统计</li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">
				<i class="fa fa-exclamation-triangle"></i> 购买统计信息
			</header>
			<div class="panel-body">
				<div class="adv-table">
					<table class="display table table-bordered table-striped"
						id="dynamic-table">
						<thead>
							<tr>
								<th>病人头像名字</th>
								<th>病人手机号</th>
								<th>购买团队</th>
								<th>购买套餐</th>
								<th>日期</th>
								<th>状态</th>
							</tr>
						</thead>
						<tbody id="content">
						</tbody>
						<tfoot>
							<tr>
								<th>病人头像名字</th>
								<th>病人手机号</th>
								<th>购买团队</th>
								<th>购买套餐</th>
								<th>日期</th>
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
	var url = '${ctx}/data/patient_buy_all';
	LoadAjaxData(url, function(data){
		try{
			var objList = data.objList;
			var htmlStr = '';
			for(var i=0;i<objList.length;i++){
				htmlStr +=	'<tr>'
					+	'<td><a class="example-image-link" data-lightbox="example-set" href="${img_url}'+objList[i].pic+'"'
					+	'title="'+objList[i].userName+'"><img src="${img_url}'+objList[i].pic+'?x-oss-process=image/resize,w_40"'
					+	'onerror="this.src=\'${pageContext.request.contextPath}/common/img/no_pic40.png\'" alt="头像"  style="width: 40px;height: auto;"/></a>'+objList[i].userName+'</td>'
            		+	'<td>'+objList[i].phone+'</td>'
            		+	'<td>'+objList[i].teamName+'</td>'
            		+	'<td>';
            		for(var j=0;j<objList[i].treatmentNames.length;j++){
            			htmlStr +=	objList[i].treatmentNames[j]+'&nbsp;';
                	}
            		htmlStr +=	'</td>'
                			+	'<td>'+objList[i].date+'</td>';
                			if(objList[i].status==0){
								htmlStr +=	'<td>未付款</td>';
                    		}else if(objList[i].status==1){
								htmlStr +=	'<td>已付款</td>';
                    		}else if(objList[i].status==2){
								htmlStr +=	'<td>付款超时</td>';
                    		}else if(objList[i].status==3){
								htmlStr +=	'<td>医生接收</td>';
                    		}else if(objList[i].status==4){
								htmlStr +=	'<td>退款</td>';
                    		}else if(objList[i].status==5){
								htmlStr +=	'<td>退款成功</td>';
                    		}
          					htmlStr +=	'</tr>';
			}
			$("#content").html(htmlStr);
			$('#dynamic-table').dataTable( {
		        "aaSorting": [[ 4, "desc" ]]
		    } );
		}catch(e){
			console.log(e);
		}
	});
});
function Select2Test(){
	$("#selecttype").select2();
	$("#integraltype").select2();
}

</script>