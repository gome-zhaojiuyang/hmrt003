<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>测试模块管理</title>
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
		<li class="active"><a href="${ctx}/hmrttest/hmrttestchild/hmrtTest/">测试模块列表</a></li>
		<shiro:hasPermission name="hmrttest:hmrttestchild:hmrtTest:edit"><li><a href="${ctx}/hmrttest/hmrttestchild/hmrtTest/form">测试模块添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="hmrtTest" action="${ctx}/hmrttest/hmrttestchild/hmrtTest/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>name：</label>
				<form:input path="name" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>age：</label>
				<form:input path="age" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>birthday：</label>
				<input name="birthday" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${hmrtTest.birthday}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>sex：</label>
				<form:input path="sex" htmlEscape="false" maxlength="4" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>name</th>
				<th>age</th>
				<th>birthday</th>
				<th>sex</th>
				<shiro:hasPermission name="hmrttest:hmrttestchild:hmrtTest:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="hmrtTest">
			<tr>
				<td><a href="${ctx}/hmrttest/hmrttestchild/hmrtTest/form?id=${hmrtTest.id}">
					${hmrtTest.name}
				</a></td>
				<td>
					${hmrtTest.age}
				</td>
				<td>
					<fmt:formatDate value="${hmrtTest.birthday}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${hmrtTest.sex}
				</td>
				<shiro:hasPermission name="hmrttest:hmrttestchild:hmrtTest:edit"><td>
    				<a href="${ctx}/hmrttest/hmrttestchild/hmrtTest/form?id=${hmrtTest.id}">修改</a>
					<a href="${ctx}/hmrttest/hmrttestchild/hmrtTest/delete?id=${hmrtTest.id}" onclick="return confirmx('确认要删除该测试模块吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>