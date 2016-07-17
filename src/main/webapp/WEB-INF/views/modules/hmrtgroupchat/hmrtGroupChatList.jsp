<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%
//String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/";
%>
<c:set var="basePath" value="${pageContext.request.getScheme()}://${pageContext.request.getServerName()}:${pageContext.request.getServerPort()}${pageContext.request.getContextPath()}/"/>
<html>
<head>
	<title>讨论组聊天记录管理</title>
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
		<li class="active"><a href="${ctx}/hmrtgroupchat/hmrtGroupChat/">讨论组聊天记录列表</a></li>
		<!--<shiro:hasPermission name="hmrtgroupchat:hmrtGroupChat:edit"><li><a href="${ctx}/hmrtgroupchat/hmrtGroupChat/form">讨论组聊天记录添加</a></li></shiro:hasPermission>-->
	</ul>
	<form:form id="searchForm" modelAttribute="hmrtGroupChat" action="${ctx}/hmrtgroupchat/hmrtGroupChat/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>来自：</label>
				<form:input path="tfrom" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>消息类型：</label>
				<form:input path="ttype" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>接收：</label>
				<form:input path="tto" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>来自</th>
				<th>消息</th>
				<th>消息类型</th>
				<th>长度</th>
				<th>URL</th>
				<th>文件名</th>
				<th>纬度</th>
				<th>经度</th>
				<th>地址</th>
				<th>t_timestamp</th>
				<th>接收</th>
				<shiro:hasPermission name="hmrtgroupchat:hmrtGroupChat:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="hmrtGroupChat">
			<tr>
				<td><a href="${ctx}/hmrtgroupchat/hmrtGroupChat/form?id=${hmrtGroupChat.id}">
					${hmrtGroupChat.tfrom}
				</a></td>
				<td>
					${hmrtGroupChat.tmsg}
				</td>
				<td>
					${hmrtGroupChat.ttype}
				</td>
				<td>
					${hmrtGroupChat.tlength}
				</td>
				<td>
				<c:if test="${not empty hmrtGroupChat.turl}"><a href="${basePath}${hmrtGroupChat.turl}">${basePath}${hmrtGroupChat.turl}</a></c:if>
				</td>
				<td>
					${hmrtGroupChat.tfilename}
				</td>
				<td>
					${hmrtGroupChat.tlat}
				</td>
				<td>
					${hmrtGroupChat.tlng}
				</td>
				<td>
					${hmrtGroupChat.taddr}
				</td>
				<td>
					<fmt:formatDate value="${hmrtGroupChat.tdate}" pattern="yyyy-MM-dd HH:mm:ss"/><br/>  
				</td>
				<td>
					${hmrtGroupChat.tto}
				</td>
				<shiro:hasPermission name="hmrtgroupchat:hmrtGroupChat:edit"><td>
    				<!-- <a href="${ctx}/hmrtgroupchat/hmrtGroupChat/form?id=${hmrtGroupChat.id}">修改</a> -->
					<a href="${ctx}/hmrtgroupchat/hmrtGroupChat/delete?id=${hmrtGroupChat.id}" onclick="return confirmx('确认要删除该讨论组聊天记录吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>