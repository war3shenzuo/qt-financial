<%@ page language="java" contentType="text/html; charset=utf-8"
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
					<div class="form-group">
						<label class="col-sm-2 control-label">前段排序号：</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="number" id="number">
						</div>
						<label class="col-sm-2 control-label">产品名称：</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="name" id="name">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">借款金额：</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="money" id="money">
						</div>
						<label class="col-sm-2 control-label">借款时长：</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="time" id="time">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">信用审核费/元：</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="money2" id="money2">
						</div>
						<label class="col-sm-2 control-label">资产保管：</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="money3" id="money3">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">可见等级：</label>
						<div class="col-sm-10">
							<div class="col-sm-2">
								<div class="checkbox-inline">
									<label> <input name="peoplegrade" type="checkbox"
										class="type3" id="" value="">青铜会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
							<div class="col-sm-2">
								<div class="checkbox-inline">
									<label> <input name="peoplegrade" type="checkbox"
										class="type3" id="" value="">白银会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
							<div class="col-sm-2">
								<div class="checkbox-inline">
									<label> <input name="peoplegrade" type="checkbox"
										class="type3" id="" value="">黄金会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
							<div class="col-sm-2">
								<div class="checkbox-inline">
									<label> <input name="peoplegrade" type="checkbox"
										class="type3" id="" value="">铂金会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
							<div class="col-sm-2">
								<div class="checkbox-inline">
									<label> <input name="peoplegrade" type="checkbox"
										class="type3" id="" value="">钻石会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
							<div class="col-sm-2">
								<div class="checkbox-inline">
									<label> <input name="peoplegrade" type="checkbox"
										class="type3" id="" value="">荣耀会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
							<div class="col-sm-2">
								<div class="checkbox-inline">
									<label> <input name="peoplegrade" type="checkbox"
										class="type3" id="" value="">特约会员<i
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
									<label> <input name="borrowgrade" type="checkbox"
										class="type3" id="" value="s">青铜会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
							<div class="col-sm-2">
								<div class="checkbox-inline">
									<label> <input name="borrowgrade" type="checkbox"
										class="type3" id="" value="">白银会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
							<div class="col-sm-2">
								<div class="checkbox-inline">
									<label> <input name="borrowgrade" type="checkbox"
										class="type3" id="" value="">黄金会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
							<div class="col-sm-2">
								<div class="checkbox-inline">
									<label> <input name="borrowgrade" type="checkbox"
										class="type3" id="" value="">铂金会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
							<div class="col-sm-2">
								<div class="checkbox-inline">
									<label> <input name="borrowgrade" type="checkbox"
										class="type3" id="" value="">钻石会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
							<div class="col-sm-2">
								<div class="checkbox-inline">
									<label> <input name="borrowgrade" type="checkbox"
										class="type3" id="" value="">荣耀会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
							<div class="col-sm-2">
								<div class="checkbox-inline">
									<label> <input name="borrowgrade" type="checkbox"
										class="type3" id="" value="">特约会员<i
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
							<input type="text" class="form-control" name="money4" id="money4">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">还款计划：</label>
						<div class="col-sm-3">
							<div id="repayment_plan">
								<div class="col-sm-6 repayment_plan_box">还款金额</div>
								<div class="col-sm-6 repayment_plan_box">还款日（/日后）</div>
							</div>
							
							<a class="btn btn-success" onclick="repaymentAdd()" style="margin-top: 20px;">新增还款计划 <i class="fa fa-plus"></i></a>
						</div>
						<label class="col-sm-2 control-label">延期计划：</label>
						<div class="col-sm-3">
							<div id="deferral_plan">
								<div class="col-sm-6 deferral_plan_box">延期金额</div>
								<div class="col-sm-6 deferral_plan_box">延期时长/天</div>
							</div>
							
							<a class="btn btn-success" onclick="deferralAdd()" style="margin-top: 20px;">新增延期计划 <i class="fa fa-plus"></i></a>
						</div>
					</div>
					<div class="form-group">
						<div class="col-lg-offset-6 col-lg-10">
							<button class="btn btn-primary" type="button"
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
	});
	//新建还款计划
	function repaymentAdd(){
		$("#repayment_plan_modal").modal("show");
	}
	//新建延期计划
	function deferralAdd(){
		$("#deferral_plan_modal").modal("show");
	}
	function Select2Test() {
		$("#product_state").select2();
	}
</script>