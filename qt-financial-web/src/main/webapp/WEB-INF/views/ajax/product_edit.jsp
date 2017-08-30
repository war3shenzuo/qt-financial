﻿<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<style>
#repayment_plan, #deferral_plan{
	border-left: 1px solid #dddddd;
	border-top: 1px solid #dddddd;
	height: auto;
	overflow: hidden;
}
.repayment_plan_box, .deferral_plan_box{
	border-right: 1px solid #dddddd;
	border-bottom: 1px solid #dddddd;
	line-height: 40px;
	text-align: center;
}
</style>
<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>清投金服</a></li>
	<li><a href="javascript:void(0)" onclick="LoadAjaxContent('${pageContext.request.contextPath}/view/product_info', 'wrapper');">产品管理</a></li>
	<li class="active">编辑产品 </li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">编辑产品 </header>
			<div class="panel-body">
				<form class="cmxform form-horizontal adminex-form" role="form"
					method="POST" id="productForm" action="#"
					enctype="multipart/form-data">
					<input type="hidden" value="${param.id}" name="id" id="id">
					<div class="form-group">
						<label class="col-sm-2 control-label">前段排序号：</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="productCode" id="number">
						</div>
						<label class="col-sm-2 control-label">产品名称：</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="productName" id="name">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">借款金额：</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="amount" id="money">
						</div>
						<label class="col-sm-2 control-label">借款时长：</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="daynum" id="time">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">信用审核费/元：</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="auditCost" id="money2">
						</div>
						<label class="col-sm-2 control-label">资产保管：</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="manageCost" id="money3">
						</div>
					</div>
						<div class="form-group">
						<label class="col-sm-2 control-label">可见等级：</label>
						<div class="col-sm-10">
							<div class="col-sm-2">
								<div class="checkbox-inline">
									<label> <input name="peoplegrade[]" type="checkbox"
										class="type3" id="" value="1">青铜会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
							<div class="col-sm-2">
								<div class="checkbox-inline">
									<label> <input name="peoplegrade[]" type="checkbox"
										class="type3" id="" value="2">白银会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
							<div class="col-sm-2">
								<div class="checkbox-inline">
									<label> <input name="peoplegrade[]" type="checkbox"
										class="type3" id="" value="3">黄金会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
							<div class="col-sm-2">
								<div class="checkbox-inline">
									<label> <input name="peoplegrade[]" type="checkbox"
										class="type3" id="" value="4">铂金会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
							<div class="col-sm-2">
								<div class="checkbox-inline">
									<label> <input name="peoplegrade[]" type="checkbox"
										class="type3" id="" value="5">钻石会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
							<div class="col-sm-2">
								<div class="checkbox-inline">
									<label> <input name="peoplegrade[]" type="checkbox"
										class="type3" id="" value="6">荣耀会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
							<div class="col-sm-2">
								<div class="checkbox-inline">
									<label> <input name="peoplegrade[]" type="checkbox"
										class="type3" id="" value="7">特约会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">可借等级：</label>
						<div class="col-sm-10">
							<div class="col-sm-2">
								<div class="checkbox-inline">
									<label> <input name="borrowgrade[]" type="checkbox"
										class="type3" id="" value="1">青铜会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
							<div class="col-sm-2">
								<div class="checkbox-inline">
									<label> <input name="borrowgrade[]" type="checkbox"
										class="type3" id="" value="2">白银会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
							<div class="col-sm-2">
								<div class="checkbox-inline">
									<label> <input name="borrowgrade[]" type="checkbox"
										class="type3" id="" value="3">黄金会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
							<div class="col-sm-2">
								<div class="checkbox-inline">
									<label> <input name="borrowgrade[]" type="checkbox"
										class="type3" id="" value="4">铂金会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
							<div class="col-sm-2">
								<div class="checkbox-inline">
									<label> <input name="borrowgrade[]" type="checkbox"
										class="type3" id="" value="5">钻石会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
							<div class="col-sm-2">
								<div class="checkbox-inline">
									<label> <input name="borrowgrade[]" type="checkbox"
										class="type3" id="" value="6">荣耀会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
							<div class="col-sm-2">
								<div class="checkbox-inline">
									<label> <input name="borrowgrade[]" type="checkbox"
										class="type3" id="" value="7">特约会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
						</div>
					</div>
				
					<div class="form-group">
						<label class="col-sm-2 control-label">状态：</label>
						<div class="col-sm-3">
							<select id="product_state" name="product_state">
								<option value="使用中">使用中</option>
								<option value="已下架">已下架</option>
							</select>
						</div>
						<label class="col-sm-2 control-label">逾期费用（元/天）：</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="dayAmount" id="money4">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">还款计划：</label>
						<div class="col-sm-10">
							<div id="repayment_plan">
								<div class="col-sm-2 repayment_plan_box">还款金额</div>
								<div class="col-sm-2 repayment_plan_box">还款日（/日后）</div>
								<div class="col-sm-2 repayment_plan_box">操作</div>
								<div class="col-sm-2 repayment_plan_box">延期金额</div>
								<div class="col-sm-2 repayment_plan_box">延期时长/天</div>
								<div class="col-sm-2 repayment_plan_box">操作</div>
							</div>
							<a class="btn btn-success" onclick="repaymentAdd()" style="margin-top: 20px;">新增还款计划 <i class="fa fa-plus"></i></a>
						</div>
