<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!--index_info-->
<link href="${ctx}/common/css/index_info.css" rel="stylesheet">
<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>清投金服</a></li>
	<li><a href="javascript:void(0)" onclick="LoadAjaxContent('${pageContext.request.contextPath}/view/customer_info', 'wrapper');">客户管理</a></li>
	<li class="active">客户信息</li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">客户信息 </header>
			<div class="panel-body">
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
								<div class="row examine-news">
									<span>总借款：</span><span>1000元</span><span>总还款：</span><span>900元</span>
									<span>总逾期：</span><span>6次</span><span>总逾期：</span><span>4天</span>
								</div>
							</div>
						</div>
						<div class="row" style="margin-top: 15px;">
							<div class="col-sm-1 text-center" style="line-height: 34px;">认证情况：</div>
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
							<div class="col-sm-1 text-center" style="line-height: 34px;">相关数据：</div>
							<div class="col-sm-11">
								<div class="row examine-news">
									<span class="risk_low">低风险</span><span class="risk_medium">中风险</span><span class="risk_height">高风险</span>
									<span>借贷通信用分：</span><span>211</span><span>支付宝信用分：</span><span>421</span>
									<button type="button" class="btn btn-default"
										style="float: right; margin-right: 15px;">查看资信报告</button>
								</div>
							</div>
						</div>
                	</div>
                </div>
			</div>
		</section>
		<section class="panel">
			<header class="panel-heading">手机认证</header>
			<div class="panel-body">
                <div class="examine-content">
                	<div class="examine-box" style="box-shadow: none; margin-top: 0px;">
						<div class="row">
							<table class="table table-bordered">
								<caption>手机信息</caption>
								<tbody>
									<tr>
										<td>手机号</td>
										<td>13711232145</td>
									</tr>
								</tbody>
							</table>
							<table class="table table-bordered">
								<caption>认证时间</caption>
								<tbody>
									<tr>
										<td>提交时间</td>
										<td>2017-06-26 14:11</td>
									</tr>
									<tr>
										<td>通过时间</td>
										<td>2017-06-26 14:11</td>
									</tr>
									<tr>
										<td>操作人</td>
										<td>无</td>
									</tr>
								</tbody>
							</table>
						</div>
                	</div>
                </div>
			</div>
		</section>
		<section class="panel">
			<header class="panel-heading">个人信息
			<div class="col-sm-1 pull-right" style="margin-top: -6px; padding-right: 0px;">
				<select id="news_state_personal" name="news_state" disabled>
					<option value="">信息审核</option>
					<option value="">信息通过</option>
					<option value="">信息驳回</option>
				</select>
			</div>
			</header>
			<div class="panel-body">
                <div class="examine-content">
                	<div class="examine-box" style="box-shadow: none; margin-top: 0px;">
						<div class="row">
							
							<div class="div div-bordered">
								<div class="table-caption">
									个人信息
								</div>
								<div class="div-table-box">
									<div class="col-sm-4 div-table-boxs">学历</div>
									<div class="col-sm-8 div-table-boxs">本科</div>
				
									<div class="col-sm-4 div-table-boxs">婚姻</div>
									<div class="col-sm-8 div-table-boxs">已婚</div>
				
									<div class="col-sm-4 div-table-boxs">子女个数</div>
									<div class="col-sm-8 div-table-boxs">2</div>
				
				
									<div class="col-sm-4 div-table-boxs">居住城市</div>
									<div class="col-sm-8 div-table-boxs">浙江-绍兴</div>
				
				
									<div class="col-sm-4 div-table-boxs">常住地址</div>
									<div class="col-sm-8 div-table-boxs">柯桥区xxx</div>
				
				
									<div class="col-sm-4 div-table-boxs">居住时长</div>
									<div class="col-sm-8 div-table-boxs">2年以上</div>
				
				
									<div class="col-sm-4 div-table-boxs">qq</div>
									<div class="col-sm-8 div-table-boxs">64617##！</div>
				
				
									<div class="col-sm-4 div-table-boxs">电子邮箱</div>
									<div class="col-sm-8 div-table-boxs">64617##！@qq.com</div>
								</div>
							</div>
							<div class="clearfix"></div>
							<div class="div div-bordered">
								<div class="table-caption">
									职业信息
								</div>
								<div class="div-table-box">
									<div class="col-sm-4 div-table-boxs">职业</div>
									<div class="col-sm-8 div-table-boxs">设计师</div>
				
									<div class="col-sm-4 div-table-boxs">月收入</div>
									<div class="col-sm-8 div-table-boxs">2000~4000</div>
				
									<div class="col-sm-4 div-table-boxs">单位名称</div>
									<div class="col-sm-8 div-table-boxs">xxx</div>
				
									<div class="col-sm-4 div-table-boxs">所在省市</div>
									<div class="col-sm-8 div-table-boxs">浙江绍兴</div>
				
									<div class="col-sm-4 div-table-boxs">单位地址</div>
									<div class="col-sm-8 div-table-boxs">xx</div>
				
									<div class="col-sm-4 div-table-boxs">单位电话</div>
									<div class="col-sm-8 div-table-boxs">xx</div>
								</div>
								
							</div>
							<div class="clearfix"></div>
							<div class="div div-bordered">
								<div class="table-caption">紧急联系人
								</div>
								<div class="div-table-box">
									<div class="col-sm-4 div-table-boxs">亲属关系</div>
									<div class="col-sm-8 div-table-boxs">兄弟姐妹</div>
				
									<div class="col-sm-4 div-table-boxs">联系方式</div>
									<div class="col-sm-8 div-table-boxs">13123411235</div>
				
									<div class="col-sm-4 div-table-boxs">社会关系</div>
									<div class="col-sm-8 div-table-boxs">同事</div>
				
									<div class="col-sm-4 div-table-boxs">联系方式</div>
									<div class="col-sm-8 div-table-boxs">13123411234</div>
								</div>
							</div>
							<div class="clearfix"></div>
							<div class="div div-bordered">
								<div class="table-caption">
									认证时间
								</div>
								<div class="div-table-box">
									<div class="col-sm-4 div-table-boxs">提交时间</div>
									<div class="col-sm-8 div-table-boxs">2017-06-26 14:11</div>
				
									<div class="col-sm-4 div-table-boxs">通过时间</div>
									<div class="col-sm-8 div-table-boxs">2017-06-26 14:11</div>
				
									<div class="col-sm-4 div-table-boxs">操作人</div>
									<div class="col-sm-8 div-table-boxs">王丽</div>
								</div>
							</div>
						</div>
                	</div>
                </div>
			</div>
		</section>
		<section class="panel">
			<header class="panel-heading">身份证认证
			<div class="col-sm-1 pull-right" style="margin-top: -6px; padding-right: 0px;">
				<select id="news_state_id" name="news_state" disabled>
					<option value="">信息审核</option>
					<option value="">信息通过</option>
					<option value="">信息驳回</option>
				</select>
			</div>
			</header>
			<div class="panel-body">
                <div class="examine-content">
                	<div class="examine-box" style="box-shadow: none; margin-top: 0px;">
						<div class="row">
							<table class="table table-bordered">
								<caption>自动认证</caption>
								<tbody>
									<tr>
										<td>身份证</td>
										<td>图</td>
									</tr>
									<tr>
										<td>人脸</td>
										<td>图</td>
									</tr>
										<tr>
										<td>提交时间</td>
										<td>207-06-26 14:11</td>
									</tr>
									<tr>
										<td>通过时间</td>
										<td>207-06-26 14:11</td>
									</tr>
								</tbody>
							</table>
							<table class="table table-bordered">
								<caption>人工审核</caption>
								<tbody>
									<tr>
										<td>身份证</td>
										<td>图</td>
									</tr>
									<tr>
										<td>人脸</td>
										<td>图</td>
									</tr>
										<tr>
										<td>提交时间</td>
										<td>207-06-26 14:11</td>
									</tr>
									<tr>
										<td>通过时间</td>
										<td>207-06-26 14:11</td>
									</tr>
									<tr>
										<td>操作人</td>
										<td>王丽</td>
									</tr>
								</tbody>
							</table>
						</div>
                	</div>
                </div>
			</div>
		</section>
		<section class="panel">
			<header class="panel-heading">微信认证
			<div class="col-sm-1 pull-right" style="margin-top: -6px; padding-right: 0px;">
				<select id="news_state_wx" name="news_state" disabled>
					<option value="">信息审核</option>
					<option value="">信息通过</option>
					<option value="">信息驳回</option>
				</select>
			</div>
			</header>
			<div class="panel-body">
                <div class="examine-content">
                	<div class="examine-box" style="box-shadow: none; margin-top: 0px;">
						<div class="row">
							<table class="table table-bordered">
								<caption>自动认证</caption>
								<tbody>
									<tr>
										<td>微信头像</td>
										<td>图</td>
									</tr>
								</tbody>
							</table>
							<table class="table table-bordered">
								<caption>认证时间</caption>
								<tbody>
									<tr>
										<td>提交时间</td>
										<td>2017-06-26 14:11</td>
									</tr>
									<tr>
										<td>通过时间</td>
										<td>2017-06-26 14:11</td>
									</tr>
									<tr>
										<td>操作人</td>
										<td>无</td>
									</tr>
								</tbody>
							</table>
						</div>
                	</div>
                </div>
			</div>
		</section>
		<section class="panel">
			<header class="panel-heading">授权通讯录
			<div class="col-sm-1 pull-right" style="margin-top: -6px; padding-right: 0px;">
				<select id="news_state_contact" name="news_state" disabled>
					<option value="">信息审核</option>
					<option value="">信息通过</option>
					<option value="">信息驳回</option>
				</select>
			</div>
			</header>
			<div class="panel-body">
                <div class="examine-content">
                	<div class="examine-box" style="box-shadow: none; margin-top: 0px;">
						<div class="row">
							<table class="table table-bordered">
								<caption>通讯录信息</caption>
								<tbody>
									<tr>
										<td>爸爸</td>
										<td>13711232145</td>
									</tr>
									<tr>
										<td>妈妈</td>
										<td>13711232145</td>
									</tr>
									<tr>
										<td>王超</td>
										<td>13711232145</td>
									</tr>
									<tr>
										<td>姐姐</td>
										<td>13711232145</td>
									</tr>
								</tbody>
							</table>
							<table class="table table-bordered">
								<caption>认证时间</caption>
								<tbody>
									<tr>
										<td>提交时间</td>
										<td>2017-06-26 14:11</td>
									</tr>
									<tr>
										<td>通过时间</td>
										<td>2017-06-26 14:11</td>
									</tr>
									<tr>
										<td>操作人</td>
										<td>无</td>
									</tr>
								</tbody>
							</table>
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
		$("#examine_result").select2();
		$("#news_state_personal").select2();
		$("#news_state_id").select2();
		$("#news_state_wx").select2();
		$("#news_state_contact").select2();
	}
</script>