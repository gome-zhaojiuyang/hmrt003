<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>积分日志管理</title>
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
		<li class="active"><a href="${ctx}/hmrtscorelog/hmrtScoreLog/">积分日志列表</a></li>
		<shiro:hasPermission name="hmrtscorelog:hmrtScoreLog:edit"><li><a href="${ctx}/hmrtscorelog/hmrtScoreLog/form">积分日志添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="hmrtScoreLog" action="${ctx}/hmrtscorelog/hmrtScoreLog/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>规则ID：</label>
				<form:input path="ruleid" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>规则名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="128" class="input-medium"/>
			</li>
			<li><label>积分：</label>
				<form:input path="score" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>用户ID：</label>
				<form:input path="userid" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>创建时间：</label>
				<input name="beginCreateDt" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${hmrtScoreLog.beginCreateDt}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endCreateDt" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${hmrtScoreLog.endCreateDt}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>规则ID</th>
				<th>规则名称</th>
				<th>积分</th>
				<th>用户ID</th>
				<th>创建时间</th>
				<shiro:hasPermission name="hmrtscorelog:hmrtScoreLog:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="hmrtScoreLog">
			<tr>
				<td><a href="${ctx}/hmrtscorelog/hmrtScoreLog/form?id=${hmrtScoreLog.id}">
					${hmrtScoreLog.ruleid}
				</a></td>
				<td>
					${hmrtScoreLog.name}
				</td>
				<td>
					${hmrtScoreLog.score}
				</td>
				<td>
					${hmrtScoreLog.userid}
				</td>
				<td>
					<fmt:formatDate value="${hmrtScoreLog.createDt}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="hmrtscorelog:hmrtScoreLog:edit"><td>
    				<a href="${ctx}/hmrtscorelog/hmrtScoreLog/form?id=${hmrtScoreLog.id}">修改</a>
					<a href="${ctx}/hmrtscorelog/hmrtScoreLog/delete?id=${hmrtScoreLog.id}" onclick="return confirmx('确认要删除该积分日志吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>