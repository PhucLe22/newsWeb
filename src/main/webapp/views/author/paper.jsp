<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Danh sách bài viết</title>
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
		<thead>
		</thead>
		<tbody>
			<c:forEach var="detail" items="${ListDetail}">
				<p>${detail.paperContent}</p>
			</c:forEach>

		</tbody>
	</table>
	<form action="${pageContext.request.contextPath}/author/add"
		method="post" enctype="multipart/form-data">
		<input type="submit" value="Thêm bài viết" />
	</form>
</body>
</html>
