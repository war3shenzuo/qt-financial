<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>慢病mlnx专用</a></li>
	<li class="active">反馈列表</li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">
				<i class="fa fa-comments"></i> 反馈列表
			</header>
			<div class="panel-body">
				<div class="adv-table">
					<table class="display table table-bordered table-striped"
						id="dynamic-table">
						<thead>
							<tr>
								<th>头像名字</th>
								<th>标题</th>
								<th>内容</th>
								<th>反馈时间</th>
								<th>回复内容</th>
								<th>回复时间</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${patients}" var="patient">
				              <tr>
				                <td>${patient.id}</td>
				                <td>      
				                <a href="#"
				                  onclick="javacript:LoadAjaxContent('${pageContext.request.contextPath}/mlnx/patient_info?id=${patient.id}')">${patient.name}</a>
				                </td>
				                <td>${patient.age}</td>
				                <td><fmt:formatDate value="${patient.timestamp}"
				                    pattern="yyyy-MM-dd" /></td>
				                <td><fmt:formatDate value="${patient.datetime}"
				                    pattern="yyyy-MM-dd" /></td>
				                <td><a href="#"
				                  onclick="javacript:LoadAjaxContent('${pageContext.request.contextPath}/mlnx/patient_edit?id=${patient.id}')">编辑</a>|<a
				                  href="${pageContext.request.contextPath}/mlnx/patient_delete?id=${patient.id}&patientId=${patient.patientId}&ecgId=${patient.ecgId}">删除</a>|<a
				                  href="#" onclick="javacript:LoadAjaxContent('${pageContext.request.contextPath}/mlnx/reports_info_by_patient_id?id=${patient.id}')">报告</a></td>
				              </tr>
				            </c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<th>头像名字</th>
								<th>标题</th>
								<th>内容</th>
								<th>反馈时间</th>
								<th>回复内容</th>
								<th>回复时间</th>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</section>
		<!--notification end-->
	</div>
</div>
<!-- 模态框（Modal） -->
<div aria-hidden="false" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
	<div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                <h4 class="modal-title" id="myModalLabel">提示</h4>
            </div>
            <div class="modal-body" id="message">
				${param.message}
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<!-- 模态框（Modal） -->

<!--dynamic table initialization -->
<script src="${ctx}/common/js/dynamic_table_init.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
});

</script>