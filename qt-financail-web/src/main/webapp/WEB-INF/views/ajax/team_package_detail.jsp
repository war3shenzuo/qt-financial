<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!--icheck-->
<link href="${ctx}/common/js/iCheck/skins/square/green.css" rel="stylesheet">
<link href="${ctx}/common/js/iCheck/skins/flat/green.css" rel="stylesheet">

<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>慢病mlnx专用</a></li>
	<li><a href="#" onclick="LoadAjaxContent('${pageContext.request.contextPath}/mlnx/team_info','wrapper')">团队审核</a></li>
	<li><a href="#" onclick="LoadAjaxContent('${pageContext.request.contextPath}/mlnx/team_detail?teamId=${param.teamId }','wrapper')">团队详情</a></li>
	<li class="active">套餐详情</li>
</ul>
<div class="row">
	<input id="zid" type="hidden" value="${param.id }"/>
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">
				套餐详情 <span class="tools pull-right"> <a
					class="fa fa-chevron-down" href="javascript:;"></a> <!--                                 <a class="fa fa-times" href="javascript:;"></a> -->
				</span>
			</header>
			<div class="panel-body">
				<form class="cmxform form-horizontal adminex-form" role="form"
					method="POST" id="packageForm" action="${ctx }/data/team_package_add_json">
					<input type="hidden" id="img_url" value="${img_url}" />
					<input type="hidden" id="price" value="${param.price}" />
					<input type="hidden" id="absolute" value="${pageContext.request.contextPath}/" />
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">套餐名称：</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="name" id="name" readonly="readonly" style="border: none; background: none;">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">服务内容：</label>
						<div class="col-sm-6">
							<div class="team_package_content" id="package_contentBox">
								<div style="margin-bottom: 10px; overflow: hidden;">
									<div class="col-sm-9">
										<div class="teamDoctorsbox" style="border:0px;"></div>
									</div>
									<div class="col-sm-2">
										<input type="text" class="form-control" style="border:1px;background-color:#eee;" readonly size="2">
									</div>
									<div class="col-sm-1" style="line-height: 34px;">次</div>
								</div>
								<div style="margin-bottom: 10px; overflow: hidden;">
									<div class="col-sm-12">
										<div class="teamDoctorsbox" style="border:0px;"></div>
									</div>
								</div>
							</div>
<!-- 						<label class="col-sm-2 col-sm-2 control-label" -->
<!-- 							style="text-align: left;"> <a href="#packageModal" -->
<!-- 							data-toggle="modal"><i class="fa fa-pencil"></i>内容编辑</a> -->
<!-- 						</label> -->
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">套餐价格：</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="monthPrice" id="monthPrice" readonly="readonly" style="border: none; background: none;">
						</div>
						<label class="col-sm-2 col-sm-2 control-label" style="text-align: left;">元/月</label>
					</div>
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">服务到期时间：</label>
						<div class="col-sm-6">
							<input type="text" class="form-control"
							name="deadline" id="deadline" readonly="readonly" style="border: none; background: none;">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">套餐折扣：</label>
						<div class="col-sm-6" >
							<table class="table table-bordered">
								<thead>
									<tr>
										<th class="col-xs-3 text-center">服务时间</th>
										<th class="col-xs-3 text-center">优惠折扣(%)</th>
										<th class="col-xs-3 text-center">折后价格(￥)</th>
										<th class="col-xs-3 text-center">优惠价格(￥)</th>
									</tr>
								</thead>
								<tbody id="team_package_box">
								</tbody>
							</table>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">是否提供免费服务：</label>
						<div class="col-sm-6 icheck">
							<div class="square-green single-row">
								<div class="radio ">
									<input tabindex="3" type="radio" name="free" value="0" checked disabled>
									<label>是 </label>
								</div>
								<div class="radio ">
									<input tabindex="3" type="radio" name="free" value="1" disabled>
									<label>否 </label>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group team_free_time">
						<label class="col-sm-4 col-sm-4 control-label">免费服务周期：</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="freetime" id="freetime" readonly="readonly" style="border: none; background: none;">
						</div>
						<label class="col-sm-2 col-sm-2 control-label" style="text-align: left;">天</label>
					</div>
				</form>
			</div>
		</section>
		<!--notification end-->
	</div>
