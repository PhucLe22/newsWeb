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
	x box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
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
	display: inline-flex;
	align-items: center;
	position: relative;
}

.favorite-icon-wrapper {
	display: inline-flex;
	align-items: center;
	cursor: pointer;
}

.favorite-icon {
	font-size: 1.5em;
	color: #aaa;
	transition: color 0.3s ease, transform 0.2s ease-in-out;
	padding: 8px;
	border-radius: 50%;
}

.favorite-icon:hover, .favorite-icon.active {
	color: #ff6f61;
	transform: scale(1.1);
}

.favorite-text {
	margin-left: 8px;
	color: #555;
	transition: color 0.3s ease;
}

.favorite-icon-wrapper:hover .favorite-text {
	color: #ff6f61;
}

.favorite-options {
	position: absolute;
	top: 100%;
	left: 0;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 8px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
	z-index: 10;
	display: none;
	min-width: 280px;
	padding: 20px;
	margin-top: 8px;
}

.favorite-options.show {
	display: block;
}

.favorite-options h3 {
	font-size: 1.3em;
	color: #333;
	margin-top: 0;
	margin-bottom: 15px;
	border-bottom: 2px solid #007bff;
	padding-bottom: 8px;
}

/* Danh sách hiện có */
.existing-lists {
	margin-bottom: 20px;
}

.list-item {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 12px 15px;
	margin-bottom: 8px;
	background-color: #f8f9fa;
	border: 1px solid #e9ecef;
	border-radius: 6px;
	cursor: pointer;
	transition: all 0.3s ease;
}

.list-item:hover {
	background-color: #e7f3ff;
	border-color: #007bff;
	transform: translateY(-1px);
}

.list-item.selected {
	background-color: #007bff;
	color: white;
	border-color: #0056b3;
}

.list-info {
	flex: 1;
}

.list-name {
	font-weight: 600;
	font-size: 1.1em;
	margin-bottom: 2px;
}

.list-description {
	font-size: 0.9em;
	color: #666;
	margin: 0;
}

.list-item.selected .list-description {
	color: #e3f2fd;
}

.list-count {
	background-color: #007bff;
	color: white;
	padding: 4px 8px;
	border-radius: 12px;
	font-size: 0.85em;
	font-weight: 500;
}

.list-item.selected .list-count {
	background-color: #ffffff;
	color: #007bff;
}

/* Nút thêm danh sách mới */
.add-new-list {
	display: flex;
	align-items: center;
	padding: 12px 15px;
	margin-bottom: 15px;
	background-color: #e8f5e8;
	border: 2px dashed #28a745;
	border-radius: 6px;
	cursor: pointer;
	transition: all 0.3s ease;
}

.add-new-list:hover {
	background-color: #d4edda;
	border-color: #1e7e34;
}

.add-new-list i {
	font-size: 1.2em;
	color: #28a745;
	margin-right: 10px;
}

.add-new-list span {
	color: #28a745;
	font-weight: 600;
}

/* Form tạo danh sách mới */
.new-list-form {
	display: none;
	background-color: #f8f9fa;
	padding: 15px;
	border-radius: 6px;
	border: 1px solid #dee2e6;
	margin-bottom: 15px;
}

.new-list-form.show {
	display: block;
}

.form-group {
	margin-bottom: 12px;
}

.form-group label {
	display: block;
	margin-bottom: 5px;
	font-weight: 600;
	color: #333;
}

.form-group input[type="text"] {
	width: 100%;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
	font-size: 1em;
	box-sizing: border-box;
}

.form-group input[type="text"]:focus {
	outline: none;
	border-color: #007bff;
	box-shadow: 0 0 0 2px rgba(0, 123, 255, 0.25);
}

.form-buttons {
	display: flex;
	gap: 10px;
}

.btn {
	padding: 10px 16px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 1em;
	transition: background-color 0.3s ease;
	font-weight: 500;
}

.btn-primary {
	background-color: #007bff;
	color: white;
}

.btn-primary:hover {
	background-color: #0056b3;
}

