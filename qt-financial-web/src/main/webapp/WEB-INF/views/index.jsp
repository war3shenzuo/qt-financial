<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset="utf-8">
<title>清投金服</title>
<meta name="keywords" content="mlnx">
<meta name="description" content="description">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--favicon-->
<link href="${ctx}/common/img/favicon.ico" rel="shortcut icon">

<!--dynamic table-->
<link href="${ctx}/common/js/advanced-datatable/css/demo_page.css" rel="stylesheet" />
<link href="${ctx}/common/js/advanced-datatable/css/demo_table.css" rel="stylesheet" />
<link href="${ctx}/common/js/data-tables/DT_bootstrap.css" rel="stylesheet" />

<!-- 点击放大效果 css-->
<link href="${ctx}/common/js/0_swh/lightbox/css/lightbox.css" rel="stylesheet">

<!--gritter css 模态框-->
<link rel="stylesheet" type="text/css"
	href="${ctx}/common/js/gritter/css/jquery.gritter.css" />

<!--bootstrapValidator-->
<link href="${ctx}/common/css/bootstrapValidator.min.css"
	rel="stylesheet">

<!--select2 -->
<link href="${ctx}/common/js/0_swh/select2/select2.css" rel="stylesheet">
  
<!--common-->
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/style.css">
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/style-responsive.css">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script src="${ctx}/common/js/html5shiv.js"></script>
<script src="${ctx}/common/js/respond.min.js"></script>
<![endif]-->

</head>
<body class="sticky-header">
<input type="hidden" value="${img_url}" id="img_url" />
<section>
    <!-- left side start-->
    <jsp:include  page="ajax/header_leftside.jsp"/>
    <!-- left side end-->
    
    <!-- main content start-->
    <div class="main-content" >

        <!-- header section start-->
        <jsp:include  page="ajax/header_section.jsp"/>
        <!-- header section end-->

        <!--body wrapper start-->
        <div class="wrapper" id="wrapper">
        	
        </div>
        <!--body wrapper end-->
    </div>
    <!-- main content end-->
</section>
<!-- Placed js at the end of the document so the pages load faster -->
<script src="${ctx}/common/js/jquery-1.10.2.min.js"></script>
<script src="${ctx}/common/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="${ctx}/common/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${ctx}/common/js/bootstrap.min.js"></script>
<script src="${ctx}/common/js/modernizr.min.js"></script>
<script src="${ctx}/common/js/jquery.nicescroll.js"></script>

<!--dynamic table-->
<script type="text/javascript" language="javascript" src="${ctx}/common/js/advanced-datatable/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="${ctx}/common/js/data-tables/DT_bootstrap.js"></script>

<!-- 点击放大效果-->
<script src="${ctx}/common/js/0_swh/lightbox/js/lightbox-2.6.min.js"></script>

<!--gritter script 模态框-->
<script type="text/javascript"
	src="${ctx}/common/js/gritter/js/jquery.gritter.js"></script>
<script type="text/javascript"
	src="${ctx}/common/js/gritter/js/gritter-init.js"></script>

<!--bootstrapvalidate script 表单验证-->
<script type="text/javascript"
	src="${ctx}/common/js/bootstrapValidator.min.js"></script>

<!--select2 -->
<script src="${ctx}/common/js/0_swh/select2/select2.min.js"></script>

<!--common scripts for all pages-->
<script src="${ctx}/common/js/scripts.js"></script>

<!--LoadAjaxContent-->
<script type="text/javascript" src="${ctx}/common/js/base.js"></script>

<script type="text/javascript">
$(document).ready(function() {		
	LoadAjaxContent('${pageContext.request.contextPath}/view/index_info','wrapper');
});
</script>
</body>
</html>