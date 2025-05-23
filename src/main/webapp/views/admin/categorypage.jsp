<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard - Danh mục</title>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto&display=swap"
	rel="stylesheet">
<style>
body {
	font-family: 'Roboto', sans-serif;
	margin: 0;
	padding: 0;
	display: flex;
	background-color: #f0f2f5;
}

/* Sidebar cố định bên trái */
.sidebar {
	width: 220px;
	background-color: #2c3e50;
	color: white;
	position: fixed;
	top: 0;
	left: 0;
	height: 100vh;
	padding: 20px 0;
}

.sidebar h2 {
	text-align: center;
	margin-bottom: 30px;
}

.sidebar a {
	display: block;
	color: white;
	padding: 10px 20px;
	text-decoration: none;
	margin-left: 20px;
}

.sidebar a:hover {
	background-color: #34495e;
}

/* Main content bên phải */
.main {
	margin-left: 240px;
	padding: 30px;
	flex: 1;
}

/* Table */
.table-container {
	background-color: white;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 12px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

/* Button thêm */
.add-course-button {
	display: block;
	width: 200px;
	margin: 20px auto 0;
	padding: 12px 20px;
	background-color: #3498db;
	color: white;
	border: none;
	border-radius: 6px;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.add-course-button:hover {
	background-color: #2980b9;
}
</style>
</head>
<body>

	<%@ include file="/views/admin/sidebar.jsp"%>

	<div class="main">
		<h2>Danh mục</h2>
		<div class="table-container">
			<table>
				<thead>
					<tr>
						<th>STT</th>
						<th>Tên Danh Mục</th>
						<th>Hành Động</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${List}" var="c" varStatus="status">
						<tr>
							<td>${status.index + 1}</td>
							<td>${c.paperTypeName}</td>
							<td><a href="edit?id=${c.id}">Chỉnh sửa</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<form action="${pageContext.request.contextPath}/admin/add"
			method="get">
			<button type="submit" class="add-course-button">Thêm</button>
		</form>
	</div>

</body>
</html>
