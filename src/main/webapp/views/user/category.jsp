<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Giao diện Bài báo</title>
<style>
body {
	margin: 20px;
	background-color: #f5f5f5; /* Màu background của web */
}

.container {
	display: flex;
	flex-wrap: wrap;
	gap: 15px;
	max-width: 980px;
	margin: 0 auto;
	padding: 10px;
}

.card {
	background-color: #f5f5f5; /* Màu thẻ giống background */
	border: none; /* Loại bỏ viền thẻ */
	border-radius: 0;
	padding: 10px;
	width: calc(50% - 15px);
	box-sizing: border-box;
	transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
	position: relative;
	cursor: pointer; /* Thêm con trỏ chuột khi hover vào thẻ */
}

.card:hover {
	transform: translateY(-5px);
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
	/* background-color: #e0e0e0; Loại bỏ thay đổi màu nền khi hover */
}

.card-header {
	color: #007bff;
	margin-top: 0;
	margin-bottom: 8px;
	font-size: 1em;
}

.article-row {
	display: flex;
	gap: 10px;
	margin-bottom: 8px;
	border-bottom: 1px solid #ddd;
	padding-bottom: 8px;
}

.article-row:last-child {
	border-bottom: none;
	margin-bottom: 0;
	padding-bottom: 0;
}

.article {
	display: flex;
	flex-direction: column;
	flex: 1;
	cursor: pointer; /* Thêm con trỏ chuột khi hover vào bài báo */
}

.article img {
	max-width: 100%;
	height: auto;
	border-radius: 0;
	margin-bottom: 5px;
	transition: transform 0.2s ease-in-out;
	/* Hiệu ứng nhỏ cho ảnh khi hover */
}

.article img:hover {
	transform: scale(1.05);
}

.article h4 {
	font-size: 0.85em;
	margin-top: 0;
	margin-bottom: 3px;
	color: #333;
	line-height: 1.2;
	transition: color 0.2s ease-in-out; /* Hiệu ứng màu cho tiêu đề */
}

.article h4:hover {
	color: #007bff; /* Màu xanh khi hover vào tiêu đề */
}

.article p {
	font-size: 0.75em;
	color: #777;
	margin-bottom: 0;
}

.fullscreen-button {
	position: absolute;
	top: 10px;
	right: 10px;
	background: none;
	border: none;
	cursor: pointer;
	font-size: 1.2em;
	color: #555;
	opacity: 0.7;
	transition: opacity 0.2s ease-in-out;
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
	background-color: #fff; /* Màu nền phóng to trắng sáng */
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
}

.fullscreen-card .article h4 {
	font-size: 1em;
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

/* Điều chỉnh cho màn hình nhỏ hơn */
@media ( max-width : 768px) {
	.card {
		width: 100%;
	}
	.article-row {
		flex-direction: column;
	}
}
</style>
</head>
<body>

	<c:forEach items="${groupedByTypeId}" var="entry">
		<c:set var="typeId" value="${entry.key}" />
		<c:set var="papers" value="${entry.value}" />
		<c:set var="typeName" value="${typeNames[typeId]}" />

		<div class="container">
			<div class="card" onclick="handleCardClick(this)">
				<button class="fullscreen-button" onclick="toggleFullscreen(this)">&#x26F6;</button>
				<h3 class="card-header">${typeName}</h3>

				<div class="article-row">
					<c:forEach items="${papers}" var="paper">
						<div class="article"
							onclick="handleArticleClick('paper/detail?id=${paper.id}')">
							<img src="${paper.paperDetail.paperImage}"
								alt="${paper.paperName}"
								style="width: 100%; height: auto; max-height: 450px; object-fit: cover; margin-bottom: 10px; border-radius: 8px;" />
							<h4>${paper.paperName}</h4>
							<p>${paper.paperDetail.createdAt}</p>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</c:forEach>

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
			const card = button.parentNode.cloneNode(true);
			const container = document.querySelector('.container');

			if (!fullscreenCard) {
				fullscreenCard = document.createElement('div');
				fullscreenCard.classList.add('fullscreen-card');

				const closeButton = document.createElement('button');
				closeButton.classList.add('fullscreen-button');
				closeButton.innerHTML = '&#x2715;';
				closeButton.onclick = closeFullscreen;
				fullscreenCard.appendChild(closeButton);

				fullscreenCard.appendChild(card.querySelector('h3'));
				const articleRows = card.querySelectorAll('.article-row');
				articleRows.forEach(row => fullscreenCard.appendChild(row.cloneNode(true)));

				document.body.appendChild(fullscreenCard);
				overlay.style.display = 'block';
				document.body.style.overflow = 'hidden';
			} else {
				closeFullscreen();
			}
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