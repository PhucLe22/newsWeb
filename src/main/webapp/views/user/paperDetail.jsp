<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>Xem Bài Viết</title>
<style>
/* CSS giữ nguyên như trước, chỉ thêm/sửa một vài chỗ */
.container {
	max-width: 1080px;
	margin: 20px auto;
	padding: 20px;
	display: flex;
	gap: 30px;
	font-family: Arial, sans-serif;
	font-size: 14px;
	background-color: #f9f9f9;
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	position: relative;
}

.main-content {
	flex: 3;
	padding: 20px;
	font-family: "Times New Roman", Times, serif;
	font-size: 16px;
	line-height: 1.7;
	color: #333;
	text-align: justify;
}

.main-content h1 {
	font-size: 2.4em;
	color: #003366;
	margin-bottom: 15px;
}

.main-content h4 {
	font-size: 1em;
	color: #777;
	margin-bottom: 20px;
}

.main-content img {
	max-width: 100%;
	height: auto;
	display: block;
	margin: 20px auto;
	border-radius: 6px;
	object-fit: contain;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
}

.main-content h3 {
	font-size: 1.8em;
	color: #003366;
	margin-top: 30px;
	margin-bottom: 15px;
	border-bottom: 2px solid #eee;
	padding-bottom: 8px;
}

.favorite-button-container {
	display: inline-block;
	position: relative;
}

.favorite-icon {
	font-size: 1.5em;
	color: #aaa;
	cursor: pointer;
	transition: color 0.3s ease;
	padding: 8px;
	border-radius: 50%;
}

.favorite-icon:hover, .favorite-icon.active {
	color: #ff6f61; /* Màu khi hover hoặc đã active */
}

.favorite-options {
	position: absolute;
	top: 100%;
	left: 0;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	z-index: 10;
	display: none; /* Ẩn ban đầu */
	min-width: 150px;
	padding: 10px;
	margin-top: 5px;
}

.favorite-options.show {
	display: block; /* Hiển thị khi được kích hoạt */
}

.favorite-options label {
	display: block;
	margin-bottom: 5px;
	font-weight: normal;
	color: #333;
}

.favorite-options input[type="text"] {
	width: calc(100% - 12px);
	padding: 8px;
	margin-bottom: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
	font-size: 1em;
}

.favorite-options button {
	background-color: #007bff;
	color: white;
	padding: 8px 12px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 1em;
	transition: background-color 0.3s ease;
	margin-top: 5px;
}

.favorite-options button:hover {
	background-color: #0056b3;
}

.favorite-options .existing-list-item {
	padding: 8px 0;
	border-bottom: 1px solid #eee;
}

.favorite-options .existing-list-item:last-child {
	border-bottom: none;
}

.favorite-options .existing-list-item label {
	display: flex;
	align-items: center;
	cursor: pointer;
}

.favorite-options .existing-list-item input[type="radio"] {
	margin-right: 8px;
}

.sidebar {
	flex: 1.2;
	background-color: #f0f0f0;
	padding: 20px;
	border-radius: 6px;
	max-height: calc(100vh - 40px);
	overflow-y: auto;
	font-size: 1em;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
	position: sticky;
	top: 20px;
}

.sidebar h3 {
	font-size: 1.6em;
	color: #333;
	margin-top: 0;
	margin-bottom: 12px;
	border-bottom: 1px solid #ddd;
	padding-bottom: 6px;
}

.related-item {
	margin-bottom: 10px;
	padding-bottom: 8px;
	border-bottom: 1px solid #eee;
}

.related-item a {
	text-decoration: none;
	color: #111;
	transition: color 0.3s ease;
	font-size: 1.1em;
}

