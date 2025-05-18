<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách Bài Báo</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 30px;
	background-color: #f7f7f7;
}

.paper-list {
	margin-bottom: 20px;
}

.paper-item a {
	display: block;
	background-color: #007bff;
	color: white;
	padding: 10px 15px;
	margin-bottom: 10px;
	text-decoration: none;
	border-radius: 5px;
	width: fit-content;
}

.paper-item a:hover {
	background-color: #0056b3;
}

.add-button input {
	padding: 10px 20px;
	font-size: 16px;
	background-color: #28a745;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.add-button input:hover {
	background-color: #218838;
}
</style>
</head>
<body>

	<div class="paper-list">
		<h2>Danh sách Bài Báo đã lưu</h2>
		<c:forEach items="${ListPaper}" var="paper">
			<div class="paper-item">
				<form action="${pageContext.request.contextPath}/author/add"
					method="get">
					<input type="hidden" name="id" value="${paper.id}" />
					<button type="submit"
						style="background: none; border: none; color: blue; cursor: pointer;">
						${paper.paperName}</button>
				</form>
			</div>
		</c:forEach>
	</div>

	<h3>Nếu chưa có thì bấm thêm bài báo!</h3>

	<div class="add-button">
		<form action="${pageContext.request.contextPath}/author/add"
			method="post">
			<input type="submit" value="Thêm Bài Báo" />
		</form>
	</div>
</body>
</html>
