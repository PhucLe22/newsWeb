<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${empty paper ? 'Thêm Bài Viết' : 'Chỉnh Sửa Bài Viết'}</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<script src="https://cdn.ckeditor.com/4.21.0/standard/ckeditor.js"></script>
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f8f9fa;
	margin: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}

.form-container {
	background-color: #fff;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	width: 80%;
	max-width: 900px;
}

h2 {
	text-align: center;
	color: #007bff;
	margin-bottom: 30px;
}

.mb-3 {
	margin-bottom: 20px;
}

label {
	font-weight: bold;
	color: #343a40;
	margin-bottom: 5px;
	display: block;
}

.form-control {
	width: 100%;
	padding: 10px 15px;
	border: 1px solid #ced4da;
	border-radius: 5px;
	box-sizing: border-box;
	font-size: 1rem;
}

.form-select {
	width: 100%;
	padding: 10px 15px;
	border: 1px solid #ced4da;
	border-radius: 5px;
	box-sizing: border-box;
	font-size: 1rem;
}

.form-file {
	margin-top: 5px;
}

.btn-primary {
	background-color: #007bff;
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
	background-color: #0056b3;
}

.alert {
	text-align: center;
	margin-bottom: 20px;
	border-radius: 5px;
	padding: 10px 15px;
}

.alert-danger {
	background-color: #f8d7da;
	color: #721c24;
	border: 1px solid #f5c6cb;
}

.alert-success {
	background-color: #d4edda;
	color: #155724;
	border: 1px solid #c3e6cb;
}
</style>
</head>
<body>
	<div class="form-container">
		<h2>
			<i class="fas fa-pen-nib"></i> ${empty paper ? 'Thêm Bài Viết Mới' : 'Chỉnh Sửa Bài Viết'}
		</h2>

		<c:if test="${not empty message}">
			<div
				class="alert ${message.contains('thành công') ? 'alert-success' : 'alert-danger'}">
				${message}</div>
		</c:if>

		<form
			action="${pageContext.request.contextPath}${empty paper ? '/author/add' : '/author/edit'}"
			method="post" enctype="multipart/form-data">

			<c:if test="${not empty paper}">
				<input type="hidden" name="paperId" value="${paper.id}" />
			</c:if>

			<div class="mb-3">
				<label for="paperName" class="form-label"><i
					class="fas fa-heading"></i> Tiêu đề</label> <input type="text"
					class="form-control" id="paperName" name="PaperName"
					value="${paper.paperName}" placeholder="Nhập tên bài báo" required>
			</div>

			<div class="mb-3">
				<label class="form-label"><i class="fas fa-tag"></i> Loại
					bài viết:</label> <select class="form-select" name="PaperTypeId" required>
					<option value="">-- Chọn loại --</option>
					<c:forEach var="type" items="${PaperTypes}">
						<option value="${type.id}"
							${not empty paper && type.id == paper.paperType.id ? 'selected' : ''}>
							${type.paperTypeName}</option>
					</c:forEach>
				</select>
			</div>

			<div class="mb-3">
				<label for="PaperContent" class="form-label"><i
					class="fas fa-file-alt"></i> Nội dung bài viết:</label>
				<textarea class="form-control" name="PaperContent" id="PaperContent"
					rows="8" required>${paper.paperDetail.paperContent}</textarea>
			</div>

			<div class="mb-3">
				<label for="PaperImage" class="form-label"><i
					class="fas fa-image"></i> Đường dẫn ảnh:</label> <input type="text"
					class="form-control" id="PaperImage" name="PaperImage"
					value="${paper.paperDetail.paperImage}"
					placeholder="Ví dụ: images/example.jpg" required>
			</div>

			<div class="mb-3">
				<label for="PaperImageDescription" class="form-label"><i
					class="fas fa-file-image"></i> Mô tả ảnh:</label> <input type="text"
					class="form-control" id="PaperImageDescription"
					name="PaperImageDescription"
					value="${paper.paperDetail.paperImageDescription}"
					placeholder="Ảnh này mô tả về..." required>
			</div>

			<div class="mb-3">
				<label for="PaperAttachment" class="form-label"><i
					class="fas fa-paperclip"></i> Tệp đính kèm (Word hoặc PDF):</label> <input
					type="file" class="form-control form-file" id="PaperAttachment"
					name="PaperAttachment" accept=".pdf,.doc,.docx">
			</div>

			<div class="mb-3">
				<label class="form-label"><i class="fas fa-eye"></i> Trạng
					thái:</label> <select class="form-select" name="status">
					<option value="1" ${paper.status == 1 ? 'selected' : ''}>Công
						khai</option>
					<option value="0" ${paper.status == 0 ? 'selected' : ''}>Riêng
						tư</option>
				</select>
			</div>

			<button type="submit" class="btn btn-primary">
				<i class="fas fa-save"></i> ${empty paper ? 'Gửi Bài Viết' : 'Cập Nhật Bài Viết'}
			</button>
		</form>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
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
						items : [ 'Undo', 'Redo', '-', 'Cut', 'Copy', 'Paste',
								'PasteText', 'PasteFromWord' ]
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
					} ],
			pasteFromWordRemoveFontStyles : false,
			pasteFromWordRemoveStyles : false,
			pasteFilter : null
		});
	</script>
</body>
</html>