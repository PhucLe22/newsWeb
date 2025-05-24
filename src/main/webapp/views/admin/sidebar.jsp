<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.sidebar {
	width: 220px;
	height: 100vh;
	background-color: #2c3e50;
	color: white;
	position: fixed;
	top: 0;
	left: 0;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	padding: 20px 0;
	box-sizing: border-box;
}

.sidebar-nav {
	flex-grow: 1;
}

.sidebar h2 {
	text-align: center;
	margin-bottom: 30px;
}

.sidebar a {
	display: block;
	color: white;
	padding: 12px 30px;
	text-decoration: none;
	transition: background-color 0.2s ease;
}

.sidebar a:hover {
	background-color: #34495e;
}

/* Nút đăng xuất */
.logout-form {
	text-align: center;
	padding-bottom: 20px;
}

.logout-btn {
	background-color: #ffffff;
	color: #2c3e50;
	border: none;
	padding: 10px 20px;
	border-radius: 6px;
	font-size: 16px;
	cursor: pointer;
	transition: all 0.3s ease;
	border: 1px solid #ccc;
}

.logout-btn:hover {
	background-color: #f8d7da; /* đỏ nhạt */
	color: #c0392b;
}
</style>

<div class="sidebar">
	<div class="sidebar-nav">
		<h2>Admin</h2>
		<a href="${pageContext.request.contextPath}/admin/home">Trang chủ</a>
		<a href="${pageContext.request.contextPath}/user/role/update">Tài
			khoản</a> <a href="${pageContext.request.contextPath}/admin/category">Danh
			mục</a>
	</div>

	<div class="logout-form">
		<form action="${pageContext.request.contextPath}/user/logout"
			method="get">
			<button type="submit" class="logout-btn">Đăng xuất</button>
		</form>
	</div>
	<script>
		function confirmLogout() {
			return confirm("Bạn có chắc chắn muốn đăng xuất?");
		}
	</script>
</div>