<!-- 						<label class="col-sm-2 control-label">延期计划：</label> -->
<!-- 						<div class="col-sm-3"> -->
<!-- 							<div id="deferral_plan"> -->
<!-- 								<div class="col-sm-6 deferral_plan_box">延期金额</div> -->
<!-- 								<div class="col-sm-6 deferral_plan_box">延期时长/天</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
					</div>
					<div class="form-group">
						<div class="col-lg-offset-6 col-lg-10">
							<button class="btn btn-primary" type="submit"
								onclick="">提交</button>
						</div>
					</div>
				</form>
			</div>
		</section>
	</div>
</div>
<!-- 新建还款计划 -->
<div aria-hidden="false" aria-labelledby="authIdLabel" role="dialog"
	tabindex="-1" id="repayment_plan_modal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button aria-hidden="true" data-dismiss="modal" class="close"
					type="button">×</button>
				<h4 class="modal-title">新增还款计划</h4>
			</div>
			<div class="modal-body">
				<form class="cmxform form-horizontal adminex-form" role="form"
					method="POST" id="repaymentForm" action="">
					<div class="form-group">
                        <label class="col-sm-4 col-sm-4 control-label">还款金额：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="repayment_money" id="repayment_money">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 col-sm-4 control-label">还款日（/日后）：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="repayment_time" id="repayment_time">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-offset-3 col-lg-10">
                        	<button class="btn btn-default" data-dismiss="modal" style="padding: 6px 50px;">取消</button>
							<button class="btn btn-primary" type="submit" style="padding: 6px 50px;">提交</button>
						</div>
                    </div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- 新建还款计划 -->
<!-- 新建延期计划 -->
<div aria-hidden="false" aria-labelledby="authIdLabel" role="dialog"
	tabindex="-1" id="deferral_plan_modal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button aria-hidden="true" data-dismiss="modal" class="close"
					type="button">×</button>
				<h4 class="modal-title">新增延期计划</h4>
			</div>
			<div class="modal-body">
				<form class="cmxform form-horizontal adminex-form" role="form"
					method="POST" id="deferralForm" action="">
					<div class="form-group">
                        <label class="col-sm-4 col-sm-4 control-label">延期金额：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="deferral_money" id="deferral_money">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 col-sm-4 control-label">延期时长/天：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="deferral_time" id="deferral_time">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-offset-3 col-lg-10">
                        	<button class="btn btn-default" data-dismiss="modal" style="padding: 6px 50px;">取消</button>
							<button class="btn btn-primary" type="submit" style="padding: 6px 50px;">提交</button>
						</div>
                    </div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- 新建延期计划 -->