.related-item a:hover {
	color: #003366;
}
</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
</head>
<body>
	<div class="container">
		<div class="main-content">
			<c:forEach items="${listPaper}" var="i">
				<c:if test="${i.id == paperId}">
					<h1>${i.paperName}</h1>

					<div class="favorite-button-container">
						<i class="fa-regular fa-bookmark favorite-icon"
							onclick="toggleFavoriteOptions(this)"></i>
						<div class="favorite-options" id="favoriteOptions-${i.id}">
							<h3>Lưu</h3>
							<form
								action="${pageContext.request.contextPath}/user/favoriteList"
								method="get">
								<input type="hidden" name="paperId" value="${i.id}" /> <label
									for="newList">Tạo danh sách mới:</label> <input type="text"
									id="newList" name="listName" placeholder="Tên danh sách mới" />
								<label for="newDescription">Mô tả:</label> <input type="text"
									id="newDescription" name="description" placeholder="Mô tả" />
								<button type="submit">Tạo và lưu</button>
							</form>

							<c:if test="${not empty favoriteLists}">
								<hr style="border-top: 1px dashed #ccc; margin: 10px 0;">
								<h3>Chọn danh sách có sẵn</h3>
								<form
									action="${pageContext.request.contextPath}/user/addToExistingList"
									method="post">
									<input type="hidden" name="paperId" value="${i.id}" />
									<c:forEach items="${favoriteLists}" var="list">
										<div class="existing-list-item">
											<label> <input type="radio" name="existingListId"
												value="${list.id}" required> ${list.listName}
											</label>
										</div>
									</c:forEach>
									<button type="submit">Lưu vào danh sách đã chọn</button>
								</form>
							</c:if>
						</div>
					</div>

					<h4>
						<fmt:formatDate value="${i.paperDetail.createdAt}"
							pattern="dd/MM/yyyy HH:mm" />
					</h4>

					<p>${i.paperDetail.paperContent}</p>

					<h3>Bình luận</h3>
					<form action="${pageContext.request.contextPath}/submitComment"
						method="post" onsubmit="return validateCommentForm()">
						<input type="hidden" name="paperId" value="${i.id}" />
						<div>
							<label for="name">Tên:</label><br /> <input type="text"
								id="name" name="name" required
								style="width: calc(100% - 20px); padding: 12px;" />
						</div>
						<div>
							<label for="email">Email:</label><br /> <input type="email"
								id="email" name="email" required
								style="width: calc(100% - 20px); padding: 12px;" />
						</div>
						<div>
							<label for="comment">Nội dung:</label><br />
							<textarea id="comment" name="comment" rows="6" required
								style="width: calc(100% - 20px); padding: 12px;"></textarea>
						</div>
						<div style="margin-top: 20px;">
							<button type="submit" style="padding: 14px 22px;">Gửi
								bình luận</button>
						</div>
					</form>
				</c:if>
			</c:forEach>
		</div>

		<div class="sidebar">
			<h3>Bài báo liên quan</h3>
			<c:forEach items="${relatedList}" var="related">
				<div class="related-item"
					style="display: flex; margin-bottom: 12px;">
					<a href="paperDetail?id=${related.id}"
						style="display: flex; align-items: center; text-decoration: none; color: #333;">
						<img
						src="${not empty related.paperDetail.paperImage ? related.paperDetail.paperImage : '/newsWeb/views/Images/default-paper.png'}"
						alt="${related.paperName}"
						style="width: 80px; height: 60px; object-fit: cover; margin-right: 10px; border-radius: 4px;" />
						<span>${related.paperName}</span>
					</a>
				</div>
			</c:forEach>
		</div>
		<script>
			function toggleFavoriteOptions(icon) {
				const options = icon.nextElementSibling;
				options.classList.toggle('show');
				icon.classList.toggle('active');
			}

			function validateCommentForm() {
				const name = document.getElementById('name').value.trim();
				const email = document.getElementById('email').value.trim();
				const comment = document.getElementById('comment').value.trim();

				if (!name) {
					alert('Vui lòng nhập tên.');
					return false;
				}
				if (!email) {
					alert('Vui lòng nhập email.');
					return false;
				}
				const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
				if (!emailPattern.test(email)) {
					alert('Email không đúng định dạng.');
					return false;
				}
				if (!comment) {
					alert('Vui lòng nhập nội dung bình luận.');
					return false;
				}
				return true;
			}
		</script>
</body>
</html>