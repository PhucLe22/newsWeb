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
	font-family: Arial, sans-serif;
	margin: 30px;
}

.profile-container {
	max-width: 600px;
}

.profile-info img {
	border-radius: 8px;
	margin-top: 10px;
}

.saved-papers {
	margin-top: 30px;
}

.saved-papers ul {
	padding-left: 20px;
}
</style>
</head>
<body>

	<div class="profile-container">
		<%
		User user = (User) request.getAttribute("user");
		List<Paper> savedPapers = (List<Paper>) request.getAttribute("savedPapers");
		%>

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
					src="<%=user.getAvatarUrl()%>" width="100" height="100">
			</p>
		</div>

		<div class="saved-papers">
			<h3>Bài báo đã lưu</h3>
			<%
			if (savedPapers != null && !savedPapers.isEmpty()) {
			%>
			<ul>
				<%
				for (Paper paper : savedPapers) {
				%>
				<li><%=paper.getPaperName()%></li>
				<%
				}
				%>
			</ul>
			<%
			} else {
			%>
			<p>Chưa lưu bài báo nào.</p>
			<%
			}
			%>
		</div>
	</div>
</body>
</html>
