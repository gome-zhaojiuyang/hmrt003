<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>讨论聊天内容备份管理</title>
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
		<li class="active"><a href="${ctx}/hmrtgroupchat/hmrtGroupChat/">讨论聊天内容备份列表</a></li>
		<!--<shiro:hasPermission name="hmrtgroupchat:hmrtGroupChat:edit"><li><a href="${ctx}/hmrtgroupchat/hmrtGroupChat/form">讨论聊天内容备份添加</a></li></shiro:hasPermission>  -->
	</ul>
	<form:form id="searchForm" modelAttribute="hmrtGroupChat" action="${ctx}/hmrtgroupchat/hmrtGroupChat/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>讨论组：</label>
				<form:input path="to" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>来自：</label>
				<form:input path="from" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>timestamp：</label>
				<form:input path="timestamp" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>讨论组</th>
				<th>来自</th>
				<th>消息内容</th>
				<th>消息类型</th>
				<th>url</th>
				<th>文件名字</th>
				<th>纬度</th>
				<th>精度</th>
				<th>地址</th>
				<th>timestamp</th>
				<shiro:hasPermission name="hmrtgroupchat:hmrtGroupChat:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="hmrtGroupChat">
			<tr>
				<td><a href="${ctx}/hmrtgroupchat/hmrtGroupChat/form?id=${hmrtGroupChat.id}">
					${hmrtGroupChat.to}
				</a></td>
				<td>
					${hmrtGroupChat.from}
				</td>
				<td>
					${hmrtGroupChat.msg}
				</td>
				<td>
					${hmrtGroupChat.type}
				</td>
				<td>
					${hmrtGroupChat.url}
				</td>
				<td>
					${hmrtGroupChat.filename}
				</td>
				<td>
					${hmrtGroupChat.lat}
				</td>
				<td>
					${hmrtGroupChat.lng}
				</td>
				<td>
					${hmrtGroupChat.addr}
				</td>
				<td>
					${hmrtGroupChat.timestamp}
				</td>
				<shiro:hasPermission name="hmrtgroupchat:hmrtGroupChat:edit"><td>
    				<a href="${ctx}/hmrtgroupchat/hmrtGroupChat/form?id=${hmrtGroupChat.id}">修改</a>
					<a href="${ctx}/hmrtgroupchat/hmrtGroupChat/delete?id=${hmrtGroupChat.id}" onclick="return confirmx('确认要删除该讨论聊天内容备份吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>