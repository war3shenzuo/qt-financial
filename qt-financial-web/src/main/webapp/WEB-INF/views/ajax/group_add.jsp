<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>清投金服</a></li>
	<li><a href="javascript:void(0)" onclick="LoadAjaxContent('${pageContext.request.contextPath}/view/group_info', 'wrapper');">客户分组管理</a></li>
	<li class="active">新增分组 </li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">新增分组 </header>
			<div class="panel-body">
				<form class="cmxform form-horizontal adminex-form" role="form"
					method="POST" id="groupForm" action="">
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">客户分组：</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="name" id="group_title"> 
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">分组说明：</label>
						<div class="col-sm-6">
							<textarea name="description" class="form-control" rows="6"></textarea>
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
		$('#groupForm').bootstrapValidator({
			feedbackIcons : {
				valid : 'fa fa-check',
				invalid : 'fa fa-times',
				validating : 'fa fa-times'
			},
			message : 'This value is not valid',
			fields : {
				name : {
					validators : {
						notEmpty : {
							message : '客户分组不能为空'
						}
					}
				},
				description : {
					validators : {
						notEmpty : {
							message : '分组说明不能为空'
						}
					}
				}
			}
		});
	});
</script>
