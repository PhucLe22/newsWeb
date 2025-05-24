<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
<style>
body {
	font-family: Arial, sans-serif;
	background: #ecf0f1;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.login-container {
	background: #fff;
	padding: 40px;
	border-radius: 12px;
	box-shadow: 0px 0px 10px #ccc;
	width: 360px;
}

h2 {
	text-align: center;
	margin-bottom: 24px;
}

label {
	font-weight: bold;
}

input[type="text"], input[type="password"] {
	width: 100%;
	padding: 10px;
	margin: 8px 0 20px 0;
	border: 1px solid #ccc;
	border-radius: 6px;
}

button {
	width: 100%;
	padding: 12px;
	background: #2980b9;
	color: white;
	border: none;
	border-radius: 6px;
	font-weight: bold;
	cursor: pointer;
}

button:hover {
	background: #3498db;
}

.back-button {
	margin-top: 12px;
	width: 100%;
	padding: 10px;
	background: #bdc3c7;
	color: black;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	display: block;
	font-weight: bold;
}

.back-button:hover {
	background: #95a5a6;
}

.error {
	color: red;
	margin-bottom: 12px;
	text-align: center;
}

.note {
	font-size: 13px;
	color: #888;
	margin-top: 16px;
	text-align: center;
}
</style>
</head>
<body>
	<div class="login-container">
		<h2>Đăng nhập</h2>

		<!-- Thông báo lỗi -->
		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>

		<form action="${pageContext.request.contextPath}/user/login"
			method="post">
			<input type="hidden" name="redirect" value="${redirect}" /> <label
				for="email">Email</label> <input type="text" id="email" name="email"
				placeholder="Nhập email" required> <label for="password">Mật
				khẩu</label> <input type="password" id="password" name="password"
				placeholder="Nhập mật khẩu" required>
			<button type="submit">Đăng nhập</button>
		</form>

		<div class="note">
			Tài khoản admin mặc định: <br> <strong>admin@gmail.com</strong><br>
			Mật khẩu: <strong>admin123</strong>
		</div>
	</div>
</body>
</html>
