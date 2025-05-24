<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
<style>
:root {
	--color-primary: #34a6b7;
	--color-primary-dark: #2c8a98;
	--color-accent: #f39c12;
	--color-gray-light: #f8f9fa;
	--color-gray-medium: #ced4da;
	--color-gray-dark: #495057;
	--border-radius: 8px;
	--box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	--transition: all 0.3s ease-in-out;
}

body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background: linear-gradient(135deg, var(--color-primary-dark) 0%, var(--color-primary) 100%);
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	margin: 0;
}

.login-container {
	background-color: var(--color-gray-light);
	padding: 40px;
	border-radius: var(--border-radius);
	box-shadow: var(--box-shadow);
	width: 380px;
	max-width: 90%;
}

h2 {
	color: var(--color-primary-dark);
	text-align: center;
	margin-bottom: 30px;
	font-weight: 600;
}

.form-group {
	margin-bottom: 20px;
}

label {
	display: block;
	margin-bottom: 8px;
	color: var(--color-gray-dark);
	font-weight: bold;
	font-size: 1rem;
}

input[type="text"], input[type="password"] {
	width: calc(100% - 20px);
	padding: 12px;
	border: 1px solid var(--color-gray-medium);
	border-radius: var(--border-radius);
	font-size: 1rem;
	box-sizing: border-box;
	transition: border-color var(--transition);
}

input[type="text"]:focus, input[type="password"]:focus {
	outline: none;
	border-color: var(--color-primary);
	box-shadow: 0 0 5px rgba(52, 166, 183, 0.5);
}

button {
	width: 100%;
	padding: 14px;
	background-color: var(--color-primary);
	color: white;
	border: none;
	border-radius: var(--border-radius);
	font-size: 1.1rem;
	font-weight: bold;
	cursor: pointer;
	transition: background-color var(--transition), transform 0.2s ease-in-out, box-shadow var(--transition);
}

button:hover {
	background-color: var(--color-primary-dark);
	transform: translateY(-2px);
	box-shadow: 0 4px 10px rgba(52, 166, 183, 0.3);
}

.error {
	color: #e74c3c;
	margin-bottom: 15px;
	text-align: center;
	font-size: 0.9rem;
}

.note {
	font-size: 0.85rem;
	color: var(--color-gray-dark);
	margin-top: 25px;
	text-align: center;
	line-height: 1.6;
}

.note strong {
	font-weight: bold;
	color: var(--color-accent);
}
</style>
</head>
<body>
	<div class="login-container">
		<h2>Đăng nhập</h2>

		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>

		<form action="${pageContext.request.contextPath}/user/login"
			method="post">
			<input type="hidden" name="redirect" value="${redirect}" />
			<div class="form-group">
				<label for="email">Email</label>
				<input type="text" id="email" name="email" placeholder="Nhập địa chỉ email" required>
			</div>
			<div class="form-group">
				<label for="password">Mật khẩu</label>
				<input type="password" id="password" name="password" placeholder="Nhập mật khẩu" required>
			</div>
			<button type="submit">Đăng nhập</button>
		</form>

		<div class="note">
			Thông tin tài khoản quản trị viên (để thử nghiệm): <br>
			<strong>Email:</strong> <span style="color: var(--color-accent);">admin@gmail.com</span><br>
			<strong>Mật khẩu:</strong> <span style="color: var(--color-accent);">*****123</span>
		</div>
	</div>
</body>
</html>