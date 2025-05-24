<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Đăng ký tài khoản</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
:root {
	--primary-color: #34a6b7; /* Màu xanh ngọc bích */
	--primary-darker: #2c8a98;
	--text-color: #333;
	--border-color: #ddd;
	--background-color: #f4f4f4;
	--box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	--border-radius: 8px;
	--transition: all 0.3s ease-in-out;
}

body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background: linear-gradient(135deg, var(--primary-darker) 0%,
		var(--primary-color) 100%);
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	margin: 0;
}

.registration-container {
	background-color: #fff;
	padding: 40px;
	border-radius: var(--border-radius);
	box-shadow: var(--box-shadow);
	width: 100%;
	max-width: 450px;
}

h1 {
	color: var(--primary-color);
	text-align: center;
	margin-bottom: 30px;
	font-weight: 600;
}

.form-group {
	margin-bottom: 25px;
}

label {
	display: block;
	margin-bottom: 8px;
	font-weight: bold;
	color: var(--text-color);
	font-size: 1rem;
}

.input-wrapper {
	position: relative;
}

.form-control {
	width: calc(100% - 30px);
	padding: 12px 15px;
	border: 1px solid var(--border-color);
	border-radius: var(--border-radius);
	box-sizing: border-box;
	font-size: 1rem;
	transition: border-color var(--transition), box-shadow var(--transition);
}

.form-control:focus {
	outline: none;
	border-color: var(--primary-color);
	box-shadow: 0 0 5px rgba(52, 166, 183, 0.5);
}

.icon {
	position: absolute;
	left: 12px;
	top: 50%;
	transform: translateY(-50%);
	color: var(--primary-color);
	font-size: 1rem;
}

.form-control {
	padding-left: 35px;
}

.btn-register {
	background-color: var(--primary-color);
	color: white;
	border: none;
	padding: 14px 20px;
	border-radius: var(--border-radius);
	cursor: pointer;
	font-size: 1.1rem;
	font-weight: bold;
	width: 100%;
	transition: background-color var(--transition), transform 0.2s
		ease-in-out, box-shadow var(--transition);
}

.btn-register:hover {
	background-color: var(--primary-darker);
	transform: translateY(-2px);
	box-shadow: 0 4px 10px rgba(52, 166, 183, 0.3);
}

.error-message {
	color: #e74c3c;
	text-align: center;
	margin-top: 15px;
	font-size: 0.9rem;
}
</style>
</head>
<body>
	<div class="registration-container">
		<h1>
			<i class="fas fa-user-plus"></i> Tạo tài khoản mới
		</h1>

		<c:if test="${not empty error}">
			<p class="error-message">
				<i class="fas fa-exclamation-triangle"></i> ${error}
			</p>
		</c:if>

		<form action="${pageContext.request.contextPath}/register"
			method="post">
			<div class="form-group">
				<label for="fullname"><i class="fas fa-user"></i> Họ tên:</label>
				<div class="input-wrapper">
					<i class="fas fa-user icon"></i> <input type="text"
						class="form-control" id="fullname" name="fullname"
						placeholder="Nhập đầy đủ họ và tên" required>
				</div>
			</div>

			<div class="form-group">
				<label for="email"><i class="fas fa-envelope"></i> Email:</label>
				<div class="input-wrapper">
					<i class="fas fa-envelope icon"></i> <input type="email"
						class="form-control" id="email" name="email"
						placeholder="Nhập địa chỉ email hợp lệ" required>
				</div>
			</div>

			<div class="form-group">
				<label for="password"><i class="fas fa-lock"></i> Mật khẩu:</label>
				<div class="input-wrapper">
					<i class="fas fa-lock icon"></i> <input type="password"
						class="form-control" id="password" name="password"
						placeholder="Nhập mật khẩu (ít nhất 6 ký tự)" required>
				</div>
			</div>

			<div class="form-group">
				<label for="phone"><i class="fas fa-phone"></i> Số điện
					thoại (tùy chọn):</label>
				<div class="input-wrapper">
					<i class="fas fa-phone icon"></i> <input type="text"
						class="form-control" id="phone" name="phone"
						placeholder="Nhập số điện thoại của bạn">
				</div>
			</div>

			<div class="form-group">
				<label for="avatarUrl"><i class="fas fa-image"></i> URL
					Avatar:</label>
				<div class="input-wrapper">
					<i class="fas fa-image icon"></i> <input type="url"
						class="form-control" id="avatarUrl" name="avatarUrl"
						placeholder="Dán URL hình ảnh của bạn">
				</div>
			</div>

			<button type="submit" class="btn-register">
				<i class="fas fa-sign-up"></i> Đăng ký
			</button>
		</form>
	</div>
</body>
</html>