<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.table-caption {
	text-align: left;
	margin-top: 15px;
	margin-bottom: 10px;
	font-size: 16px;
	font-weight: 900;
}

.col-sm-4, .col-sm-8 {
	border: 1px solid #ddd;
	padding: 10px;
}
</style>
<!-- 手机认证模态框（Modal） -->
<div aria-hidden="false" aria-labelledby="authBaseLabel" role="dialog"
	tabindex="-1" id="authBase" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button aria-hidden="true" data-dismiss="modal" class="close"
					type="button">关闭</button>
				<div class="col-sm-3">
					<h3 class="modal-title">个人信息</h3>
				</div>
				<div class="col-sm-3">
					<select id="check_base" name="examine_choice_people">
						<option value="">审核信息</option>
						<option value="">审核通过</option>
						<option value="">审核未通过</option>
					</select>
				</div>
				 <div class="clearfix"></div>
			</div>
			<div class="modal-body">
				<div class="div div-bordered">
					<div class="table-caption">个人信息</div>
					<div class="col-sm-4">学历</div>
					<div class="col-sm-8">本科</div>

					<div class="col-sm-4">婚姻</div>
					<div class="col-sm-8">已婚</div>

					<div class="col-sm-4">子女个数</div>
					<div class="col-sm-8">2</div>


					<div class="col-sm-4">居住城市</div>
					<div class="col-sm-8">浙江-绍兴</div>


					<div class="col-sm-4">常住地址</div>
					<div class="col-sm-8">柯桥区xxx</div>


					<div class="col-sm-4">居住时长</div>
					<div class="col-sm-8">2年以上</div>


					<div class="col-sm-4">qq</div>
					<div class="col-sm-8">64617##！</div>


					<div class="col-sm-4">电子邮箱</div>
					<div class="col-sm-8">64617##！@qq.com</div>
				</div>
				<div class="clearfix"></div>
				<div class="div div-bordered">
					<div class="table-caption">职业信息</div>
					<div class="col-sm-4">职业</div>
					<div class="col-sm-8">设计师</div>

					<div class="col-sm-4">月收入</div>
					<div class="col-sm-8">2000~4000</div>

					<div class="col-sm-4">单位名称</div>
					<div class="col-sm-8">xxx</div>

					<div class="col-sm-4">所在省市</div>
					<div class="col-sm-8">浙江绍兴</div>

					<div class="col-sm-4">单位地址</div>
					<div class="col-sm-8">xx</div>

					<div class="col-sm-4">单位电话</div>
					<div class="col-sm-8">xx</div>
				</div>
				<div class="clearfix"></div>
				<div class="div div-bordered">
					<div class="table-caption">紧急联系人</div>

					<div class="col-sm-4">亲属关系</div>
					<div class="col-sm-8">兄弟姐妹</div>

					<div class="col-sm-4">联系方式</div>
					<div class="col-sm-8">13123411235</div>

					<div class="col-sm-4">社会关系</div>
					<div class="col-sm-8">同事</div>

					<div class="col-sm-4">联系方式</div>
					<div class="col-sm-8">13123411234</div>
				</div>
				<div class="clearfix"></div>
				<div class="div div-bordered">
					<div class="table-caption">认证时间</div>

					<div class="col-sm-4">提交时间</div>
					<div class="col-sm-8">2017-06-26 14:11</div>

					<div class="col-sm-4">通过时间</div>
					<div class="col-sm-8">2017-06-26 14:11</div>

					<div class="col-sm-4">操作人</div>
					<div class="col-sm-8">王丽</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</div>
<!-- 模态框（Modal） -->
<script>
	$("#check_base").select2();
</script>