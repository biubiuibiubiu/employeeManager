<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body style="text-align: center; margin: 0; height: 500px;"
	onload="init('${param.result}')">

	<h3>
		<c:if test="${search.type == 'dep'}">所属部门编号：${search.key}</c:if>
	</h3>

	<table align="center">
		<tr>
			<td>编号</td>
			<td>名字</td>
			<td>年龄</td>
			<td>入职时间</td>
			<td>所属部门</td>
			<td>操作</td>
		</tr>

		<c:forEach items="${empList}" var="item">
			<tr>
				<td>${item.emp_id}</td>
				<td>${item.name}</td>
				<td>${item.age}</td>
				<td>${item.time}</td>
				<td>${item.dep.name}</td>
				<td>
					<a href="getEmpById?id=${item.emp_id}">修改</a>
					<a href="deleteEmp?emp_id=${item.emp_id}">删除</a>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td>
				<a href="addEmp" style="size: 50px;">添加员工</a>
			</td>
		</tr>
	</table>
</body>
<script type="text/javascript">
	function init(i) {
		if (i == '1') {
			alert("操作成功！");
		} else if (i == '0') {
			alert("操作失败！");
		}
	}
</script>
</html>