.btn-secondary {
	background-color: #6c757d;
	color: white;
}

.btn-secondary:hover {
	background-color: #545b62;
}

.btn-success {
	background-color: #28a745;
	color: white;
	width: 100%;
	margin-top: 15px;
}

.btn-success:hover {
	background-color: #1e7e34;
}

.btn-success:disabled {
	background-color: #6c757d;
	cursor: not-allowed;
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
	display: flex;
	align-items: center;
}

.related-item a:hover {
	color: #003366;
}

.related-item img {
	width: 80px;
	height: 60px;
	object-fit: cover;
	margin-right: 10px;
	border-radius: 4px;
}

.comment-list {
	margin-top: 24px;
}

.comment-item {
	display: flex;
	align-items: flex-start;
	background-color: #f9f9f9;
	border-radius: 8px;
	padding: 16px;
	margin-bottom: 16px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
}

.comment-item img {
	width: 48px;
	height: 48px;
	border-radius: 50%;
	margin-right: 16px;
	object-fit: cover;
}

.comment-content {
	flex-grow: 1;
}

.comment-meta {
	font-size: 0.85em;
	color: #888;
	margin-bottom: 6px;
}

.comment-text {
	font-size: 1em;
	color: #333;
	line-height: 1.5;
}
</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
</head>
<body>
	<%@ include file="/views/header.jsp"%>
	<div class="container">
		<div class="main-content">
			<c:forEach items="${listPaper}" var="i">
				<c:if test="${i.id == paperId}">
					<h1>${i.paperName}</h1>

					<!-- Chỉ hiển thị nút lưu khi có session user -->
					<c:if test="${not empty sessionScope.user}">
						<div class="favorite-button-container">
							<div class="favorite-icon-wrapper"
								onclick="toggleFavoriteOptions(this)">
								<i class="fa-regular fa-bookmark favorite-icon"></i>
								<!-- 								 <span
									class="favorite-text">Lưu</span> -->
							</div>
							<div class="favorite-options" id="favoriteOptions-${i.id}">
								<h3>Danh sách yêu thích</h3>

								<!-- Danh sách hiện có -->
								<div class="existing-lists">
									<c:choose>
										<c:when test="${not empty favoriteLists}">
											<c:forEach items="${favoriteLists}" var="list">
												<div class="list-item"
													onclick="selectList(this, ${list.id})">
													<div class="list-info">
														<div class="list-name">${list.listName}</div>
														<c:if test="${not empty list.description}">
															<p class="list-description">${list.description}</p>
														</c:if>
													</div>
													<span class="list-count">${list.paperCount != null ? list.paperCount : 0}</span>
												</div>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<p
												style="color: #666; font-style: italic; text-align: center; margin: 10px 0;">
												Chưa có danh sách nào</p>
										</c:otherwise>
									</c:choose>
								</div>

								<!-- Nút thêm danh sách mới -->
								<div class="add-new-list" onclick="toggleNewListForm()">
									<i class="fa-solid fa-plus"></i> <span>Tạo danh sách mới</span>
								</div>

								<!-- Form tạo danh sách mới -->
								<div class="new-list-form" id="newListForm">
									<div class="form-group">
										<label for="newListName">Tên danh sách:</label> <input
											type="text" id="newListName"
											placeholder="Nhập tên danh sách..." />
									</div>
									<div class="form-group">
										<label for="newListDescription">Mô tả:</label> <input
											type="text" id="newListDescription"
											placeholder="Thêm mô tả (không bắt buộc)..." />
									</div>
									<div class="form-buttons">
										<button type="button" class="btn btn-primary"
											onclick="createNewList(${i.id})">Tạo</button>
										<button type="button" class="btn btn-secondary"
											onclick="cancelNewList()">Hủy</button>
									</div>
								</div>

								<!-- Nút lưu vào danh sách đã chọn -->
								<button type="button" class="btn btn-success" id="saveToListBtn"
									onclick="saveToSelectedList(${i.id})" disabled>Lưu vào
									danh sách</button>
							</div>
						</div>
					</c:if>

					<button onclick="speakContent()">🔊 Đọc bài báo</button>
					<button onclick="stopSpeaking()">🔇 Dừng đọc</button>
					<h4>
						<fmt:formatDate value="${i.paperDetail.createdAt}"
							pattern="dd/MM/yyyy HH:mm" />
					</h4>
					<div id="paperContent">
						<p>${i.paperDetail.paperContent}</p>
					</div>
					<h3>Bình luận</h3>
					<c:choose>
						<c:when test="${not empty sessionScope.user}">
							<form id="commentForm"
								action="${pageContext.request.contextPath}/user/comment"
								method="post" onsubmit="return submitComment(event);">
								<input type="hidden" name="paperId" value="${i.id}" />
								<div>
									<label for="comment">Nội dung:</label><br />
									<textarea id="comment" name="comment"
										placeholder="Bình luận của bạn" rows="6" required
										style="width: calc(100% - 20px); padding: 12px;"></textarea>
								</div>
								<div style="margin-top: 20px;">
									<button type="submit" style="padding: 14px 22px;">Gửi
										bình luận</button>
								</div>
							</form>
						</c:when>
						<c:otherwise>
							<p>
								Vui lòng <a
									href="${pageContext.request.contextPath}/user/login?redirect=/newsWeb/user/paperDetail?id=${paperId}">đăng
									nhập</a> để bình luận.
							</p>
						</c:otherwise>
					</c:choose>
					<div class="comment-list" id="commentList">
						<c:forEach items="${commentList}" var="c" varStatus="status">
							<c:if test="${status.index < 5}">
								<div class="comment-item">
									<img src="${c.user.avatarUrl}" alt="Avatar">
									<div class="comment-content">
										<div class="comment-meta">
											<strong>${c.user.fullname}</strong> –
											<fmt:formatDate value="${c.createdAt}" pattern="dd/MM/yyyy" />
										</div>
										<div class="comment-text">${c.content}</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</c:if>
			</c:forEach>
		</div>

		<div class="sidebar">
			<h3>Bài báo liên quan</h3>
			<c:forEach items="${relatedList}" var="related">
				<div class="related-item">
					<a href="paperDetail?id=${related.id}"> <img
						src="${not empty related.paperDetail.paperImage ? related.paperDetail.paperImage : '/newsWeb/views/Images/default-paper.png'}"
						alt="${related.paperName}" /> <span>${related.paperName}</span>
					</a>
				</div>
			</c:forEach>
		</div>

		<script>
		let selectedListId = null;
		const contextPath = '${pageContext.request.contextPath}';

		function toggleFavoriteOptions(icon) {
		    const options = icon.closest('.favorite-button-container').querySelector('.favorite-options');
		    options.classList.toggle('show');
		    icon.classList.toggle('active');
		}

		function selectList(element, listId) {
		    // Bỏ chọn tất cả các danh sách khác
		    document.querySelectorAll('.list-item').forEach(item => {
		        item.classList.remove('selected');
		    });
		    
		    // Chọn danh sách hiện tại
		    element.classList.add('selected');
		    selectedListId = listId;
		    
		    // Kích hoạt nút lưu
		    document.getElementById('saveToListBtn').disabled = false;
		}

		function toggleNewListForm() {
		    const form = document.getElementById('newListForm');
		    form.classList.toggle('show');
		    
		    if (form.classList.contains('show')) {
		        document.getElementById('newListName').focus();
		    }
		}

		function cancelNewList() {
		    const form = document.getElementById('newListForm');
		    form.classList.remove('show');
		    
		    // Clear form
		    document.getElementById('newListName').value = '';
		    document.getElementById('newListDescription').value = '';
		}

		function createNewList(paperId) {
		    const listName = document.getElementById('newListName').value.trim();
		    const description = document.getElementById('newListDescription').value.trim();
		    
		    if (!listName) {
		        alert('Vui lòng nhập tên danh sách.');
		        return;
		    }
		    
		    const formData = new URLSearchParams();
		    formData.append('listName', listName);
		    formData.append('description', description);
		    formData.append('paperId', paperId);
		    
		    fetch(`${contextPath}/user/favoriteList`, {
		        method: 'POST',
		        headers: {
		            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
		        },
		        body: formData.toString()
		    })
		    .then(response => response.json())
		    .then(data => {
		        if (data.success) {
		            alert('Tạo danh sách và lưu bài báo thành công!');
		            location.reload(); // Tải lại trang để cập nhật danh sách
		        } else {
		            alert(data.error || 'Có lỗi xảy ra khi tạo danh sách.');
		        }
		    })
		    .catch(error => {
		        console.error('Lỗi:', error);
		        alert('Có lỗi xảy ra. Vui lòng thử lại.');
		    });
		}

		function saveToSelectedList(paperId) {
		    if (!selectedListId) {
		        alert('Vui lòng chọn một danh sách.');
		        return;
		    }
		    
		    const formData = new URLSearchParams();
		    formData.append('paperId', paperId);
		    formData.append('existingListId', selectedListId);
		    
		    fetch('${pageContext.request.contextPath}/user/addToExistingList', {
		        method: 'POST',
		        headers: {
		            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
		        },
		        body: formData.toString()
		    })
		    .then(response => response.json())
		    .then(data => {
		        if (data.success) {
		            alert('Lưu bài báo vào danh sách thành công!');
		            // Đóng popup
		            document.querySelector('.favorite-options').classList.remove('show');
		            document.querySelector('.favorite-icon').classList.remove('active');
		        } else {
		            alert(data.error || 'Có lỗi xảy ra khi lưu bài báo.');
		        }
		    })
		    .catch(error => {
		        console.error('Lỗi:', error);
		        alert('Có lỗi xảy ra. Vui lòng thử lại.');
		    });
		}

		function validateComment(comment) {
		    if (!comment || comment.trim() === '') {
		        alert('Vui lòng nhập nội dung bình luận.');
		        return false;
		    }
		    return true;
		}

		function submitComment(event) {
		    event.preventDefault();

		    const comment = document.getElementById('comment').value;
		    const paperId = '${paperId}';

		    if (!validateComment(comment)) {
		        return false;
		    }

		    const formData = new URLSearchParams();
		    formData.append('comment', comment);
		    formData.append('paperId', paperId);

		    fetch('${pageContext.request.contextPath}/user/comment', {
		        method: 'POST',
		        headers: {
		            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
		        },
		        body: formData.toString()
		    })
		    .then(response => response.json())
		    .then(data => {
		        if (data.error) {
		            alert(data.error);
		        } else if (data.success) {
		            alert(data.success);
		            document.getElementById('comment').value = '';
		            window.location.href = `${pageContext.request.contextPath}/user/paperDetail?id=${paperId}`; 
		        }
		    })
		    .catch(error => {
		        console.error('Lỗi khi gửi comment:', error);
		        alert('Có lỗi xảy ra khi gửi bình luận. Vui lòng thử lại.');
		    });
		    
		    return false;
		}

		function speakContent() {
		    const content = document.getElementById("paperContent").innerText;
		    const speech = new SpeechSynthesisUtterance(content);
		    speech.lang = 'vi-VN';
		    speech.pitch = 1;
		    speech.rate = 1;
		    window.speechSynthesis.speak(speech);
		}

		function stopSpeaking() {
		    window.speechSynthesis.cancel();
		}

		// Đóng popup khi click bên ngoài
		document.addEventListener('click', function(event) {
		    const favoriteContainer = document.querySelector('.favorite-button-container');
		    if (favoriteContainer && !favoriteContainer.contains(event.target)) {
		        const options = document.querySelector('.favorite-options');
		        const icon = document.querySelector('.favorite-icon');
		        if (options && options.classList.contains('show')) {
		            options.classList.remove('show');
		            icon.classList.remove('active');
		        }
		    }
		});
		</script>
	</div>
</body>
</html>