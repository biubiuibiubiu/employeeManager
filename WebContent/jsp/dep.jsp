<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加或修改部门信息</title>
</head>
<body onload="init('${param.result}')">
	<form action="updateDep" method="post" onsubmit="return validate()">
		<table align="center">
			<tr>
				<td>编号</td>
				<td>
					<input id="dep_id" type="text" name="dep_id" value="${dep.dep_id}">
				</td>
			</tr>
			<tr>
				<td>名字</td>
				<td>
					<input type="text" name="name" value="${dep.name}">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="提交">
				</td>
			</tr>
		</table>
	</form>
</body>
<script type="text/javascript">
	function init(i) {
		var dep_id = document.getElementById("dep_id");
		if (dep_id.value != null && dep_id.value != "") {
			dep_id.readOnly = "true";
		}
		if (i == '1') {
			alert("操作成功！");
		} else if (i == '0') {
			alert("操作失败！");
		}
	}
	function validate() {
		var id = document.getElementById("dep_id");
		if (id.value == "") {
			alert("编号不能为空");
			return false;
		} else {
			return true;
		}

	}
</script>
</html>