<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!--index_info-->
<link href="${ctx}/common/css/index_info.css" rel="stylesheet">
<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>清投金服</a></li>
	<li class="active">借款审核</li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">等待复审 </header>
			<div class="panel-body">
				<div class="col-sm-2" style="padding-left: 0;">
                    <select id="examine_choice" name="examine_choice">
						<option value="">选择审核员</option>
					</select>
                </div>
                <div class="examine-content">
                	<div class="examine-box">
						<div class="row">
							<div class="col-sm-1">
								<img alt="" src="${ctx}/common/img/no_pic200.png" onerror="this.src='${ctx }/common/img/no_pic200.png'" 
								style="width: 100%; height: auto; max-height: 150px; min-width: 70px;  border-radius: 50%; border: 1px solid #eee;">
							</div>
							<div class="col-sm-11">
								<div class="row examine-news">
									<span>ID:</span><span>12313241432412341324</span>
									<span>电话：</span><span>13737373737</span>
									<span>普通客户</span><span>|</span><a href="#" onclick="showBorrowList()">查看借款记录</a>
								</div>
								<div class="row examine-news">
									<span>申请借款：</span><span class="loan-amount">1000元</span><span>申请时间：</span><span>2017年06月26日 14:13</span>
								</div>
							</div>
						</div>
						<div class="row" style="margin-top: 15px;">
							<div class="col-sm-1 text-left" style="line-height: 34px;">认证情况：</div>
							<div class="col-sm-11">
								<div class="row">
									<button type="button" class="btn btn-default btn-success"
										onclick="showAuthPhone()">手机认证</button>
									<button type="button" class="btn btn-default btn-warning"
										onclick="showAuthBase()">个人信息</button>
									<button type="button" class="btn btn-default btn-success" onclick="showAuthId()">身份证认证</button>
									<button type="button" class="btn btn-default btn-success">银行卡认证</button>
									<button type="button" class="btn btn-default btn-info" onclick="showAuthWx()">微信认证</button>
									<button type="button" class="btn btn-default btn-info"
										onclick="showAuthContact()">授权通讯录</button>
									<button type="button" class="btn btn-default btn-info">支付宝认证</button>
									<button type="button" class="btn btn-default btn-info">京东认证</button>
									<button type="button" class="btn btn-default btn-info">问卷认证</button>
									<button type="button" class="btn btn-default btn-info">学信认证</button>
								</div>
							</div>
						</div>
						<div class="row" style="margin-top: 15px;">
							<div class="col-sm-1 text-left" style="line-height: 34px;">相关数据：</div>
							<div class="col-sm-11">
								<div class="row examine-news">
									<span class="risk_low">低风险</span><span class="risk_medium">中风险</span><span class="risk_height">高风险</span>
									<span>借贷通信用分：</span><span>211</span><span>支付宝信用分：</span><span>421</span>
									<button type="button" class="btn btn-default"
										style="float: right; margin-right: 15px;">查看资信报告</button>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-1 text-left" style="line-height: 34px;">初审结果：</div>
							<div class="col-sm-11">
								<div class="row examine-news">
									<span>同意申请</span><span>初审评语：</span><span>除家庭信息外，信息确认无误，可以复审</span><span>操作员：</span><span>王丽</span>
								</div>
							</div>
						</div>
						<div class="row" style="margin-top: 15px;">
							<div class="form-group">
		                        <label class="col-sm-1 text-left control-label" style="line-height: 34px;">复审评语：</label>
		                        <div class="col-sm-8" style="padding: 0px;">
		                            <input type="text" class="form-control">
		                        </div>
		                        <div class="col-sm-3">
									<button type="button" class="btn btn-default btn-danger"
										style="float: right; margin-left: 15px;">拒绝申请</button>
									<button type="button" class="btn btn-default btn-success"
										style="float: right; margin-left: 15px;">同意申请</button>
								</div>
		                    </div>
						</div>
                	</div>
                	<div class="examine-box">
						<div class="row">
							<div class="col-sm-1">
								<img alt="" src="${ctx}/common/img/no_pic200.png" onerror="this.src='${ctx }/common/img/no_pic200.png'" 
								style="width: 100%; height: auto; max-height: 150px; min-width: 70px;  border-radius: 50%; border: 1px solid #eee;">
							</div>
							<div class="col-sm-11">
								<div class="row examine-news">
									<span>ID:</span><span>12313241432412341324</span>
									<span>电话：</span><span>13737373737</span>
									<span>普通客户</span><span>|</span><a href="#" onclick="showBorrowList()">查看借款记录</a>
								</div>
								<div class="row examine-news">
									<span>申请借款：</span><span class="loan-amount">1000元</span><span>申请时间：</span><span>2017年06月26日 14:13</span>
								</div>
							</div>
						</div>
						<div class="row" style="margin-top: 15px;">
							<div class="col-sm-1 text-left" style="line-height: 34px;">认证情况：</div>
							<div class="col-sm-11">
								<div class="row">
									<button type="button" class="btn btn-default btn-success"
										onclick="showAuthPhone()">手机认证</button>
									<button type="button" class="btn btn-default btn-warning"
										onclick="showAuthBase()">个人信息</button>
									<button type="button" class="btn btn-default btn-success" onclick="showAuthId()">身份证认证</button>
									<button type="button" class="btn btn-default btn-success">银行卡认证</button>
									<button type="button" class="btn btn-default btn-info" onclick="showAuthWx()">微信认证</button>
									<button type="button" class="btn btn-default btn-info"
										onclick="showAuthContact()">授权通讯录</button>
									<button type="button" class="btn btn-default btn-info">支付宝认证</button>
									<button type="button" class="btn btn-default btn-info">京东认证</button>
									<button type="button" class="btn btn-default btn-info">问卷认证</button>
									<button type="button" class="btn btn-default btn-info">学信认证</button>
								</div>
							</div>
						</div>
						<div class="row" style="margin-top: 15px;">
							<div class="col-sm-1 text-left" style="line-height: 34px;">相关数据：</div>
							<div class="col-sm-11">
								<div class="row examine-news">
									<span class="risk_low">低风险</span><span class="risk_medium">中风险</span><span class="risk_height">高风险</span>
									<span>胡泊信用分：</span><span>211</span><span>支付宝信用分：</span><span>421</span>
									<button type="button" class="btn btn-default"
										style="float: right; margin-right: 15px;">查看资信报告</button>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-1 text-left" style="line-height: 34px;">初审结果：</div>
							<div class="col-sm-11">
								<div class="row examine-news">
									<span>同意申请</span><span>初审评语：</span><span>除家庭信息外，信息确认无误，可以复审</span><span>操作员：</span><span>王丽</span>
								</div>
							</div>
						</div>
						<div class="row" style="margin-top: 15px;">
							<div class="form-group">
		                        <label class="col-sm-1 text-left control-label" style="line-height: 34px;">复审评语：</label>
		                        <div class="col-sm-8" style="padding: 0px;">
		                            <input type="text" class="form-control">
		                        </div>
		                        <div class="col-sm-3">
									<button type="button" class="btn btn-default btn-danger"
										style="float: right; margin-left: 15px;">拒绝申请</button>
									<button type="button" class="btn btn-default btn-success"
										style="float: right; margin-left: 15px;">同意申请</button>
								</div>
		                    </div>
						</div>
                	</div>
                </div>
			</div>
		</section>
	</div>
</div>

<div id="auth_phone"></div>
<div id="auth_base"></div>
<div id="auth_id"></div>
<div id="auth_wx"></div>
<div id="auth_contact"></div>
<div id="borrow_list"></div>

<script src="${ctx}/common/js/index_info.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		scrollTo(0,0);
		var url = "${pageContext.request.contextPath}/view/modal/auth_phone";
		LoadAjaxContent(url, "auth_phone");
		var url = "${pageContext.request.contextPath}/view/modal/auth_base";
		LoadAjaxContent(url, "auth_base");
		var url = "${pageContext.request.contextPath}/view/modal/auth_id";
		LoadAjaxContent(url, "auth_id");
		var url = "${pageContext.request.contextPath}/view/modal/auth_wx";
		LoadAjaxContent(url, "auth_wx");
		var url = "${pageContext.request.contextPath}/view/modal/auth_contact";
		LoadAjaxContent(url, "auth_contact");
		var url = "${pageContext.request.contextPath}/view/modal/borrow_list";
		LoadAjaxContent(url, "borrow_list");
		
		Select2Test();
	});
	function Select2Test() {
		$("#examine_choice").select2();
	}
</script>