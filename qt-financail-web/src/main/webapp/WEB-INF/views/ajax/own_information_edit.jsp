<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<input type="hidden" id="baseImg" value="${img_url}">
<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>慢病mlnx专用</a></li>
	<li><a href="#"
		onclick="LoadAjaxContent('${pageContext.request.contextPath}/mlnx/information_list','wrapper')">百科列表</a></li>
	<li class="active">编辑百科</li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">
				编辑百科<span class="tools pull-right"> <a
					class="fa fa-chevron-down" href="javascript:;"></a> <!--                                 <a class="fa fa-times" href="javascript:;"></a> -->
				</span>
			</header>
			<div class="panel-body">
				<form class="cmxform form-horizontal adminex-form" role="form"
					method="POST" id="editInformationForm" action="">
					<input type="hidden" name="id" id="id" value="${param.id}"> <input
						type="hidden" id="groupId" >
					<div class="form-group">
						<label class="col-sm-3 col-sm-3 control-label">标题：</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="title"
								>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 col-sm-3 control-label">作者：</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="author"
								 readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 col-sm-3 control-label">类型：</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="type" >
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 col-sm-3 control-label">发布人群：</label>
						<div class="col-sm-6">
							<input type="hidden" class="form-control" name="groupId"
								value=""> <span
								class="col-sm-3 col-sm-3 control-label">公开</span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 col-sm-3 control-label">添加封面：</label>
						<div class="col-sm-3">
							<img id="preview" class="img-rounded" style="max-height: 400px;"
								src="${img_url}${obj.pic}?x-oss-process=image/resize,w_200"
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
						<label class="col-sm-3 col-sm-3 control-label">概要</label>
						<div class="col-sm-6">
							<textarea type="text/plain" style="width: 100%; height: 100px;"
								name="summary" maxlength="150"></textarea>
						</div>
						<div class="col-sm-2">限制150个字。</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 col-sm-3 control-label">编辑正文</label>
						<div class="col-sm-6">
							<script id="edit_editor" type="text/plain"
								style="width: 100%; height: 300px;" name="content"></script>
						</div>
					</div>
					<div class="form-group">
						<div class="col-lg-offset-6 col-lg-10">
							<button class="btn btn-primary" id="submit" type="button"
								onclick="updateNews()">提交</button>
						</div>
					</div>
				</form>
			</div>
		</section>
		<!--notification end-->
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

<!-- uedit -->
<script type="text/javascript" charset="utf-8"
	src="${ctx}/common/js/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${ctx}/common/js/ueditor/ueditor.all.js"></script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8"
	src="${ctx}/common/js/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {

								var url = "${ctx}/data/information_edit?id="
										+ $("#id").val();
								LoadAjaxData(url, loadInformationInfo);

				//阿里云上传
				uploadInit('', 'selectfiles', 'container', 'ossfile',
						'postfiles', 'pic', 'preview');

				//bootstrapValidator
				$('#editInformationForm').bootstrapValidator({
					feedbackIcons : {
						valid : 'fa fa-check',
						invalid : 'fa fa-times',
						validating : 'fa fa-times'
					},
					message : 'This value is not valid',
					fields : {
						title : {
							validators : {
								notEmpty : {
									message : '资讯标题不能为空'
								}
							}
						}
					}
				});
			});
	function loadInformationInfo(data) {
		try {
			$("[name='title']").val(data.obj.title);
			$("[name='author']").val(data.obj.author);
			$("[name='type']").val(data.obj.type);
			$("[name='groupId']").val(data.obj.groupId);
			$("[name='summary']").html(data.obj.summary);
			$("[name='content']").html(data.obj.content);
			$("#preview").attr("src",$("#baseImg").val()+data.obj.pic+"?x-oss-process=image/resize,w_200");
			//实例化编辑器
			var editor = new UE.ui.Editor();
			editor.render("edit_editor");
		} catch (arr) {
			console.log(arr);
		}
	}
	function updateNews() {
		var url = "${ctx}/data/information_edit_json";
		UE.getEditor('edit_editor').sync();
		$.ajax({
			url : url,
			type : 'post',
			data : $("#editInformationForm").serialize(),
			success : function(data) {
				if (data.responseCode == "000495") {
					$("#info_msg").html(data.msg);
					$("#myModal_info").modal("show");
				} else {
					$("#info_type").attr('src',
							'${ctx}/common/img/admin/icon_error.jpg');
					$("#info_msg").html("失败");
					$("#myModal_info").modal("show");

				}
				$("#myModal_info_button").click(function() {
					LoadAjaxContent('information_list', 'wrapper');
				});
			}
		});
	}
</script>