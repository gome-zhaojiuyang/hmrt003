<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>患者信息管理</title>
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
		<li class="active"><a href="${ctx}/hmrtpatient/hmrtPatient/">患者信息列表</a></li>
		<shiro:hasPermission name="hmrtpatient:hmrtPatient:edit"><li><a href="${ctx}/hmrtpatient/hmrtPatient/form">患者信息添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="hmrtPatient" action="${ctx}/hmrtpatient/hmrtPatient/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>用户ID：</label>
				<form:input path="userid" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>姓名：</label>
				<form:input path="name" htmlEscape="false" maxlength="128" class="input-medium"/>
			</li>
			<li><label>手机号：</label>
				<form:input path="mobile" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>身份证号：</label>
				<form:input path="idNumber" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>部门：</label>
				<form:input path="department" htmlEscape="false" maxlength="128" class="input-medium"/>
			</li>
			<li><label>患者职业：</label>
				<form:input path="profession" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>患者联系人：</label>
				<form:input path="contact" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>介绍人：</label>
				<form:input path="introduce" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>创建日期：</label>
				<input name="createDt" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${hmrtPatient.createDt}" pattern="yyyy-MM-dd HH:mm:ss"/>"
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
				<th>姓名</th>
				<th>性别</th>
				<th>生日</th>
				<th>年龄</th>
				<th>手机号</th>
				<th>身份证号</th>
				<th>就诊日期</th>
				<th>部门</th>
				<th>编号类型1</th>
				<th>编号1</th>
				<th>编号类型2</th>
				<th>编号2</th>
				<th>固定电话</th>
				<th>邮箱</th>
				<th>患者地址</th>
				<th>患者职业</th>
				<th>患者联系人</th>
				<th>介绍人</th>
				<th>备注</th>
				<th>创建日期</th>
				<shiro:hasPermission name="hmrtpatient:hmrtPatient:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="hmrtPatient">
			<tr>
				<td><a href="${ctx}/hmrtpatient/hmrtPatient/form?id=${hmrtPatient.id}">
					${hmrtPatient.name}
				</a></td>
				<td>
					${hmrtPatient.sex}
				</td>
				<td>
					<fmt:formatDate value="${hmrtPatient.birthday}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${hmrtPatient.age}
				</td>
				<td>
					${hmrtPatient.mobile}
				</td>
				<td>
					${hmrtPatient.idNumber}
				</td>
				<td>
					<fmt:formatDate value="${hmrtPatient.visitDt}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${hmrtPatient.department}
				</td>
				<td>
					${hmrtPatient.snType1}
				</td>
				<td>
					${hmrtPatient.snNo1}
				</td>
				<td>
					${hmrtPatient.snType2}
				</td>
				<td>
					${hmrtPatient.snNo2}
				</td>
				<td>
					${hmrtPatient.phone}
				</td>
				<td>
					${hmrtPatient.email}
				</td>
				<td>
					${hmrtPatient.address}
				</td>
				<td>
					${hmrtPatient.profession}
				</td>
				<td>
					${hmrtPatient.contact}
				</td>
				<td>
					${hmrtPatient.introduce}
				</td>
				<td>
					${hmrtPatient.remark}
				</td>
				<td>
					<fmt:formatDate value="${hmrtPatient.createDt}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="hmrtpatient:hmrtPatient:edit"><td>
    				<a href="${ctx}/hmrtpatient/hmrtPatient/form?id=${hmrtPatient.id}">修改</a>
					<a href="${ctx}/hmrtpatient/hmrtPatient/delete?id=${hmrtPatient.id}" onclick="return confirmx('确认要删除该患者信息吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>