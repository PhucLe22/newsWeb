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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f8f9fa;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	margin: 0;
}

.registration-container {
	background-color: #fff;
	padding: 40px;
	border-radius: 10px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	width: 100%;
	max-width: 500px;
}

h1 {
	color: #007bff;
	text-align: center;
	margin-bottom: 30px;
}

.form-group {
	margin-bottom: 20px;
}

label {
	display: block;
	margin-bottom: 8px;
	font-weight: bold;
	color: #343a40;
}

.form-control {
	width: 100%;
	padding: 12px 15px;
	border: 1px solid #ced4da;
	border-radius: 5px;
	box-sizing: border-box;
	font-size: 1rem;
}

.btn-primary {
	background-color: #28a745;
	color: white;
	border: none;
	padding: 12px 20px;
	border-radius: 5px;
	cursor: pointer;
	font-size: 1rem;
	transition: background-color 0.2s ease;
	width: 100%;
}

.btn-primary:hover {
	background-color: #218838;
}

.error-message {
	color: #dc3545;
	text-align: center;
	margin-bottom: 15px;
}
</style>
</head>
<body>
	<div class="registration-container">
		<h1>
			<i class="fas fa-user-plus"></i> Đăng ký tài khoản
		</h1>

		<c:if test="${not empty error}">
			<p class="error-message">
				<i class="fas fa-exclamation-triangle"></i> ${error}
			</p>
		</c:if>

		<form action="${pageContext.request.contextPath}/register"
			method="post">
			<div class="form-group">
				<label for="fullname"><i class="fas fa-user"></i> Họ tên:</label> <input
					type="text" class="form-control" id="fullname" name="fullname"
					placeholder="Nhập họ và tên" required>
			</div>

			<div class="form-group">
				<label for="email"><i class="fas fa-envelope"></i> Email:</label> <input
					type="email" class="form-control" id="email" name="email"
					placeholder="Nhập địa chỉ email" required>
			</div>

			<div class="form-group">
				<label for="password"><i class="fas fa-lock"></i> Mật khẩu:</label>
				<input type="password" class="form-control" id="password"
					name="password" placeholder="Nhập mật khẩu" required>
			</div>

			<div class="form-group">
				<label for="phone"><i class="fas fa-phone"></i> Số điện
					thoại:</label> <input type="text" class="form-control" id="phone"
					name="phone" placeholder="Nhập số điện thoại (tùy chọn)">
			</div>

			<button type="submit" class="btn btn-primary">
				<i class="fas fa-sign-up"></i> Đăng ký
			</button>
		</form>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>