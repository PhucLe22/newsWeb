<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm Bài Viết</title>

<!-- CKEditor CDN -->
<script src="https://cdn.ckeditor.com/4.21.0/standard/ckeditor.js"></script>

<style>
body {
	font-family: Arial, sans-serif;
	margin: 30px;
	background-color: #f7f7f7;
}

form {
	background-color: #fff;
	padding: 25px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 800px;
	margin: auto;
}

h2 {
	text-align: center;
	margin-bottom: 25px;
}

label {
	font-weight: bold;
}

input[type="text"], select, textarea {
	width: 100%;
	padding: 8px;
	margin-top: 5px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
}

input[type="file"] {
	margin-top: 5px;
	margin-bottom: 10px;
}

input[type="submit"] {
	background-color: #28a745;
	color: white;
	border: none;
	padding: 12px 20px;
	border-radius: 5px;
	cursor: pointer;
	width: 100%;
}

input[type="submit"]:hover {
	background-color: #218838;
}

.error {
	color: red;
	text-align: center;
	margin-bottom: 15px;
}

.success {
	color: green;
	text-align: center;
	margin-bottom: 15px;
}
</style>
</head>
<body>

	<form action="${pageContext.request.contextPath}/author/add"
		method="post" enctype="multipart/form-data">
		<h2>Thêm Bài Viết</h2>

		<c:if test="${not empty message}">
			<p class="${message.contains('thành công') ? 'success' : 'error'}">${message}</p>
		</c:if>

		<div>
			<label for="paperName">Tiêu đề</label> <input type="text"
				id="paperName" name="PaperName" placeholder="Nhập tên bài báo"
				required />
		</div>

		<div>
			<label>Loại bài viết:</label> <select name="PaperTypeId" required>
				<option value="">-- Chọn loại --</option>
				<c:forEach var="type" items="${PaperTypes}">
					<option value="${type.id}">${type.paperTypeName}</option>
				</c:forEach>
			</select>
		</div>

		<div>
			<label>Nội dung bài viết:</label>
			<textarea name="PaperContent" id="PaperContent" required></textarea>
		</div>

		<div>
			<label>Đường dẫn ảnh:</label> <input type="text" name="PaperImage"
				placeholder="images/example.jpg" required />
		</div>

		<div>
			<label>Mô tả ảnh:</label> <input type="text"
				name="PaperImageDescription" placeholder="Vd: http://default.jpg" required />
		</div>
		<div>
			<label>Video (nếu có):</label> <input type="text"
				name="PaperVideoStr" placeholder="https://youtube.com/..." />
		</div>

		<!-- 🆕 Mục tải file Word hoặc PDF -->
		<div>
			<label>Tệp đính kèm (Word hoặc PDF):</label> <input type="file"
				name="PaperAttachment" accept=".pdf,.doc,.docx" />
		</div>

		<input type="submit" value="Gửi Bài Viết" />
	</form>

	<!-- Kích hoạt CKEditor -->
	<script>
		CKEDITOR.replace('PaperContent', {
			height : 300,
			toolbar : [
					{
						name : 'document',
						items : [ 'Source', '-', 'Preview', 'Print' ]
					},
					{
						name : 'clipboard',
						items : [ 'Undo', 'Redo' ]
					},
					{
						name : 'styles',
						items : [ 'Format', 'Font', 'FontSize' ]
					},
					{
						name : 'basicstyles',
						items : [ 'Bold', 'Italic', 'Underline', 'Strike', '-',
								'RemoveFormat' ]
					},
					{
						name : 'colors',
						items : [ 'TextColor', 'BGColor' ]
					},
					{
						name : 'insert',
						items : [ 'Image', 'Table', 'HorizontalRule',
								'SpecialChar', 'Iframe' ]
					},
					{
						name : 'paragraph',
						items : [ 'NumberedList', 'BulletedList', '-',
								'Outdent', 'Indent', '-', 'JustifyLeft',
								'JustifyCenter', 'JustifyRight' ]
					}, {
						name : 'links',
						items : [ 'Link', 'Unlink' ]
					} ]
		});
	</script>
</body>
</html>
