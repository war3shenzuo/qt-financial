<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!--pickers css-->
<link rel="stylesheet" type="text/css"
	href="${ctx}/common/js/bootstrap-datepicker/css/datepicker-custom.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/common/js/bootstrap-timepicker/css/timepicker.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/common/js/bootstrap-colorpicker/css/colorpicker.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/common/js/bootstrap-daterangepicker/daterangepicker-bs3.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/common/js/bootstrap-datetimepicker/css/datetimepicker-custom.css" />

<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>清投金服</a></li>
	<li><a href="javascript:void(0)"
		onclick="LoadAjaxContent('${pageContext.request.contextPath}/view/coupon_info', 'wrapper');">优惠券管理</a></li>
	<li class="active">新增优惠券</li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">新增优惠券</header>
			<div class="panel-body">
				<form class="cmxform form-horizontal adminex-form" role="form"
					method="POST" id="couponForm" action="">
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">批号：</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="code"
								id="coupon_batch">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">券面金额：</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="amount"
								id="coupon_money">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">优惠券数量：</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="limitAmount"
								id="coupon_number">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">优惠券描述：</label>
						<div class="col-sm-6">
							<textarea name="comment" class="form-control" rows="6"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">可见等级：</label>
						<div class="col-sm-6">
							<div class="col-sm-3">
								<div class="checkbox-inline">
									<label> <input name="limituserLevel" type="checkbox"
										class="type3" id="" value="1">青铜会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="checkbox-inline">
									<label> <input name="limituserLevel" type="checkbox"
										class="type3" id="" value="2">白银会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="checkbox-inline">
									<label> <input name="limituserLevel" type="checkbox"
										class="type3" id="" value="3">黄金会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="checkbox-inline">
									<label> <input name="limituserLevel" type="checkbox"
										class="type3" id="" value="4">铂金会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="checkbox-inline">
									<label> <input name="limituserLevel" type="checkbox"
										class="type3" id="" value="5">钻石会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="checkbox-inline">
									<label> <input name="limituserLevel" type="checkbox"
										class="type3" id="" value="6">荣耀会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="checkbox-inline">
									<label> <input name="limituserLevel" type="checkbox"
										class="type3" id="" value="7">特约会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">可使用产品：</label>
						<div class="col-sm-6">
							<div class="col-sm-3">
								<div class="checkbox-inline">
									<label> <input name="limitProduct" type="checkbox"
										class="type3" id="" value="1">青铜会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="checkbox-inline">
									<label> <input name="limitProduct" type="checkbox"
										class="type3" id="" value="2">白银会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="checkbox-inline">
									<label> <input name="limitProduct" type="checkbox"
										class="type3" id="" value="3">黄金会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="checkbox-inline">
									<label> <input name="limitProduct" type="checkbox"
										class="type3" id="" value="4">铂金会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="checkbox-inline">
									<label> <input name="limitProduct" type="checkbox"
										class="type3" id="" value="5">钻石会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="checkbox-inline">
									<label> <input name="limitProduct" type="checkbox"
										class="type3" id="" value="6">荣耀会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="checkbox-inline">
									<label> <input name="limitProduct" type="checkbox"
										class="type3" id="" value="7">特约会员<i
										class="fa fa-square-o"></i></label>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">有效期限：</label>
						<div class="col-sm-6">
							<div class="input-group input-large custom-date-range"
								data-date-format="yyyy-mm-dd">
								<input type="text" class="form-control dpd1" name="createdAt">
								<span class="input-group-addon">To</span> <input type="text"
									class="form-control dpd2" name="updatedAt">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">使用状态：</label>
						<div class="col-sm-6">
							<select id="coupon_state" name="createdBy">
								<option value="1">使用中</option>
								<option value="2">冻结中</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<div class="col-lg-offset-4 col-lg-8">
							<button class="btn btn-default" data-dismiss="modal"
								style="padding: 6px 50px; margin-right: 20px;">取消</button>
							<button class="btn btn-primary" type="submit"
								style="padding: 6px 50px;">提交</button>
						</div>
					</div>
				</form>
			</div>
		</section>
	</div>
</div>

<!--datepicker pickers plugins-->
<script type="text/javascript"
	src="${ctx}/common/js/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript"
	src="${ctx}/common/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript"
	src="${ctx}/common/js/bootstrap-daterangepicker/moment.min.js"></script>
<script type="text/javascript"
	src="${ctx}/common/js/bootstrap-daterangepicker/daterangepicker.js"></script>
<script type="text/javascript"
	src="${ctx}/common/js/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
<script type="text/javascript"
	src="${ctx}/common/js/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
<!--pickers initialization-->
<script src="${ctx}/common/js/pickers-init.js"></script>

<!-- 阿里云上传-->
<script type="text/javascript"
	src="${ctx}/common/js/chronic/lib/crypto1/crypto/crypto.js"></script>
<script type="text/javascript"
	src="${ctx}/common/js/chronic/lib/crypto1/hmac/hmac.js"></script>
<script type="text/javascript"
	src="${ctx}/common/js/chronic/lib/crypto1/sha1/sha1.js"></script>
<script type="text/javascript"
	src="${ctx}/common/js/chronic/lib/base64.js"></script>
<script type="text/javascript"
	src="${ctx}/common/js/chronic/lib/plupload-2.1.2/js/plupload.full.min.js"></script>
<script type="text/javascript" src="${ctx}/common/js/chronic/upload.js"></script>
<script type="text/javascript"
	src="${ctx}/common/js/chronic/picUpdateAndShow.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		scrollTo(0, 0);
		$('#couponForm').bootstrapValidator({
			submitHandler : function(validator, form, submitButton) {
				var url = "${pageContext.request.contextPath}/data/coupon/add";//或form.attr('action')
				var param = form.serialize();//或者form.serialize()
				submitAjaxData(url, param, callback);
				function callback(data) {
					LoadAjaxContent('coupon_info', 'wrapper');
				}
			},
			feedbackIcons : {
				valid : 'fa fa-check',
				invalid : 'fa fa-times',
				validating : 'fa fa-times'
			},
			message : 'This value is not valid',
			fields : {
				code : {
					validators : {
						notEmpty : {
							message : '批号不能为空'
						},
						regexp : {/* 只需加此键值对，包含正则表达式，和提示 */
							regexp : /^[a-z0-9]{5}$/,
							message : '只能是五位，数字0-9或字母a-z'
						}
					}
				},
				amount : {
					validators : {
						notEmpty : {
							message : '券面金额不能为空'
						},
						regexp : {/* 只需加此键值对，包含正则表达式，和提示 */
							regexp : /^[0-9]+$/,
							message : '只能是数字0-9'
						}
					}
				},
				limitAmount : {
					validators : {
						notEmpty : {
							message : '优惠码数量不能为空'
						},
						regexp : {/* 只需加此键值对，包含正则表达式，和提示 */
							regexp : /^[0-9]+$/,
							message : '只能是数字0-9'
						},
						lessThan : {
							value : 10000,
							message : '可见码体数量最大数量10000'
						},
						greaterThan : {
							value : 1,
							inclusive : false,
							message : '可见码体数量最小数量1'
						}
					}
				},
				coupon_explain : {
					validators : {
						notEmpty : {
							message : '优惠券描述不能为空'
						}
					}
				}
			}
		});
		Select2Test();
	});
	function Select2Test() {
		$("#coupon_state").select2();
	}
</script>
