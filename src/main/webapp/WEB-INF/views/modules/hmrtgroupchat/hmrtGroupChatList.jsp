<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>分组聊天管理</title>
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
		<li class="active"><a href="${ctx}/hmrtgroupchat/hmrtGroupChat/">分组聊天列表</a></li>
		<shiro:hasPermission name="hmrtgroupchat:hmrtGroupChat:edit"><li><a href="${ctx}/hmrtgroupchat/hmrtGroupChat/form">分组聊天添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="hmrtGroupChat" action="${ctx}/hmrtgroupchat/hmrtGroupChat/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>groupid：</label>
				<form:input path="groupid" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>userid：</label>
				<form:input path="userid" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>articleid：</label>
				<form:input path="articleid" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>content：</label>
				<form:input path="content" htmlEscape="false" maxlength="512" class="input-medium"/>
			</li>
			<li><label>create_dt：</label>
				<input name="beginCreateDt" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${hmrtGroupChat.beginCreateDt}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endCreateDt" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${hmrtGroupChat.endCreateDt}" pattern="yyyy-MM-dd HH:mm:ss"/>"
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
				<th>groupid</th>
				<th>userid</th>
				<th>articleid</th>
				<th>content</th>
				<th>create_dt</th>
				<shiro:hasPermission name="hmrtgroupchat:hmrtGroupChat:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="hmrtGroupChat">
			<tr>
				<td><a href="${ctx}/hmrtgroupchat/hmrtGroupChat/form?id=${hmrtGroupChat.id}">
					${hmrtGroupChat.groupid}
				</a></td>
				<td>
					${hmrtGroupChat.userid}
				</td>
				<td>
					${hmrtGroupChat.articleid}
				</td>
				<td>
					${hmrtGroupChat.content}
				</td>
				<td>
					<fmt:formatDate value="${hmrtGroupChat.createDt}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="hmrtgroupchat:hmrtGroupChat:edit"><td>
    				<a href="${ctx}/hmrtgroupchat/hmrtGroupChat/form?id=${hmrtGroupChat.id}">修改</a>
					<a href="${ctx}/hmrtgroupchat/hmrtGroupChat/delete?id=${hmrtGroupChat.id}" onclick="return confirmx('确认要删除该分组聊天吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>