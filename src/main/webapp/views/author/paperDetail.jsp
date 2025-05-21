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
.container {
	display: flex;
	gap: 10px;
	max-width: 1200px;
	margin: 10px auto;
	font-family: Arial, sans-serif;
	font-size: 12px;
}

.main-content {
	flex: 3;
	padding: 10px;
	font-family: "Times New Roman", Times, serif;
	font-size: 14px; /* cỡ chữ vừa phải, dễ đọc */
	line-height: 1.6; /* khoảng cách dòng rộng để đọc thoải mái */
	color: #555; /* màu xám nhạt hơn, chữ sẽ nhẹ nhàng hơn */
	text-align: justify; /* canh đều 2 bên, nhìn chuyên nghiệp */
}

.main-content img {
	max-width: 100%;
	height: auto;
	max-height: 2000px; /* tăng chiều cao tối đa ảnh */
	display: block;
	margin: 8px 0;
	border-radius: 4px;
	object-fit: cover;
}

.sidebar {
	flex: 1;
	background-color: #fafafa;
	padding: 5px;
	border-radius: 4px;
	max-height: 500px;
	overflow-y: auto;
	font-size: 11px;
}

.sidebar h3 {
	margin-top: 0;
	font-size: 14px;
	margin-bottom: 6px;
}

.related-item {
	margin-bottom: 6px;
	border-bottom: 1px solid #ddd;
	padding-bottom: 4px;
}

.related-item a {
	text-decoration: none;
	color: #111;
}

.related-item a:hover {
	color: #003366;
}
</style>

</head>
<body>
	<div class="container">
		<div class="main-content">
			<c:forEach items="${listPaper}" var="i">
				<c:if test="${i.id == paperId}">
					<h1>${i.paperName}</h1>
					<h4>
						<fmt:formatDate value="${i.paperDetail.createdAt}"
							pattern="dd/MM/yyyy HH:mm" />
					</h4>
					<p>${i.paperDetail.paperContent}</p>
					<!-- Form bình luận -->
					<h3>Bình luận</h3>
					<form action="${pageContext.request.contextPath}/submitComment"
						method="post" onsubmit="return validateCommentForm()">
						<input type="hidden" name="paperId" value="${i.id}" />
						<div>
							<label for="name">Tên:</label><br /> <input type="text"
								id="name" name="name" required
								style="width: 100%; padding: 6px;" />
						</div>
						<div>
							<label for="email">Email:</label><br /> <input type="email"
								id="email" name="email" required
								style="width: 100%; padding: 6px;" />
						</div>
						<div>
							<label for="comment">Nội dung:</label><br />
							<textarea id="comment" name="comment" rows="4" required
								style="width: 100%; padding: 6px;"></textarea>
						</div>
						<div style="margin-top: 10px;">
							<button type="submit" style="padding: 8px 16px;">Gửi
								bình luận</button>
						</div>
					</form>
				</c:if>
			</c:forEach>
		</div>

		<div class="sidebar">
			<h3>Bài báo liên quan</h3>
			<c:forEach items="${relatedPapers}" var="related">
				<div class="related-item">
					<a href="paperDetail?id=${related.id}">${related.paperName}</a>
				</div>
			</c:forEach>
		</div>
	</div>
	<script>
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
			// Kiểm tra định dạng email đơn giản
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