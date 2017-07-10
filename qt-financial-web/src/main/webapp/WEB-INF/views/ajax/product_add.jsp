<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<h2>新增产品</h2>

<form class="cmxform form-horizontal adminex-form" role="form"
	method="POST" id="doctorBaseForm" action="#"
	enctype="multipart/form-data">
	<div class="form-group">
		<label class="col-sm-2 control-label">前段排序号：</label>
		<div class="col-sm-3">
			<input type="text" class="form-control" name="name" id="name">
		</div>
		<label class="col-sm-2 control-label">产品名称：</label>
		<div class="col-sm-3">
			<input type="text" class="form-control" name="name" id="name">
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label">借款金额：</label>
		<div class="col-sm-3">
			<input type="text" class="form-control" name="name" id="name">
		</div>
		<label class="col-sm-2 control-label">借款时长：</label>
		<div class="col-sm-3">
			<input type="text" class="form-control" name="name" id="name">
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label">信用审核费/元：</label>
		<div class="col-sm-3">
			<input type="text" class="form-control" name="name" id="name">
		</div>
		<label class="col-sm-2 control-label">资产保管：</label>
		<div class="col-sm-3">
			<input type="text" class="form-control" name="name" id="name">
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label">可见等级：</label>
		<div class="col-sm-10">
			<div class="col-sm-2">
				<div class="checkbox-inline">
					<label> <input name="sporttype" type="checkbox"
						class="type3" id="" value="慢走">青铜会员<i
						class="fa fa-square-o" style="top: 5px;"></i></label>
				</div>
			</div>
			<div class="col-sm-2">
				<div class="checkbox-inline">
					<label> <input name="sporttype" type="checkbox"
						class="type3" id="" value="快走">白银会员<i
						class="fa fa-square-o" style="top: 5px;"></i></label>
				</div>
			</div>
			<div class="col-sm-2">
				<div class="checkbox-inline">
					<label> <input name="sporttype" type="checkbox"
						class="type3" id="" value="慢跑">黄金会员<i
						class="fa fa-square-o" style="top: 5px;"></i></label>
				</div>
			</div>
			<div class="col-sm-2">
				<div class="checkbox-inline">
					<label> <input name="sporttype" type="checkbox"
						class="type3" id="" value="游泳">铂金会员<i
						class="fa fa-square-o" style="top: 5px;"></i></label>
				</div>
			</div>
			<div class="col-sm-2">
				<div class="checkbox-inline">
					<label> <input name="sporttype" type="checkbox"
						class="type3" id="" value="骑车">钻石会员<i
						class="fa fa-square-o" style="top: 5px;"></i></label>
				</div>
			</div>
			<div class="col-sm-2">
				<div class="checkbox-inline">
					<label> <input name="sporttype" type="checkbox"
						class="type3" id="" value="太极">荣耀会员<i
						class="fa fa-square-o" style="top: 5px;"></i></label>
				</div>
			</div>
			<div class="col-sm-2">
				<div class="checkbox-inline">
					<label> <input name="sporttype" type="checkbox"
						class="type3" id="" value="有氧操">特约会员<i
						class="fa fa-square-o" style="top: 5px;"></i></label>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label">可借等级：</label>
		<div class="col-sm-10">
			<div class="col-sm-2">
				<div class="checkbox-inline">
					<label> <input name="sporttype" type="checkbox"
						class="type3" id="" value="慢走">青铜会员<i
						class="fa fa-square-o" style="top: 5px;"></i></label>
				</div>
			</div>
			<div class="col-sm-2">
				<div class="checkbox-inline">
					<label> <input name="sporttype" type="checkbox"
						class="type3" id="" value="快走">白银会员<i
						class="fa fa-square-o" style="top: 5px;"></i></label>
				</div>
			</div>
			<div class="col-sm-2">
				<div class="checkbox-inline">
					<label> <input name="sporttype" type="checkbox"
						class="type3" id="" value="慢跑">黄金会员<i
						class="fa fa-square-o" style="top: 5px;"></i></label>
				</div>
			</div>
			<div class="col-sm-2">
				<div class="checkbox-inline">
					<label> <input name="sporttype" type="checkbox"
						class="type3" id="" value="游泳">铂金会员<i
						class="fa fa-square-o" style="top: 5px;"></i></label>
				</div>
			</div>
			<div class="col-sm-2">
				<div class="checkbox-inline">
					<label> <input name="sporttype" type="checkbox"
						class="type3" id="" value="骑车">钻石会员<i
						class="fa fa-square-o" style="top: 5px;"></i></label>
				</div>
			</div>
			<div class="col-sm-2">
				<div class="checkbox-inline">
					<label> <input name="sporttype" type="checkbox"
						class="type3" id="" value="太极">荣耀会员<i
						class="fa fa-square-o" style="top: 5px;"></i></label>
				</div>
			</div>
			<div class="col-sm-2">
				<div class="checkbox-inline">
					<label> <input name="sporttype" type="checkbox"
						class="type3" id="" value="有氧操">特约会员<i
						class="fa fa-square-o" style="top: 5px;"></i></label>
				</div>
			</div>
		</div>
	</div>

	<div class="form-group">
		<label class="col-sm-2 control-label">状态：</label>
		<div class="col-sm-10">
			<select id="prescription_degree" name="degree">
				<option value="极轻">极轻</option>
				<option value="很轻">很轻</option>
				<option value="比较轻">比较轻</option>
				<option value="有点用力">有点用力</option>
				<option value="用力">用力</option>
				<option value="很用力">很用力</option>
				<option value="极用力">极用力</option>
			</select>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label">还款计划：</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" name="identity" id="identity"
				value="${map['obj'].identity}">
		</div>
	</div>
	<div class="form-group">
		<div class="col-lg-offset-6 col-lg-10">
			<button class="btn btn-primary" type="button"
				onclick="submit_doctor_base()">提交</button>
		</div>
	</div>
</form>
<script type="text/javascript">
	$(document).ready(function() {

	});
</script>