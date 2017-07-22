<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>清投金服</a></li>
	<li><a href="javascript:void(0)" onclick="LoadAjaxContent('${pageContext.request.contextPath}/view/banner_info', 'wrapper');">活动管理</a></li>
	<li class="active">编辑banner </li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">编辑banner</header>
			<div class="panel-body">
				<form class="cmxform form-horizontal adminex-form" role="form"
					method="POST" id="bannerForm" action="">
					<input type="hidden" value="${param.id}" name="id" id="id">
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">添加封面：</label>
						<div class="col-sm-3">
							<img id="preview" class="img-rounded" style="max-width: 300px;"
								src=""
								onerror="this.src='${pageContext.request.contextPath}/common/img/no_pic200.png'"
								alt="" /> <input type="hidden" name="pic" id="pic" value=""
								class="margin-top-15">
						</div>
						<div class="col-sm-3">
							<div id="container">
								<a id="selectfiles" href="javascript:void(0);" class='btn'
									style="border: 1px solid;">选择文件</a> <a id="postfiles"
									href="javascript:void(0);" class='btn' style="display: none">开始上传</a>
							</div>
							<div id="ossfile"></div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">活动链接：</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="url" id="url">
						</div>
					</div>
					<div class="form-group">
                        <div class="col-lg-offset-4 col-lg-8">
                        	<button class="btn btn-default" data-dismiss="modal" style="padding: 6px 50px; margin-right: 20px;">取消</button>
							<button class="btn btn-primary" type="submit" style="padding: 6px 50px;">提交</button>
						</div>
                    </div>
				</form>
			</div>
		</section>
	</div>
</div>

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
		scrollTo(0,0);
		//阿里云上传
		uploadInit('', 'selectfiles', 'container', 'ossfile',
				'postfiles', 'pic', 'preview');
		Select2Test();
		
		$('#bannerForm').bootstrapValidator({
			submitHandler : function(validator, form,
					submitButton) {
				var url = "${pageContext.request.contextPath}/data/banner/edit";//或form.attr('action')
				var param = form.serialize();//或者form.serialize()
				submitAjaxData(url, param, callback);
				function callback(data) {
					LoadAjaxContent('banner_info','wrapper');
				}
			},
			feedbackIcons : {
				valid : 'fa fa-check',
				invalid : 'fa fa-times',
				validating : 'fa fa-times'
			},
			message : 'This value is not valid',
			fields : {
				pic : {
					validators : {
						notEmpty : {
							message : '图片不能为空'
						}
					}
				},
				url : {
					validators : {
						notEmpty : {
							message : '链接不能为空'
						}
					}
				}
			}
		});
	});
	function Select2Test() {
		$("#activity_state").select2();
	}
</script>
