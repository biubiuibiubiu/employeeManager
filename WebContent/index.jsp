<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="jsp/js/jquery-3.1.1.min.js"></script>
<title>Employee Manager</title>
<style>
body {
	text-align: center;
	height:600px;
}

iframe {
	text-align: center;
	width: 100%;
	height: auto;
	width: 100%;
}
</style>
</head>
<body onload="init()">
	<div>
		<button id="depManager">管理部门</button>
		<button id="empManager">管理员工</button>
	</div>
	<br>

	<form action="search" target="content" method="post">
		<a>查找员工：</a>
		<input type="text" name="key" value="${search.key}" />
		<input type="radio" name="type" value="emp" id="emp" />
		<label for="emp">按员工编号</label>
		<input type="radio" name="type" value="dep" id="dep" />
		<label for="dep">按部门编号</label>
		<input type="submit" id="sub" />

	</form>
	<hr />
	<iframe id="content" name="content" frameborder="0" scrolling="no"
		width="100%" height="500px"></iframe>
</body>
<script type="text/javascript">
	function init() {
		var tmp = document.getElementById('${search.type}');
		if (tmp == null) {
			var emp = document.getElementById("emp");
			emp.checked = true;
		} else {
			tmp.checked = true;
		}
	}
	$("#depManager").click(function() {
		$("#content").attr("src", "getDepList");
	});
	$("#empManager").click(function() {
		$("#content").attr("src", "search?type=emp");
	});
</script>
</html>