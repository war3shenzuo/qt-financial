<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset="utf-8">
<title>慢病管理系统（新）</title>
<meta name="keywords" content="mlnx">
<meta name="description" content="description">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--favicon-->
<link href="${ctx}/common/img/favicon.ico" rel="shortcut icon">

<!--icheck-->
<link href="${ctx}/common/js/iCheck/skins/square/green.css" rel="stylesheet">
<link href="${ctx}/common/js/iCheck/skins/flat/green.css" rel="stylesheet">

<!--select2 -->
<link href="${ctx}/common/js/0_swh/select2/select2.css" rel="stylesheet">

<!--dynamic table-->
<link href="${ctx}/common/js/advanced-datatable/css/demo_page.css"
	rel="stylesheet" />
<link href="${ctx}/common/js/advanced-datatable/css/demo_table.css"
	rel="stylesheet" />
<link href="${ctx}/common/js/data-tables/DT_bootstrap.css"
	rel="stylesheet" />

<!-- 点击放大效果 css-->
<link href="${ctx}/common/js/0_swh/lightbox/css/lightbox.css" rel="stylesheet">

<!-- 阿里云上传-->
<link href="${ctx}/common/css/admin/upload.css" rel="stylesheet">

<!--gritter css 模态框-->
<link rel="stylesheet" type="text/css"
	href="${ctx}/common/js/gritter/css/jquery.gritter.css" />

<!--bootstrapValidator-->
<link href="${ctx}/common/css/bootstrapValidator.min.css"
	rel="stylesheet">

<!--common-->
<link rel="stylesheet" type="text/css"
	href="${ctx}/common/css/style.css">
<link rel="stylesheet" type="text/css"
	href="${ctx}/common/css/style-responsive.css">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script src="${ctx}/common/js/html5shiv.js"></script>
<script src="${ctx}/common/js/respond.min.js"></script>
<![endif]-->
</head>
<body class="sticky-header" style="background: #ffffff;">
	<section>
		<div class="imformation_content">
			<div class="imformation_content_title">${obj.title}</div>
			<div class="imformation_content_author">
				<img alt="" src="${img_url}${obj.pic}" onerror="this.src='${pageContext.request.contextPath}/common/img/no_pic200.png'" class="imformation_content_author_img">
				<div class="imformation_content_author_name">
					<p>${obj.author}</p>
					<p><fmt:formatDate value='${obj.publishTime}' pattern='yyyy-MM-dd'/></p>
				</div>
			</div>
			<div class="imformation_content_detail">
				${obj.content}
			</div>
		</div>
	</section>
	<!-- Placed js at the end of the document so the pages load faster -->
	<script src="${ctx}/common/js/jquery-1.10.2.min.js"></script>
	<script src="${ctx}/common/js/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="${ctx}/common/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="${ctx}/common/js/bootstrap.min.js"></script>
	<script src="${ctx}/common/js/modernizr.min.js"></script>
	<script src="${ctx}/common/js/jquery.nicescroll.js"></script>
	
	<!--icheck -->
	<script src="${ctx}/common/js/iCheck/jquery.icheck.js"></script>
	<script src="${ctx}/common/js/icheck-init.js"></script>
	
	<!--select2 -->
	<script src="${ctx}/common/js/0_swh/select2/select2.min.js"></script>
		
	<!--dynamic table-->
	<script type="text/javascript" language="javascript"
		src="${ctx}/common/js/advanced-datatable/js/jquery.dataTables.js"></script>
	<script type="text/javascript"
		src="${ctx}/common/js/data-tables/DT_bootstrap.js"></script>

	<!--dynamic table initialization -->
	<script src="${ctx}/common/js/dynamic_table_init.js"></script>

	<!-- 点击放大效果-->
	<script src="${ctx}/common/js/0_swh/lightbox/js/lightbox-2.6.min.js"></script>
	
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
			
	<!--gritter script 模态框-->
	<script type="text/javascript"
		src="${ctx}/common/js/gritter/js/jquery.gritter.js"></script>
	<script type="text/javascript"
		src="${ctx}/common/js/gritter/js/gritter-init.js"></script>

	<!--bootstrapvalidate script 表单验证-->
	<script type="text/javascript"
		src="${ctx}/common/js/bootstrapValidator.min.js"></script>

	<!--common scripts for all pages-->
	<script src="${ctx}/common/js/scripts.js"></script>
	<script type="text/javascript"
		src="${ctx}/common/js/chronic/base.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".imformation_content_detail img").each(function(){
				var img = $(this);
				var img_width = img.width();
				var img_height = img.height();
				var box_width = $('.imformation_content_detail').width();
				if(img_width >= box_width){
					$(img).css("width","100%").css("height","auto");
				}else{
					$(img).css("width", img_width + "px").css("height", img_height + "px");
				}
			});
		});
	</script>
</body>
</html>