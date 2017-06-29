<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>慢病mlnx专用</a></li>
	<li><a href="#"
		onclick="LoadAjaxContent('${pageContext.request.contextPath}/mlnx/information_list','wrapper')">百科列表</a></li>
	<li class="active">新增百科</li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">
				新增百科<span class="tools pull-right"> <a
					class="fa fa-chevron-down" href="javascript:;"></a> <!--                                 <a class="fa fa-times" href="javascript:;"></a> -->
				</span>
			</header>
			<div class="panel-body">
				<form class="cmxform form-horizontal adminex-form" role="form"
					method="POST" id="informationForm" action="#">
					<div class="form-group">
						<label class="col-sm-3 col-sm-3 control-label">标题：</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="title" value="">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 col-sm-3 control-label">作者：</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="author" value="">
							<input type="hidden" class="form-control" name="userId" value="${mlnxAdminLogin.id}"
								id="userId">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 col-sm-3 control-label">类型：</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="type" value="">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 col-sm-3 control-label">发布人群：</label>
						<div class="col-sm-6">
							<input type="hidden" class="form-control" name="groupId"
								value="-1"> <span
								class="col-sm-3 col-sm-3 control-label">公开</span>
						</div>
						<input type="hidden" class="form-control" name="source" value="0">
						<input type="hidden" class="form-control" name="valid" value="1">
					</div>
					<div class="form-group">
						<label class="col-sm-3 col-sm-3 control-label">添加封面：</label>
						<div class="col-sm-3">
							<img id="preview" class="img-rounded" style="max-height: 400px;"
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
						<label class="col-sm-3 col-sm-3 control-label">概要</label>
						<div class="col-sm-6">
							<textarea type="text/plain"
								style="width: 100%; height: 100px; padding: 10px; border-radius: 5px;"
								name="summary" maxlength="150"></textarea>
						</div>
						<div class="col-sm-2">限制150个字。</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 col-sm- control-label">编辑正文</label>
						<div class="col-sm-6">
							<script id="add_editor" type="text/plain"
								style="width: 100%; height: 300px;" name="content"></script>
						</div>
					</div>
					<div class="form-group">
						<div class="col-lg-offset-6 col-lg-10">
							<button class="btn btn-primary" id="submit" type="button"
								onclick="submitNews()">提交</button>
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
// 				var url = "${ctx}/data/getPatientTeam?doctorId="
// 						+ $("#userId").val();
// 				LoadAjaxData(url, loadPatientTeam);

				//阿里云上传
				uploadInit('', 'selectfiles', 'container', 'ossfile',
						'postfiles', 'pic', 'preview');

				//实例化编辑器
				var editor = new UE.ui.Editor();
				editor.render("add_editor");

				//bootstrapValidator
				$('#informationForm').bootstrapValidator({
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
// 	function loadPatientTeam(data) {
// 		try {
// 			console.log(data);
// 			var htmlStr = '<option value="-1" >公开</option><option value="0" >所有组</option>';
// 			for (var i = 0; i < data.length; i++) {
// 				htmlStr += '<option value="'+data[i].id+'" >' + data[i].name
// 						+ '</option>';
// 			}
// 			$("#peopletype").html(htmlStr);
// 			Select2Test();
// 		} catch (arr) {
// 			console.log(arr);
// 		}
// 	}
// 	function Select2Test() {
// 		$("#peopletype").select2();
// 	}
	function submitNews() {
		var url = "${ctx}/data/information_add";
		UE.getEditor('add_editor').sync();
		var title = $("input[name='title']").val();
		var summary = $("textarea[name='summary']").val();
		var editor = UE.getEditor('add_editor');
		var content = editor.getContent();
		if (title == "" || title == null || summary == "" || summary == null
				|| content == "" || content == null) {
			$("#info_type").attr('src',
					'${ctx}/common/img/admin/icon_error.jpg');
			$("#info_msg").html("请将资讯内容填写完整");
			$("#myModal_info").modal("show");
		} else {
			$.ajax({
				url : url,
				type : 'post',
				data : $("#informationForm").serialize(),
				success : function(data) {
					if (data.responseCode == "000492") {
						$("#info_type").attr('src',
								'${ctx}/common/img/admin/icon_success.jpg');
						$("#info_msg").html(data.msg);
						$("#myModal_info").modal("show");
					} else {
						$("#info_type").attr('src',
								'${ctx}/common/img/admin/icon_error.jpg');
						$("#info_msg").html("失败");
						$("#myModal_info").modal("show");
					}
					$("#myModal_info_button").click(function() {
						LoadAjaxContent('information_list','wrapper');
					});
				}
			});
		}

	}
</script>