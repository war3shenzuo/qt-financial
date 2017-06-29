<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset="utf-8">
<title>慢病mlnx专用</title>
<meta name="keywords" content="mlnx">
<meta name="description" content="description">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--favicon-->
<link href="${ctx}/common/img/favicon.ico" rel="shortcut icon">
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
	<input type="hidden" id="id" value="${param.id}" />
	<input type="hidden" id="baseImg" value="${img_url}" />
	<section>
		<div class="imformation_content">
			<div class="imformation_content_title"></div>
			<div class="imformation_content_author">
				<img alt="" src="" onerror="this.src='${pageContext.request.contextPath}/common/img/no_pic200.png'" class="imformation_content_author_img">
				<div class="imformation_content_author_name">
					<p id="author"></p>
					<p id="publishTime"></p>
				</div>
			</div>
			<div class="imformation_content_detail">
				${obj.content}
			</div>
		</div>
		<div class="row ui-font-sizebox">
			<div class="ui-font-size-sub" onclick="fontsizesub()"><i class="fa fa-minus"></i></div>
			<div class="ui-font-size-now"><input type="text" name="fontsize" class="ui-font-size-input" readonly></div>
			<div class="ui-font-size-add" onclick="fontsizeadd()"><i class="fa fa-plus"></i></div>
		</div>
	</section>
	<!-- Placed js at the end of the document so the pages load faster -->
	<script src="${ctx}/common/js/jquery-1.10.2.min.js"></script>
	<script src="${ctx}/common/js/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="${ctx}/common/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="${ctx}/common/js/bootstrap.min.js"></script>
	<script src="${ctx}/common/js/modernizr.min.js"></script>
	<script src="${ctx}/common/js/jquery.nicescroll.js"></script>

	<!--common scripts for all pages-->
	<script src="${ctx}/common/js/scripts.js"></script>
	<script src="${ctx}/common/js/base.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var url = "${ctx}/data/information_detail?id="
				+ $("#id").val();
		LoadAjaxData(url, loadInformationInfo);
		function loadInformationInfo(data) {
			try {
				console.log(data);
				$(".imformation_content_title").html(data.obj.title);
				$(".imformation_content_author_img").attr("src",$("#baseImg").val()+data.obj.pic);
				$("#author").html(data.obj.author);
				$("#publishTime").html(formatDate(data.obj.publishTime));
				$(".imformation_content_detail").html(data.obj.content);
			} catch (arr) {
				console.log(arr);
			}
		}
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
			var nowfontsize = $(".imformation_content_detail").css("fontSize");
			$("input[name='fontsize']").val(nowfontsize);
		});
		//字体缩小
		function fontsizesub(){
			var font_size = $("input[name='fontsize']").val();
			var Size = font_size.substring(0,2);
			var newSize = Size - 1;
			$("input[name='fontsize']").val(newSize + 'px');
			$(".imformation_content_detail").css("font-size",newSize);
		}
		//字体扩大
		function fontsizeadd(){
			var font_size = $("input[name='fontsize']").val();
			var Size = parseInt(font_size.substring(0,2));
			var newSize = Size + 1;
			$("input[name='fontsize']").val(newSize + 'px');
			$(".imformation_content_detail").css("font-size",newSize);
		}
	</script>
</body>
</html>