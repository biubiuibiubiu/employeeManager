<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>部门列表</title>
</head>
<body onload="init(${param.result})">
	<table align="center">
		<tr>
			<td>编号</td>
			<td>部门</td>
			<td>操作</td>
		</tr>

		<c:forEach items="${depList}" var="item">
			<tr>
				<td>${item.dep_id}</td>
				<td>${item.name}</td>
				<td>
					<a href="getDepById?dep_id=${item.dep_id}">修改</a>
					<a href="deleteDep?dep_id=${item.dep_id}">删除</a>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td>
				<a href="addDep">添加部门</a>
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