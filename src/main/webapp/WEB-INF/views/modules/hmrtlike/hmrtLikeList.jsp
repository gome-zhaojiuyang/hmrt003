<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>活动点赞管理</title>
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
		<li class="active"><a href="${ctx}/hmrtlike/hmrtLike/">活动点赞列表</a></li>
		<shiro:hasPermission name="hmrtlike:hmrtLike:edit"><li><a href="${ctx}/hmrtlike/hmrtLike/form">活动点赞添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="hmrtLike" action="${ctx}/hmrtlike/hmrtLike/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>用户编号：</label>
				<form:input path="userid" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>文章编号：</label>
				<form:input path="articleid" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>用户编号</th>
				<th>文章编号</th>
				<shiro:hasPermission name="hmrtlike:hmrtLike:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="hmrtLike">
			<tr>
				<td><a href="${ctx}/hmrtlike/hmrtLike/form?id=${hmrtLike.id}">
					${hmrtLike.userid}
				</a></td>
				<td>
					${hmrtLike.articleid}
				</td>
				<shiro:hasPermission name="hmrtlike:hmrtLike:edit"><td>
    				<a href="${ctx}/hmrtlike/hmrtLike/form?id=${hmrtLike.id}">修改</a>
					<a href="${ctx}/hmrtlike/hmrtLike/delete?id=${hmrtLike.id}" onclick="return confirmx('确认要删除该活动点赞吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>