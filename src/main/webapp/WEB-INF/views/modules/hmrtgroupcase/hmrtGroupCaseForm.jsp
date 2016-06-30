<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>群聊对应病例操作管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/hmrtgroupcase/hmrtGroupCase/">群聊对应病例操作列表</a></li>
		<li class="active"><a href="${ctx}/hmrtgroupcase/hmrtGroupCase/form?id=${hmrtGroupCase.id}">群聊对应病例操作<shiro:hasPermission name="hmrtgroupcase:hmrtGroupCase:edit">${not empty hmrtGroupCase.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="hmrtgroupcase:hmrtGroupCase:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="hmrtGroupCase" action="${ctx}/hmrtgroupcase/hmrtGroupCase/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">group_id：</label>
			<div class="controls">
				<form:input path="groupId" htmlEscape="false" maxlength="32" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">groupname：</label>
			<div class="controls">
				<form:input path="groupname" htmlEscape="false" maxlength="200" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">description：</label>
			<div class="controls">
				<form:input path="description" htmlEscape="false" maxlength="200" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">owner：</label>
			<div class="controls">
				<form:input path="owner" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">case_id：</label>
			<div class="controls">
				<form:input path="caseId" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="hmrtgroupcase:hmrtGroupCase:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>