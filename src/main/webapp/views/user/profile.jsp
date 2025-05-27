<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="vn.iotstar.entity.User, java.util.List, vn.iotstar.entity.Paper"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang cá nhân</title>
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	margin: 0;
	background-color: #f4f6f8;
	color: #333;
}

header, footer {
	background-color: #1e88e5;
	color: white;
	padding: 15px 30px;
	text-align: center;
}

header h1, footer p {
	margin: 0;
}

.profile-container {
	max-width: 700px;
	margin: 40px auto;
	background-color: white;
	padding: 30px;
	border-radius: 12px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.profile-info p {
	font-size: 16px;
	margin: 12px 0;
}

.profile-info img {
	border-radius: 8px;
	margin-top: 10px;
	border: 1px solid #ccc;
	box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.1);
}
</style>
</head>
<body>
	<%@ include file="/views/header.jsp"%>

	<%
	User user = (User) request.getAttribute("user");
	List<Paper> savedPapers = (List<Paper>) request.getAttribute("savedPapers");
	%>

	<div class="profile-container">
		<h2>Thông tin cá nhân</h2>
		<div class="profile-info">
			<p>
				<strong>Họ tên:</strong>
				<%=user.getFullname()%></p>
			<p>
				<strong>Email:</strong>
				<%=user.getEmail() != null ? user.getEmail() : "Chưa cập nhật"%></p>
			<p>
				<strong>Số điện thoại:</strong>
				<%=user.getPhoneNumber() != null ? user.getPhoneNumber() : "Chưa cập nhật"%></p>
			<p>
				<strong>Avatar:</strong><br> <img
					src="<%=user.getAvatarUrl()%>" width="120" height="120">
			</p>
		</div>
	</div>
	<%@ include file="/views/footer.jsp"%>
</body>
</html>
