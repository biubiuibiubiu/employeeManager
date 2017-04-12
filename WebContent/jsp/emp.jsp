<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加或修改员工信息</title>
</head>
<body onload="init('${param.result}')">
	<form action="updateEmp" method="post" onsubmit="return validate()">
		<table align="center">
			<tr>
				<td>编号</td>
				<td>
					<input id="emp_id" type="text" name="emp_id" value="${emp.emp_id}">
				</td>
			</tr>
			<tr>
				<td>名字</td>
				<td>
					<input id="name" type="text" name="name" value="${emp.name}">
				</td>
			</tr>
			<tr>
				<td>年龄</td>
				<td>
					<input type="text" name="age" value="${emp.age}">
				</td>
			</tr>
			<tr>
				<td>入职时间</td>
				<td>
					<input type="text" name="time" value="${emp.time}">
				</td>
			</tr>
			<tr>
				<td>所属部门</td>
				<td>
					<select name="dep.dep_id">
						<option value="null" selected="selected">
							<c:forEach items="${depList}" var="item">
								<option value="${item.dep_id}"
									<c:if test="${emp.dep.dep_id==item.dep_id}">selected</c:if>>${item.name}
							</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td rowspan="2">
					<input type="submit" value="提交">
				</td>
			</tr>
		</table>
	</form>
</body>
<script type="text/javascript">
	function init(i) {
		var emp_id = document.getElementById("emp_id");
		if (emp_id.value != null && emp_id.value != "") {
			emp_id.readOnly = "true";
		}
		if (i == '1') {
			alert("操作成功！");
		} else if (i == '0') {
			alert("操作失败！");
		}
	}
	function validate() {
		var id = document.getElementById("emp_id");
		var name = document.getElementById("name");
		if (id.value == "" || name.value == "") {
			alert("编号或名字不能为空");
			return false;
		} else {
			return true;
		}
	}
</script>
</ html>