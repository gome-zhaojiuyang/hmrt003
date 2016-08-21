<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>资源上传管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/hmrtupload/hmrtUpload/">资源上传列表</a></li>
		<shiro:hasPermission name="hmrtupload:hmrtUpload:edit"><li><a href="${ctx}/hmrtupload/hmrtUpload/form">资源上传添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="hmrtUpload" action="${ctx}/hmrtupload/hmrtUpload/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>用户id：</label>
				<form:input path="userid" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>关联其他id 例如病历上传 关联articleid：</label>
				<form:input path="caseid" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>图片备注：</label>
				<form:input path="remark" htmlEscape="false" maxlength="512" class="input-medium"/>
			</li>
			<li><label>图片链接地址：</label>
				<form:input path="path" htmlEscape="false" maxlength="512" class="input-medium"/>
			</li>
			<li><label>标题：</label>
				<form:input path="title" htmlEscape="false" maxlength="512" class="input-medium"/>
			</li>
			<li><label>分组id：</label>
				<form:input path="groupid" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>010图片  020文字：</label>
				<form:input path="type" htmlEscape="false" maxlength="8" class="input-medium"/>
			</li>
			<li><label>状态010启用  020禁用：</label>
				<form:input path="status" htmlEscape="false" maxlength="8" class="input-medium"/>
			</li>
			<li><label>创建时间：</label>
				<input name="beginCreatedate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${hmrtUpload.beginCreatedate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endCreatedate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${hmrtUpload.endCreatedate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>更新时间：</label>
				<input name="beginUpdatedate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${hmrtUpload.beginUpdatedate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endUpdatedate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${hmrtUpload.endUpdatedate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>资源名称：</label>
				<form:input path="resname" htmlEscape="false" maxlength="512" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>用户id</th>
				<th>关联其他id 例如病历上传 关联articleid</th>
				<th>图片备注</th>
				<th>图片链接地址</th>
				<th>标题</th>
				<th>分组id</th>
				<th>010图片  020文字</th>
				<th>状态010启用  020禁用</th>
				<th>创建时间</th>
				<th>更新时间</th>
				<th>资源名称</th>
				<shiro:hasPermission name="hmrtupload:hmrtUpload:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="hmrtUpload">
			<tr>
				<td><a href="${ctx}/hmrtupload/hmrtUpload/form?id=${hmrtUpload.id}">
					${hmrtUpload.userid}
				</a></td>
				<td>
					${hmrtUpload.caseid}
				</td>
				<td>
					${hmrtUpload.remark}
				</td>
				<td>
					${hmrtUpload.path}
				</td>
				<td>
					${hmrtUpload.title}
				</td>
				<td>
					${hmrtUpload.groupid}
				</td>
				<td>
					${hmrtUpload.type}
				</td>
				<td>
					${hmrtUpload.status}
				</td>
				<td>
					<fmt:formatDate value="${hmrtUpload.createdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${hmrtUpload.updatedate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${hmrtUpload.resname}
				</td>
				<shiro:hasPermission name="hmrtupload:hmrtUpload:edit"><td>
    				<a href="${ctx}/hmrtupload/hmrtUpload/form?id=${hmrtUpload.id}">修改</a>
					<a href="${ctx}/hmrtupload/hmrtUpload/delete?id=${hmrtUpload.id}" onclick="return confirmx('确认要删除该资源上传吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>