</div>
	
	<!--icheck -->
	<script src="${ctx}/common/js/iCheck/jquery.icheck.min.js"></script>
	<script src="${ctx}/common/js/icheck-init.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {	
			var url1 = "${ctx}/data/team_package_detail_treat?id="+$("#zid").val();
			LoadAjaxData(url1, loadTreat);
			var url2 = "${ctx}/data/team_package_detail_item?id="+$("#zid").val();
			LoadAjaxData(url2, loadItem);
			var url3 = "${ctx}/data/team_package_detail_discount?id="+$("#zid").val();
			LoadAjaxData(url3, loadDiscount);
			var url4 = "${ctx}/data/team_package_detail_freetime?id="+$("#zid").val();
			LoadAjaxData(url4, function(data){
				var dataObj = data.obj;
				if(dataObj!=null){
					$('input[name="free"][value="0"]').iCheck('check');
					$('.team_free_time').css('display','block');
					$("#freetime").val(dataObj.period);
				}else{
					$('input[name="free"][value="1"]').iCheck('check');
					$('.team_free_time').css('display','none');
				}
			})
			
		});
		function loadTreat(data){
			try{
				var dataObj = data.obj;
				if(dataObj!=null){
					$("#name").val(dataObj.name);
					$("#monthPrice").val(dataObj.monthPrice);
					$("#deadline").val(dataObj.deadline);
				}
			}catch(e){
				console.log(e);
			}
		}

		function loadItem(data){
			try{
				var objList = data.objList;
				var htmlStr = '';
				if(objList!=null){
					for(var i=0;i<objList.length;i++){
						if(objList[i].times!=0){
							htmlStr +=	'<div>'
								+	'<div class="col-sm-9 no-padding">'
								+	'<div class="teamDoctorsbox" style="border:0px;">'
								+	objList[i].item
								+	'</div>'
								+	'</div>'
								+	'<div class="col-sm-2 no-padding">'
								+	'<input type="text" class="form-control" style="border:1px;background-color:#eee; text-align: center;" readonly size="2" value="'+objList[i].times+'">'
								+	'</div>'
								+	'<div class="col-sm-1 no-padding" style="line-height: 34px;">次</div>'
								+	'</div>'
								+	'<div style="margin-bottom: 10px; overflow: hidden;">'
								+	'</div>';
						}else{
							htmlStr +=	'<div>'
								+	'<div class="col-sm-12 no-padding">'
								+	'<div class="teamDoctorsbox" style="border:0px;">'+objList[i].item+'</div>'
								+	'</div>'
								+	'</div>'
								+	'<div style="margin-bottom: 10px; overflow: hidden;">'
								+	'</div>';
						}
					}
					$("#package_contentBox").html(htmlStr);
					$('.flat-green input').iCheck({
						checkboxClass : 'icheckbox_flat-green',
						radioClass : 'iradio_flat-green'
					});
				}
			}catch(e){
				console.log(e);
			}
		}

	 	function loadDiscount(data){
	 		try{
	 			var objList = data.objList;
	 			var htmlStr = '';
	 			if(objList!=null){
	 				for(var i=0;i<objList.length;i++){
		 				var nowprice =  parseInt(objList[i].period)*parseInt(objList[i].discount)*parseFloat($("#price").val())/100;
		 				var discountprice = parseInt(objList[i].period)*(100-parseInt(objList[i].discount))*parseFloat($("#price").val())/100;
	 					htmlStr  += '<tr><td class="text-center"><div class="team_package_discount">'
	 						 + objList[i].period 
	 						 + '个月</div></td><td class="text-center"><div class="team_package_discount">'+ objList[i].discount +'</div></td>'
	 						 + '<td class="text-center"><div class="team_package_discount package_nowprice">'
	 						 + nowprice
	 						 + '</div></td>'
	 						 + '<td class="text-center"><div class="team_package_discount package_discountprice">'+discountprice+'</div></td></tr>';
	 				}
	 			}
	 			$("#team_package_box").html(htmlStr);
	 		}catch(e){
	 			console.log(e);
	 		}
	 	}
	</script>
