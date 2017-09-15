<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!--index_info-->
<link href="${ctx}/common/css/index_info.css" rel="stylesheet">
<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>清投金服</a></li>
	<li><a href="javascript:void(0)"
		onclick="LoadAjaxContent('${pageContext.request.contextPath}/view/record_info', 'wrapper');">审核记录</a></li>
	<li class="active">订单详情</li>
</ul>
<input type="hidden" value="${param.id}" id="borrowId"/>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">订单详情 </header>
			<div class="panel-body">
				<div class="col-sm-2">订单${param.id}情况</div>
				<div class="examine-content">
					<div class="examine-box">
						<div class="row">
							<div class="col-sm-2">
								<img alt="" src="${ctx}/common/img/no_pic200.png"
									onerror="this.src='${ctx }/common/img/no_pic200.png'"
									style="width: 100%; height: auto; max-height: 150px; min-width: 70px; border-radius: 50%; border: 1px solid #eee;">
							</div>
							<div class="col-sm-10">
								<div class="row examine-news">
									<span>ID:</span><span id="id">${param.id}</span><span id="truename"></span> <span>电话：</span><span id="usermobile"></span>
									<span>普通客户</span><span>|</span><a href="#"
										onclick="showBorrowList()">查看借款记录</a>
								</div>
								<div class="row examine-news">
									<span>申请借款：</span><span class="loan-amount" id="amount">1000元</span><span>申请时间：</span><span id="applyAt"></span>
								</div>
							</div>
						</div>
						<div class="row" style="margin-top: 15px;">
							<div class="col-sm-2 text-left" style="line-height: 34px;">必要认证：</div>
							<div class="col-sm-10">
								<div class="row">
									<button type="button" class="btn btn-default btn-success"
										onclick="showAuthPhone()">手机认证</button>
									<button type="button" class="btn btn-default btn-success"
										onclick="showAuthBase()">个人信息</button>
									<button type="button" class="btn btn-default btn-success"
										onclick="showAuthId()">身份证认证</button>
									<button type="button" class="btn btn-default btn-success"
										onclick="showAuthId()">银行卡认证</button>
								</div>
							</div>
						</div>
						<div class="row" style="margin-top: 15px;">
							<div class="col-sm-2 text-left" style="line-height: 34px;">选择认证：</div>
							<div class="col-sm-10">
								<div class="row">
									<button type="button" class="btn btn-default btn-info"
										onclick="showAuthWx()">微信认证</button>
									<button type="button" class="btn btn-default btn-info"
										onclick="showAuthContact()">授权通讯录</button>
									<button type="button" class="btn btn-default btn-info">问卷认证</button>
									<button type="button" class="btn btn-default btn-info">淘宝认证</button>
									<button type="button" class="btn btn-default btn-info">学信认证</button>
									<button type="button" class="btn btn-default btn-info">京东认证</button>
								</div>
							</div>
						</div>
						<div class="row" style="margin-top: 15px;">
							<div class="col-sm-2 text-left" style="line-height: 34px;">资信报告：</div>
							<div class="col-sm-10">
								<div class="row examine-news">
									<button type="button" class="btn btn-default"
										style="margin-right: 15px;">查看琥珀资信报告</button>
									<button type="button" class="btn btn-default">查看资信报告</button>
								</div>
							</div>
						</div>
						<div id="result">
							<div class="row" style="margin-top: 15px;">
								<div class="col-sm-2 text-left" style="line-height: 34px;">初审结果：</div>
								<div class="col-sm-10">
									<div class="row examine-news">
										<span>同意申请</span><span>初审评语：</span><span>除家庭信息外，信息确认无误，可以复审</span><span>操作员：</span><span>王丽</span>
									</div>
								</div>
							</div>
							<div class="row" style="margin-top: 15px;">
								<div class="col-sm-2 text-left" style="line-height: 34px;">复审结果：</div>
								<div class="col-sm-10">
									<div class="row examine-news">
										<span>同意申请</span><span>复审评语：</span><span>复审通过，家庭信息问题已解决</span><span>操作员：</span><span>王丽</span>
									</div>
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
		scrollTo(0, 0);
		LoadAjaxData("${pageContext.request.contextPath}/data/borrow/info?id="+$("#borrowId").val(), function(data){
			try{
				$("#amount").html(data.obj.amount);
				$("#applyAt").html(formatBorrowDatetime(data.obj.applyAt));
				$("#truename").html(data.obj.user.truename);
				$("#usermobile").html(data.obj.user.usermobile);
				var htmlStr ='';
				var list = data.obj.borrowMoneyFlow;
				for(var i = 0;i<list.length;i++){
					switch(list[i].status){
					case '2r':
						htmlStr+='	<div class="row" style="margin-top: 15px;">'
							+'<div class="col-sm-2 text-left" style="line-height: 34px;">初审结果：</div>'
							+'<div class="col-sm-10">'
							+	'<div class="row examine-news">'
							+		'<span>初审通过</span><span>&nbsp;&nbsp;|&nbsp;&nbsp;</span><span>'+list[i].comment+'</span>'
							+	'</div>'
							+'</div>'
						+'</div>';
						break;
					case '2e':
						htmlStr+='	<div class="row" style="margin-top: 15px;">'
							+'<div class="col-sm-2 text-left" style="line-height: 34px;">初审结果：</div>'
							+'<div class="col-sm-10">'
							+	'<div class="row examine-news">'
							+		'<span>初审拒绝</span><span>&nbsp;&nbsp;|&nbsp;&nbsp;</span><span>'+list[i].comment+'</span>'
							+	'</div>'
							+'</div>'
						+'</div>';
						break;
					case '3r':
						htmlStr+='	<div class="row" style="margin-top: 15px;">'
							+'<div class="col-sm-2 text-left" style="line-height: 34px;">复审结果：</div>'
							+'<div class="col-sm-10">'
							+	'<div class="row examine-news">'
							+		'<span>复审通过</span><span>&nbsp;&nbsp;|&nbsp;&nbsp;</span><span>'+list[i].comment+'</span>'
							+	'</div>'
							+'</div>'
						+'</div>';
						break;
					case '3e':
						htmlStr+='	<div class="row" style="margin-top: 15px;">'
							+'<div class="col-sm-2 text-left" style="line-height: 34px;">复审结果：</div>'
							+'<div class="col-sm-10">'
							+	'<div class="row examine-news">'
							+		'<span>复审拒绝</span><span>&nbsp;&nbsp;|&nbsp;&nbsp;</span><span>'+list[i].comment+'</span>'
							+	'</div>'
							+'</div>'
						+'</div>';
						break;
					case '4r':
						htmlStr+='	<div class="row" style="margin-top: 15px;">'
							+'<div class="col-sm-2 text-left" style="line-height: 34px;">终审结果：</div>'
							+'<div class="col-sm-10">'
							+	'<div class="row examine-news">'
							+		'<span>终审通过</span><span>&nbsp;&nbsp;|&nbsp;&nbsp;</span><span>'+list[i].comment+'</span>'
							+	'</div>'
							+'</div>'
						+'</div>';
						break;
					case '4e':
						htmlStr+='	<div class="row" style="margin-top: 15px;">'
							+'<div class="col-sm-2 text-left" style="line-height: 34px;">终审结果：</div>'
							+'<div class="col-sm-10">'
							+	'<div class="row examine-news">'
							+		'<span>终审拒绝</span><span>&nbsp;&nbsp;|&nbsp;&nbsp;</span><span>'+list[i].comment+'</span>'
							+	'</div>'
							+'</div>'
						+'</div>';
					case '5r':
						htmlStr+='	<div class="row" style="margin-top: 15px;">'
							+'<div class="col-sm-2 text-left" style="line-height: 34px;">打款情况：</div>'
							+'<div class="col-sm-10">'
							+	'<div class="row examine-news">'
							+		'<span>已打款</span>'
							+	'</div>'
							+'</div>'
						+'</div>';
						break;
					case '5e':
						htmlStr+='	<div class="row" style="margin-top: 15px;">'
							+'<div class="col-sm-2 text-left" style="line-height: 34px;">打款情况：</div>'
							+'<div class="col-sm-10">'
							+	'<div class="row examine-news">'
							+		'<span>未打款</span>'
							+	'</div>'
							+'</div>'
						+'</div>';
						break;
					}
				}
				$("#result").html(htmlStr);
			} catch(arr){
				console.log(arr);
			}
			console.log(data);
		});
		
		LoadAjaxContent("${pageContext.request.contextPath}/view/modal/auth_phone", "auth_phone");
		LoadAjaxContent("${pageContext.request.contextPath}/view/modal/auth_base", "auth_base");
		LoadAjaxContent("${pageContext.request.contextPath}/view/modal/auth_id", "auth_id");
		LoadAjaxContent("${pageContext.request.contextPath}/view/modal/auth_wx", "auth_wx");
		LoadAjaxContent("${pageContext.request.contextPath}/view/modal/auth_contact", "auth_contact");
		LoadAjaxContent("${pageContext.request.contextPath}/view/modal/borrow_list", "borrow_list");
	});
</script>