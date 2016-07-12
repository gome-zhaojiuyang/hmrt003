<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>积分规则管理</title>
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
		<li class="active"><a href="${ctx}/hmrtscorerule/hmrtScoreRule/">积分规则列表</a></li>
		<shiro:hasPermission name="hmrtscorerule:hmrtScoreRule:edit"><li><a href="${ctx}/hmrtscorerule/hmrtScoreRule/form">积分规则添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="hmrtScoreRule" action="${ctx}/hmrtscorerule/hmrtScoreRule/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>创建者ID：</label>
				<form:input path="userid" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>规则名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>积分：</label>
				<form:input path="score" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>访问地址：</label>
				<form:input path="url" htmlEscape="false" maxlength="128" class="input-medium"/>
			</li>
			<li><label>状态：</label>
				<form:input path="status" htmlEscape="false" maxlength="1" class="input-medium"/>
			</li>
			<li><label>创建时间：</label>
				<input name="beginCreateDt" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${hmrtScoreRule.beginCreateDt}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endCreateDt" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${hmrtScoreRule.endCreateDt}" pattern="yyyy-MM-dd HH:mm:ss"/>"
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
				<th>规则名称</th>
				<th>积分</th>
				<th>访问地址</th>
				<th>状态</th>
				<th>创建时间</th>
				<shiro:hasPermission name="hmrtscorerule:hmrtScoreRule:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="hmrtScoreRule">
			<tr>
				<td><a href="${ctx}/hmrtscorerule/hmrtScoreRule/form?id=${hmrtScoreRule.id}">
					${hmrtScoreRule.name}
				</a></td>
				<td>
					${hmrtScoreRule.score}
				</td>
				<td>
					${hmrtScoreRule.url}
				</td>
				<td><c:if test ="${hmrtScoreRule.status==0}">禁用</c:if>
					<c:if test ="${hmrtScoreRule.status==1}">启用</c:if>
				</td>
				<td>
					<fmt:formatDate value="${hmrtScoreRule.createDt}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="hmrtscorerule:hmrtScoreRule:edit"><td>
    				<a href="${ctx}/hmrtscorerule/hmrtScoreRule/form?id=${hmrtScoreRule.id}">修改</a>
					<a href="${ctx}/hmrtscorerule/hmrtScoreRule/delete?id=${hmrtScoreRule.id}" onclick="return confirmx('确认要删除该积分规则吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>