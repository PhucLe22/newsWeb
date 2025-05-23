<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tạo Danh Sách Yêu Thích</title>
<style>
body {
	font-family: Arial, sans-serif;
	padding: 40px;
}

form {
	max-width: 500px;
	margin: auto;
}

input[type="text"], textarea {
	width: 100%;
	padding: 10px;
	margin: 10px 0 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

input[type="submit"] {
	background-color: #2E8B57;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.error {
	color: red;
	margin-bottom: 15px;
}
</style>
</head>
<body>

	<h2>Tạo Danh Sách Yêu Thích Mới</h2>

	<c:if test="${not empty error}">
		<div class="error">${error}</div>
	</c:if>

	<form action="${pageContext.request.contextPath}/favoriteList/save"
		method="post">
		<label for="name">Tên danh sách yêu thích:</label> <input type="text"
			name="name" id="name" required> <label for="description">Mô
			tả:</label>
		<textarea name="description" id="description" rows="4"></textarea>

		<!-- Truyền paperId ẩn (được controller gửi sang) -->
		<input type="hidden" name="paperId" value="${paperId}"> <input
			type="submit" value="Lưu Danh Sách">
	</form>
</body>
</html>
