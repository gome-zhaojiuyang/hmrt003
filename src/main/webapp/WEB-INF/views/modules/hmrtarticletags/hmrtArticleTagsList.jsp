<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>病历标签关系管理</title>
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
		<li class="active"><a href="${ctx}/hmrtarticletags/hmrtArticleTags/">病历标签关系列表</a></li>
		<shiro:hasPermission name="hmrtarticletags:hmrtArticleTags:edit"><li><a href="${ctx}/hmrtarticletags/hmrtArticleTags/form">病历标签关系添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="hmrtArticleTags" action="${ctx}/hmrtarticletags/hmrtArticleTags/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>articleid：</label>
				<form:input path="articleid" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>tagsid：</label>
				<form:input path="tagsid" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>articleid</th>
				<th>tagsid</th>
				<shiro:hasPermission name="hmrtarticletags:hmrtArticleTags:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="hmrtArticleTags">
			<tr>
				<td><a href="${ctx}/hmrtarticletags/hmrtArticleTags/form?id=${hmrtArticleTags.id}">
					${hmrtArticleTags.articleid}
				</a></td>
				<td>
					${hmrtArticleTags.tagsid}
				</td>
				<shiro:hasPermission name="hmrtarticletags:hmrtArticleTags:edit"><td>
    				<a href="${ctx}/hmrtarticletags/hmrtArticleTags/form?id=${hmrtArticleTags.id}">修改</a>
					<a href="${ctx}/hmrtarticletags/hmrtArticleTags/delete?id=${hmrtArticleTags.id}" onclick="return confirmx('确认要删除该病历标签关系吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>