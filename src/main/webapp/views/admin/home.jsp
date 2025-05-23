<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Home - Thông tin cá nhân</title>
<style>
body {
	margin: 0;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	display: flex;
	background-color: #f4f6f8;
	color: #333;
}

/* Sidebar cố định bên trái */
.sidebar {
	width: 240px;
	background-color: #30475e;
	color: #fff;
	padding: 30px 20px;
	height: 100vh;
	position: fixed;
	top: 0;
	left: 0;
	box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
	display: flex;
	flex-direction: column;
}

.sidebar-header {
	text-align: center;
	margin-bottom: 30px;
}

.sidebar-header h2 {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 5px;
}

.sidebar-header p {
	font-size: 14px;
	color: #ddd;
}

.sidebar-menu a {
	display: block;
	color: #fff;
	text-decoration: none;
	padding: 12px 15px;
	border-radius: 6px;
	margin-bottom: 8px;
	transition: background-color 0.3s ease;
}

.sidebar-menu a:hover {
	background-color: #445d75;
}

.sidebar-menu a i {
	margin-right: 10px;
	width: 20px;
	text-align: center;
}

.sidebar-menu .active {
	background-color: #587ea3;
	font-weight: bold;
}

/* Phần content đẩy qua bên phải sidebar */
.content {
	margin-left: 260px;
	padding: 40px;
	width: calc(100% - 260px);
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
}

.content-header {
	margin-bottom: 30px;
	border-bottom: 2px solid #eee;
	padding-bottom: 20px;
}

.content-header h1 {
	font-size: 28px;
	color: #333;
	margin-bottom: 8px;
}

.content-header p {
	font-size: 16px;
	color: #777;
}

/* Thông tin người dùng */
.user-profile {
	background-color: #fff;
	padding: 30px;
	border-radius: 8px;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
	display: flex;
	align-items: center;
}

.profile-avatar-container {
	width: 140px;
	height: 140px;
	border-radius: 50%;
	overflow: hidden;
	margin-right: 30px;
	border: 4px solid #e0f2f7;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.profile-avatar {
	width: 100%;
	height: 100%;
	object-fit: cover;
	display: block;
}

.profile-info {
	flex-grow: 1;
}

.profile-name {
	font-size: 26px;
	font-weight: bold;
	color: #2c3e50;
	margin-bottom: 8px;
}

.profile-role {
	font-size: 18px;
	color: #5dade2;
	font-weight: 500;
	margin-bottom: 15px;
}

.info-item {
	font-size: 16px;
	color: #555;
	line-height: 1.7;
	margin-bottom: 10px;
}

.info-item strong {
	display: inline-block;
	width: 140px;
	font-weight: 600;
	color: #333;
}
</style>
</head>
<body>
	<%@ include file="/views/admin/sidebar.jsp"%>

	<div class="content">
		<div class="content-header">
			<h1>Thông tin</h1>
		</div>

		<div class="profile-info">
			<div class="profile-name">${user.fullname}</div>
			<div class="profile-role">
			</div>
			<div class="info-item">
				<strong>Email:</strong> ${user.email}
			</div>
			<div class="info-item">
				<strong>Số điện thoại:</strong>
				<c:choose>
					<c:when test="${not empty user.phoneNumber}">
                ${user.phone}
            </c:when>
					<c:otherwise>
                ********45
            </c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>

	<script src="https://kit.fontawesome.com/your-fontawesome-kit.js"
		crossorigin="anonymous"></script>
</body>
</html>