<script type="text/javascript">
	$(document).ready(function() {
		scrollTo(0,0);
		Select2Test();
		
		var url ="${pageContext.request.contextPath}/data/product/get?id="+$("#id").val();
		LoadAjaxData(url,function(data){
			try{
				$("input[name=productCode]").val(data.obj.productCode);
				$("input[name=productName]").val(data.obj.productName);
				$("input[name=amount]").val(data.obj.amount);
				$("input[name=daynum]").val(data.obj.daynum);
				$("input[name=auditCost]").val(data.obj.auditCost);
				$("input[name=manageCost]").val(data.obj.manageCost);
				$("input[name=dayAmount]").val(data.obj.dayAmount);
			} catch(arr){
				console.log(arr);
			}
		});
		
		var url2 ="${pageContext.request.contextPath}/data/product/getUserLevel?id="+$("#id").val();
		LoadAjaxData(url2,function(data){
			try{
				var list = data.objList;
				for(var i = 0;i<list.length;i++){
					if(list[i].type==1){//可见
						$("input[name='peoplegrade[]'][value='"+list[i].userLevelId+"']").attr('checked','true');
					}else {//可借
						$("input[name='borrowgrade[]'][value='"+list[i].userLevelId+"']").attr('checked','true');
					}
				}
			} catch(arr){
				console.log(arr);
			}
		});
		
		$('#productForm').bootstrapValidator(
				{
					submitHandler : function(validator, form,
							submitButton) {
						var url = "${pageContext.request.contextPath}/data/product/edit";//或form.attr('action')
						var param = form.serialize();//或者form.serialize()
						submitAjaxData(url, param, callback);
						function callback(data) {
							LoadAjaxContent('product_info','wrapper');
						}
					},
					message : 'This value is not valid',
					fields : {
						productCode : {
							validators : {
								notEmpty : {
									message : '输入不能为空'
								}
							}
						},
						productName: {
							validators : {
								notEmpty : {
									message : '输入不能为空'
								}
							}
						}
					}
				});
	});
	function repayment(){
		var htmlStr = '<div>'  
			+'<div class="col-sm-2 repayment_plan_box"><input class="inline-input" type="text" name="test['+i+'].amount" value="'+$("#repayment_money").val()+'"/></div>'
			+'<div class="col-sm-2 repayment_plan_box"><input class="inline-input" type="text" name="test['+i+'].day" value="'+$("#repayment_time").val()+'"/></div>'   
			+'<div class="col-sm-2 repayment_plan_box"><a class="btn btn-success" onclick="deferralAdd('+i+')">延期<i class="fa fa-plus"></i></a></div>'
			+'<div class="col-sm-2 repayment_plan_box"><input class="inline-input" type="text" name="" value=""/></div>'
			+'<div class="col-sm-2 repayment_plan_box"><input class="inline-input" type="text" name="" value=""/></div>'
			+'<div class="col-sm-2 repayment_plan_box"><input class="inline-input" type="text" name="" value=""/></div>'
			+'</div>';
			$("#repayment_plan").append(htmlStr);
			$("#repayment_money").val("");
			$("#repayment_time").val("");
			$("#repayment_plan_modal").modal("hide");
		i++;
		j=0;
	}
	function deferral(){
		var htmlStr = '<div>'  
			+'<div class="col-sm-2 repayment_plan_box"><input class="inline-input" type="text" name="" value=""/></div>'
			+'<div class="col-sm-2 repayment_plan_box"><input class="inline-input" type="text" name="" value=""/></div>'   
			+'<div class="col-sm-2 repayment_plan_box"><input class="inline-input" type="text" name="" value=""/></div>'
			+'<div class="col-sm-2 repayment_plan_box"><input class="inline-input" type="text" name="test['+$("#repayIndex").val()+'].delay['+j+'].amount" value="'+$("#deferral_money").val()+'"/></div>'
			+'<div class="col-sm-2 repayment_plan_box"><input class="inline-input" type="text" name="test['+$("#repayIndex").val()+'].delay['+j+'].day" value="'+$("#deferral_time").val()+'"/></div>'
			+'<div class="col-sm-2 repayment_plan_box"><input class="inline-input" type="text" name="" value=""/></div>'
			+'</div>';
			$("#repayment_plan").append(htmlStr);
			$("#deferral_money").val("");
			$("#deferral_time").val("");
			$("#deferral_plan_modal").modal("hide");
		j++;
	}
	function Select2Test() {
		$("#product_state").select2();
	}
</script>