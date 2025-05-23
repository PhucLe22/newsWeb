<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách người dùng và vai trò</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f7f7f7;
	display: flex;
}

/* Sidebar đã include */
.sidebar {
	width: 220px;
	background-color: #2c3e50;
	color: white;
	padding: 20px;
	height: 100vh;
	position: fixed;
	left: 0;
	top: 0;
}

.container {
	margin-left: 240px; /* Né sidebar */
	padding: 40px 20px;
	width: calc(100% - 240px);
}

h3 {
	color: #2c3e50;
	margin-bottom: 30px;
	text-align: center;
}

.table-box {
	background-color: #fff;
	padding: 20px 30px;
	border-radius: 12px;
	box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	padding: 12px 15px;
	border: 1px solid #ddd;
	text-align: left;
}

th {
	background-color: #3498db;
	color: white;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

button {
	padding: 6px 12px;
	background-color: #2ecc71;
	border: none;
	color: white;
	border-radius: 4px;
	cursor: pointer;
}

button:hover {
	background-color: #27ae60;
}
</style>
</head>
<body>

	<%@ include file="/views/admin/sidebar.jsp"%>

	<div class="container">
		<h3>Danh sách người dùng và vai trò</h3>

		<div class="table-box">
			<table>
				<thead>
					<tr>
						<th>User Name</th>
						<th>Role</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${userList}">
						<tr>
							<td>${user.fullname}</td>
							<td>
								<form
									action="${pageContext.request.contextPath}/user/role/update"
									method="post">
									<input type="hidden" name="userId" value="${user.id}" /> <select
										name="roleId">
										<c:forEach var="role" items="${roleList}">
											<option value="${role.id}"
												${role.id == user.role.id ? 'selected' : ''}>
												${role.name}</option>
										</c:forEach>
									</select>
									<button type="submit">Cập nhật</button>
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>
