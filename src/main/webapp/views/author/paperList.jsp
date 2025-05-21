<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách Bài Báo</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 30px;
	background-color: #f7f7f7;
}

.paper-list {
	margin-bottom: 20px;
}

.paper-item a {
	display: block;
	background-color: #007bff;
	color: white;
	padding: 10px 15px;
	margin-bottom: 10px;
	text-decoration: none;
	border-radius: 5px;
	width: fit-content;
}

.paper-item a:hover {
	background-color: #0056b3;
}

.paper-item {
	border: 1px solid #ccc;
	border-radius: 6px;
	padding: 8px;
	margin-bottom: 10px;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
	transition: box-shadow 0.2s ease;
	display: flex;
	align-items: center;
	gap: 15px;
	background-color: white;
}

.paper-item:hover {
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

.paper-item button {
	background: none;
	border: none;
	padding: 0;
	cursor: pointer;
	display: flex;
	align-items: center;
	width: 100%;
	text-align: left;
}

.paper-item img {
	width: 120px;
	height: 80px;
	object-fit: cover;
	border-radius: 4px;
	flex-shrink: 0;
	margin-right: 15px;
}

.paper-item span {
	color: #003366;
	font-size: 16px;
	font-weight: bold;
}

.add-button input {
	padding: 10px 20px;
	font-size: 16px;
	background-color: #28a745;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.add-button input:hover {
	background-color: #218838;
}
</style>
</head>
<body>
	<div class="paper-list">
		<h2>Danh sách Bài Báo đã lưu</h2>
		<c:forEach items="${ListPaper}" var="paper">
			<div class="paper-item" style="margin-bottom: 10px;">
				<form action="${pageContext.request.contextPath}/author/paperDetail"
					method="get" style="margin: 0; padding: 0; border: none;">

					<input type="hidden" name="id" value="${paper.id}" />

					<div style="display: flex; align-items: center; gap: 15px;">
						<button type="submit"
							style="background: none; border: none; padding: 0; cursor: pointer; text-align: left; display: flex; align-items: center; gap: 10px; flex-grow: 1;">
							<!-- Hình ảnh bài viết -->
							<img src="${paper.paperDetail.paperImage}"
								alt="${paper.paperName}"
								style="width: 100px; height: 70px; object-fit: cover; display: block;" />
							<!-- Tên bài viết -->
							<span style="color: blue; font-size: 14px;">${paper.paperName}</span>
						</button>
						<!-- Select trạng thái nằm ngang cùng ảnh và tên -->
						<select name="status"
							style="padding: 4px 8px; font-size: 14px; min-width: 100px;">
							<option value="1" ${paper.status == 1 ? 'selected' : ''}>Public</option>
							<option value="0" ${paper.status == 0 ? 'selected' : ''}>Private</option>
						</select>
					</div>

				</form>
			</div>
		</c:forEach>
	</div>

	<h3>Nếu chưa có thì bấm thêm bài báo!</h3>

	<div class="add-button">
		<form action="${pageContext.request.contextPath}/author/add"
			method="post">
			<input type="submit" value="Thêm Bài Báo" />
		</form>
	</div>
</body>
</html>
