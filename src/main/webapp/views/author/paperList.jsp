<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Quản lý Bài Báo</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	margin: 20px;
	background-color: #f4f6f8;
	color: #333;
	line-height: 1.6;
}

.container {
	max-width: 960px;
	margin: 20px auto;
	padding: 30px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

h2 {
	color: #007bff;
	margin-bottom: 20px;
	border-bottom: 2px solid #eee;
	padding-bottom: 10px;
}

.paper-list {
	margin-bottom: 30px;
}

.paper-item {
	background-color: #fff;
	border: 1px solid #ddd;
	border-radius: 6px;
	margin-bottom: 15px;
	overflow: hidden;
	display: flex;
	align-items: center;
	box-shadow: 0 1px 5px rgba(0, 0, 0, 0.08);
	transition: transform 0.2s ease-in-out;
}

.paper-item:hover {
	transform: translateY(-2px);
	box-shadow: 0 3px 8px rgba(0, 0, 0, 0.12);
}

.paper-image {
	width: 120px;
	height: 90px;
	object-fit: cover;
	border-right: 1px solid #eee;
	flex-shrink: 0;
}

.paper-details {
	padding: 15px;
	flex-grow: 1;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.paper-info button {
	background: none;
	border: none;
	padding: 0;
	cursor: pointer;
	text-align: left;
	width: 100%;
}

.paper-info span {
	color: #28a745;
	font-weight: bold;
	display: block;
	margin-bottom: 5px;
	font-size: 1.1em;
}

.paper-actions {
	display: flex;
	gap: 10px;
}

.action-button {
	background-color: #007bff;
	color: white;
	border: none;
	padding: 8px 12px;
	border-radius: 5px;
	cursor: pointer;
	font-size: 0.9em;
	transition: background-color 0.2s ease;
	text-decoration: none;
}

.action-button:hover {
	background-color: #0056b3;
}

.edit-button {
	background-color: #ffc107;
}

.edit-button:hover {
	background-color: #e0a800;
}

.status-select {
	padding: 8px;
	border-radius: 5px;
	border: 1px solid #ccc;
	font-size: 0.9em;
	cursor: pointer;
}

.add-section {
	margin-top: 30px;
	padding: 20px;
	background-color: #e9ecef;
	border-radius: 6px;
	text-align: center;
}

.add-button input[type="submit"] {
	padding: 10px 20px;
	font-size: 1em;
	background-color: #28a745;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.2s ease;
}

.add-button input[type="submit"]:hover {
	background-color: #218838;
}

h3 {
	color: #6c757d;
	margin-top: 0;
	margin-bottom: 15px;
}
</style>
</head>
<body>
	<div class="container">
		<h2>
			<i class="fas fa-newspaper"></i> Quản lý Bài Báo
		</h2>
		<div class="paper-list">
			<c:forEach items="${ListPaper}" var="paper">
				<div class="paper-item">
					<img src="${paper.paperDetail.paperImage}" alt="${paper.paperName}"
						class="paper-image" />
					<div class="paper-details">
						<div class="paper-info">
							<form
								action="${pageContext.request.contextPath}/user/paperDetail"
								method="get" style="margin: 0;">
								<input type="hidden" name="id" value="${paper.id}" />
								<button type="submit">
									<span class="paper-title">${paper.paperName}</span>
								</button>
							</form>
						</div>
						<div class="paper-actions">
							<a
								href="${pageContext.request.contextPath}/author/edit?id=${paper.id}"
								class="action-button edit-button"><i class="fas fa-edit"></i>
								Sửa</a>
							<form
								action="${pageContext.request.contextPath}/author/paper/status"
								method="post">
								<input type="hidden" name="paperId" value="${paper.id}" /> <select
									name="status" class="status-select"
									onchange="this.form.submit()">
									<option value="1" ${paper.status == 1 ? 'selected' : ''}>Công
										khai</option>
									<option value="0" ${paper.status == 0 ? 'selected' : ''}>Riêng
										tư</option>
								</select>
							</form>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

		<div class="add-section">
			<h3>
				<i class="fas fa-plus-circle"></i> Thêm Bài Báo Mới
			</h3>
			<div class="add-button">
				<form action="${pageContext.request.contextPath}/author/add"
					method="post">
					<input type="submit" value="Thêm Bài Báo" />
				</form>
			</div>
		</div>
	</div>
</body>
</html>