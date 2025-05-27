<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Giao diện Bài báo</title>
<style>
body {
	margin: 15px;
	background-color: #f5f5f5;
}

.container {
	display: flex;
	flex-wrap: wrap;
	gap: 12px;
	width: 100%;
	max-width: 1200px; /* Thu nhỏ chiều rộng tối đa */
	margin: 0 auto;
	padding: 0 20px; /* Thu nhỏ padding 2 bên */
}

.card {
	background-color: #f5f5f5;
	border: none;
	border-radius: 0;
	padding: 8px;
	flex: 1 1 calc(50% - 6px); /* 2 card mỗi hàng với gap 12px */
	min-width: 280px;
	box-sizing: border-box;
	transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
	position: relative;
	cursor: pointer;
}

.card:hover {
	transform: translateY(-5px);
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
}

.card-header {
	color: #007bff;
	margin-top: 0;
	margin-bottom: 6px;
	font-size: 0.9em;
}

.article-row {
	display: flex;
	gap: 8px;
	margin-bottom: 6px;
	border-bottom: 1px solid #ddd;
	padding-bottom: 6px;
	flex-wrap: wrap;
}

.article-row:last-child {
	border-bottom: none;
	margin-bottom: 0;
	padding-bottom: 0;
}

.article {
	display: flex;
	flex-direction: column;
	flex: 1 1 45%;
	cursor: pointer;
	margin-bottom: 8px;
}

.article img {
	width: 100%; /* Chiều rộng cố định */
	height: 120px; /* Chiều cao cố định để tất cả ảnh bằng nhau */
	object-fit: cover; /* Cắt ảnh để vừa khung mà không bị méo */
	border-radius: 0;
	margin-bottom: 4px;
	transition: transform 0.2s ease-in-out;
}

.article img:hover {
	transform: scale(1.05);
}

.article h4 {
	font-size: 0.8em;
	margin-top: 0;
	margin-bottom: 2px;
	color: #333;
	line-height: 1.2;
	transition: color 0.2s ease-in-out;
	min-height: 2.4em; /* Đảm bảo tiêu đề có chiều cao tối thiểu */
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
}

.article h4:hover {
	color: #007bff;
}

.article p {
	font-size: 0.7em;
	color: #777;
	margin-bottom: 0;
}

.fullscreen-button {
	position: absolute;
	top: 8px;
	right: 8px;
	background: none;
	border: none;
	cursor: pointer;
	font-size: 1.1em;
	color: #555;
	opacity: 0.7;
	transition: opacity 0.2s ease-in-out;
	z-index: 10;
}

.fullscreen-button:hover {
	opacity: 1;
	color: #007bff;
}

.fullscreen-card {
	position: fixed;
	top: 20px;
	left: 20px;
	right: 20px;
	bottom: 20px;
	background-color: #fff;
	border: 1px solid #ddd;
	border-radius: 0;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
	z-index: 1000;
	overflow: auto;
	padding: 20px;
	display: flex;
	flex-direction: column;
}

.fullscreen-card .fullscreen-button {
	top: 15px;
	right: 15px;
	font-size: 1.5em;
	color: #333;
}

.fullscreen-card .card-header {
	font-size: 1.5em;
	margin-bottom: 15px;
}

.fullscreen-card .article-row {
	margin-bottom: 15px;
	padding-bottom: 15px;
	flex-wrap: wrap;
}

.fullscreen-card .article {
	flex: 1 1 45%;
}

.fullscreen-card .article img {
	height: 200px; /* Ảnh lớn hơn trong fullscreen */
}

.fullscreen-card .article h4 {
	font-size: 1em;
	min-height: auto;
	-webkit-line-clamp: unset;
}

.fullscreen-card .article p {
	font-size: 0.9em;
}

.overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 999;
	display: none;
}

