<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>群聊对应病例操作管理</title>
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
		<li class="active"><a href="${ctx}/hmrtgroupcase/hmrtGroupCase/">群聊对应病例操作列表</a></li>
		<shiro:hasPermission name="hmrtgroupcase:hmrtGroupCase:edit"><li><a href="${ctx}/hmrtgroupcase/hmrtGroupCase/form">群聊对应病例操作添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="hmrtGroupCase" action="${ctx}/hmrtgroupcase/hmrtGroupCase/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>group_id：</label>
				<form:input path="groupId" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>groupname：</label>
				<form:input path="groupname" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>owner：</label>
				<form:input path="owner" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>case_id：</label>
				<form:input path="caseId" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>group_id</th>
				<th>groupname</th>
				<th>owner</th>
				<th>case_id</th>
				<shiro:hasPermission name="hmrtgroupcase:hmrtGroupCase:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="hmrtGroupCase">
			<tr>
				<td><a href="${ctx}/hmrtgroupcase/hmrtGroupCase/form?id=${hmrtGroupCase.id}">
					${hmrtGroupCase.groupId}
				</a></td>
				<td>
					${hmrtGroupCase.groupname}
				</td>
				<td>
					${hmrtGroupCase.owner}
				</td>
				<td>
					${hmrtGroupCase.caseId}
				</td>
				<shiro:hasPermission name="hmrtgroupcase:hmrtGroupCase:edit"><td>
    				<a href="${ctx}/hmrtgroupcase/hmrtGroupCase/form?id=${hmrtGroupCase.id}">修改</a>
					<a href="${ctx}/hmrtgroupcase/hmrtGroupCase/delete?id=${hmrtGroupCase.id}" onclick="return confirmx('确认要删除该群聊对应病例操作吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>