<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Danh sách yêu thích</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f2f6fc;
	margin: 20px;
}

h1 {
	text-align: center;
	color: #333;
}

table {
	border-collapse: collapse;
	width: 90%;
	margin: 20px auto;
	background: white;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15);
	border-radius: 8px;
	overflow: hidden;
}

th, td {
	padding: 12px 20px;
	text-align: left;
	border-bottom: 1px solid #ddd;
	color: #555;
}

th {
	background-color: #007BFF;
	color: white;
}

tr:hover {
	background-color: #f1f9ff;
}

caption {
	caption-side: top;
	margin-bottom: 10px;
	font-size: 1.5em;
	font-weight: bold;
	color: #007BFF;
}
</style>
</head>
<body>
	<table>
		<caption>Danh sách yêu thích của bạn</caption>
		<thead>
			<tr>
				<th>ID</th>
				<th>Tiêu đề</th>
				<th>Mô tả</th>
				<th>Ngày thêm</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${favoriteList}">
				<tr>
					<td>${item.id}</td>
					<td>${item.title}</td>
					<td>${item.description}</td>
					<td><fmt:formatDate value="${item.createdAt}"
							pattern="dd/MM/yyyy HH:mm" /></td>
				</tr>
			</c:forEach>
			<c:if test="${empty favoriteList}">
				<tr>
					<td colspan="4" style="text-align: center;">Không có bài viết
						yêu thích nào</td>
				</tr>
			</c:if>
		</tbody>
	</table>
</body>
</html>