/* Responsive cho tablet */
@media ( max-width : 1024px) and (min-width: 769px) {
	.container {
		padding: 0 15px;
	}
	.card {
		flex: 1 1 calc(50% - 6px);
		min-width: 0;
	}
}

/* Responsive cho mobile */
@media ( max-width : 768px) {
	.container {
		padding: 0 10px;
	}
	.card {
		flex: 1 1 100%; /* Mobile thì 1 card mỗi hàng */
		min-width: 0;
	}
	.article-row {
		flex-direction: column;
	}
	.article {
		flex: 1 1 100%;
	}
	.article img {
		height: 150px; /* Ảnh nhỏ hơn trên mobile */
	}
}
</style>
</head>
<body>
	<%@ include file="/views/header.jsp"%>

	<div class="container">
		<c:forEach items="${typeNames.entrySet()}" var="typeEntry">
			<c:set var="typeId" value="${typeEntry.key}" />
			<c:set var="typeName" value="${typeEntry.value}" />
			<c:set var="papers" value="${groupedByTypeId[typeId]}" />

			<%-- Đếm số bài báo có status != 0 --%>
			<c:set var="validPaperCount" value="0" />
			<c:if test="${not empty papers}">
				<c:forEach items="${papers}" var="paper">
					<c:if test="${paper.status != 0}">
						<c:set var="validPaperCount" value="${validPaperCount + 1}" />
					</c:if>
				</c:forEach>
			</c:if>

			<%-- Chỉ hiển thị card nếu có bài báo hợp lệ --%>
			<c:if test="${validPaperCount > 0}">
				<div class="card" onclick="handleCardClick(this)">
					<button class="fullscreen-button"
						onclick="event.stopPropagation(); toggleFullscreen(this)">&#x26F6;</button>
					<h3 class="card-header">${typeName}</h3>
					<div class="article-row">
						<c:forEach items="${papers}" var="paper">
							<c:if test="${paper.status != 0}">
								<div class="article"
									onclick="handleArticleClick('${pageContext.request.contextPath}/user/paperDetail?id=${paper.id}')">
									<img src="${paper.paperDetail.paperImage}"
										alt="${paper.paperName}" />
									<h4>${paper.paperName}</h4>
									<p>${paper.paperDetail.createdAt}</p>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</c:if>
		</c:forEach>
	</div>

	<div id="fullscreenOverlay" class="overlay"></div>

	<script>
let fullscreenCard = null;
const overlay = document.getElementById('fullscreenOverlay');

function handleCardClick(card) {
    console.log('Đã bấm vào thẻ:', card.querySelector('h3').textContent);
}

function handleArticleClick(link) {
    console.log('Đã bấm vào bài báo:', link);
    window.location.href = link;
}

function toggleFullscreen(button) {
    if (fullscreenCard) {
        closeFullscreen();
        return;
    }
    
    const originalCard = button.parentNode;
    fullscreenCard = document.createElement('div');
    fullscreenCard.classList.add('fullscreen-card');

    // Close button
    const closeButton = document.createElement('button');
    closeButton.classList.add('fullscreen-button');
    closeButton.innerHTML = '&#x2715;';
    closeButton.onclick = closeFullscreen;
    fullscreenCard.appendChild(closeButton);

    // Clone header
    const header = originalCard.querySelector('h3').cloneNode(true);
    fullscreenCard.appendChild(header);

    // Clone article rows
    const articleRows = originalCard.querySelectorAll('.article-row');
    articleRows.forEach(row => {
        fullscreenCard.appendChild(row.cloneNode(true));
    });

    document.body.appendChild(fullscreenCard);
    overlay.style.display = 'block';
    document.body.style.overflow = 'hidden';
}

function closeFullscreen() {
    if (fullscreenCard) {
        fullscreenCard.remove();
        fullscreenCard = null;
        overlay.style.display = 'none';
        document.body.style.overflow = 'auto';
    }
}

overlay.addEventListener('click', closeFullscreen);
</script>

</body>
</html>