<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="vn.iotstar.entity.User"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trang chủ - Tin tức 24h</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap')
	;

:root {
	--primary-color: #2563eb;
	--primary-dark: #1d4ed8;
	--secondary-color: #f97316;
	--accent-color: #10b981;
	--text-primary: #111827;
	--text-secondary: #6b7280;
	--text-light: #9ca3af;
	--bg-primary: #ffffff;
	--bg-secondary: #f8fafc;
	--bg-tertiary: #f1f5f9;
	--border-color: #e5e7eb;
	--shadow-sm: 0 1px 2px 0 rgb(0 0 0/ 0.05);
	--shadow-md: 0 4px 6px -1px rgb(0 0 0/ 0.1), 0 2px 4px -2px
		rgb(0 0 0/ 0.1);
	--shadow-lg: 0 10px 15px -3px rgb(0 0 0/ 0.1), 0 4px 6px -4px
		rgb(0 0 0/ 0.1);
	--shadow-xl: 0 20px 25px -5px rgb(0 0 0/ 0.1), 0 8px 10px -6px
		rgb(0 0 0/ 0.1);
	--radius-sm: 0.375rem;
	--radius-md: 0.5rem;
	--radius-lg: 0.75rem;
	--radius-xl: 1rem;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
	line-height: 1.6;
	color: var(--text-primary);
	background-color: var(--bg-secondary);
}

a {
	text-decoration: none;
	color: inherit;
}

button {
	background: none;
	border: none;
	cursor: pointer;
	font-family: inherit;
}

img {
	max-width: 100%;
	height: auto;
	display: block;
}

.container {
	max-width: 1280px;
	margin: 0 auto;
	padding: 0 1rem;
}

/* Header Styles */
.header {
	background: linear-gradient(135deg, var(--primary-color),
		var(--primary-dark));
	color: white;
	position: sticky;
	top: 0;
	z-index: 1000;
	box-shadow: var(--shadow-lg);
}

.navbar {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 1rem 0;
	height: 70px;
}

.logo {
	font-size: 1.75rem;
	font-weight: 800;
	background: linear-gradient(45deg, #fff, #e2e8f0);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	background-clip: text;
}

.navbar-links {
	display: flex;
	align-items: center;
	gap: 2rem;
}

.navbar a {
	color: rgba(255, 255, 255, 0.9);
	font-weight: 500;
	padding: 0.5rem 1rem;
	border-radius: var(--radius-md);
	transition: all 0.3s ease;
	position: relative;
	overflow: hidden;
}

.navbar a::before {
	content: '';
	position: absolute;
	top: 0;
	left: -100%;
	width: 100%;
	height: 100%;
	background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2),
		transparent);
	transition: left 0.5s ease;
}

.navbar a:hover::before {
	left: 100%;
}

.navbar a:hover {
	color: white;
	background: rgba(255, 255, 255, 0.1);
	transform: translateY(-2px);
}

.topic-tag {
	background: rgba(255, 255, 255, 0.1);
	border: 1px solid rgba(255, 255, 255, 0.2);
	border-radius: 2rem;
	padding: 0.5rem 1rem;
	display: flex;
	align-items: center;
	gap: 0.5rem;
	font-size: 0.875rem;
	backdrop-filter: blur(10px);
}

.topic-tag span {
	background: rgba(255, 255, 255, 0.2);
	padding: 0.25rem 0.75rem;
	border-radius: 1rem;
	font-size: 0.75rem;
}

.menu-icon {
	display: none;
	font-size: 1.5rem;
	cursor: pointer;
}

/* Hero Section */
.hero-section {
	background: var(--bg-primary);
	padding: 3rem 0;
	margin-bottom: 3rem;
}

.hero-grid {
	display: grid;
	grid-template-columns: 2fr 1fr;
	gap: 3rem;
	align-items: start;
}

.hero-main {
	background: var(--bg-primary);
	border-radius: var(--radius-xl);
	overflow: hidden;
	box-shadow: var(--shadow-xl);
}

.hero-image {
	position: relative;
	overflow: hidden;
	height: 400px;
}

.hero-image img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	transition: transform 0.5s ease;
}

.hero-main:hover .hero-image img {
	transform: scale(1.05);
}

.hero-overlay {
	position: absolute;
	bottom: 0;
	left: 0;
	right: 0;
	background: linear-gradient(transparent, rgba(0, 0, 0, 0.8));
	padding: 2rem;
	color: white;
}

.hero-content {
	padding: 1.5rem;
}

.hero-title {
	font-size: 1.5rem;
	font-weight: 700;
	line-height: 1.3;
	color: var(--text-primary);
	margin-bottom: 0.75rem;
	transition: color 0.3s ease;
}

.hero-main:hover .hero-title {
	color: var(--primary-color);
}

.hero-meta {
	display: flex;
	align-items: center;
	gap: 1rem;
	color: var(--text-secondary);
	font-size: 0.875rem;
}

.hero-sidebar {
	background: var(--bg-primary);
	border-radius: var(--radius-xl);
	padding: 1.5rem;
	box-shadow: var(--shadow-lg);
	height: fit-content;
}

.sidebar-title {
	font-size: 1.25rem;
	font-weight: 700;
	color: var(--text-primary);
	margin-bottom: 1.5rem;
	padding-bottom: 0.75rem;
	border-bottom: 2px solid var(--primary-color);
	position: relative;
}

.sidebar-title::after {
	content: '';
	position: absolute;
	bottom: -2px;
	left: 0;
	width: 3rem;
	height: 2px;
	background: var(--secondary-color);
}

.sidebar-item {
	display: flex;
	gap: 1rem;
	padding: 1rem 0;
	border-bottom: 1px solid var(--border-color);
	transition: all 0.3s ease;
	cursor: pointer;
	border-radius: var(--radius-md);
	margin-bottom: 0.5rem;
}

.sidebar-item:hover {
	background: var(--bg-tertiary);
	padding-left: 0.5rem;
	padding-right: 0.5rem;
}

.sidebar-item:last-child {
	border-bottom: none;
	margin-bottom: 0;
}

.sidebar-thumb {
	width: 80px;
	height: 60px;
	border-radius: var(--radius-md);
	overflow: hidden;
	flex-shrink: 0;
}

.sidebar-thumb img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	transition: transform 0.3s ease;
}

.sidebar-item:hover .sidebar-thumb img {
	transform: scale(1.1);
}

.sidebar-content {
	flex: 1;
}

.sidebar-item-title {
	font-size: 0.875rem;
	font-weight: 500;
	line-height: 1.4;
	color: var(--text-primary);
	transition: color 0.3s ease;
}

.sidebar-item:hover .sidebar-item-title {
	color: var(--primary-color);
}

/* News Grid Section */
.news-grid-section {
	padding: 3rem 0;
	background: var(--bg-primary);
	margin-bottom: 3rem;
}

.section-header {
	display: flex;
	align-items: center;
	gap: 1rem;
	margin-bottom: 2rem;
}

.section-title {
	font-size: 2rem;
	font-weight: 800;
	color: var(--text-primary);
	position: relative;
}

.section-title::after {
	content: '';
	position: absolute;
	bottom: -0.5rem;
	left: 0;
	width: 4rem;
	height: 0.25rem;
	background: linear-gradient(90deg, var(--primary-color),
		var(--secondary-color));
	border-radius: 0.125rem;
}

.news-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
	gap: 2rem;
}

.news-card {
	background: var(--bg-primary);
	border-radius: var(--radius-xl);
	overflow: hidden;
	box-shadow: var(--shadow-md);
	transition: all 0.4s ease;
	cursor: pointer;
	border: 1px solid var(--border-color);
}

.news-card:hover {
	transform: translateY(-8px);
	box-shadow: var(--shadow-xl);
	border-color: var(--primary-color);
}

.news-card-image {
	position: relative;
	height: 200px;
	overflow: hidden;
}

.news-card-image img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	transition: transform 0.4s ease;
}

.news-card:hover .news-card-image img {
	transform: scale(1.1);
}

.news-card-content {
	padding: 1.5rem;
}

.news-card-title {
	font-size: 1.125rem;
	font-weight: 600;
	line-height: 1.4;
	color: var(--text-primary);
	margin-bottom: 0.75rem;
	transition: color 0.3s ease;
}

.news-card:hover .news-card-title {
	color: var(--primary-color);
}

.news-card-meta {
	display: flex;
	align-items: center;
	gap: 1rem;
	color: var(--text-secondary);
	font-size: 0.875rem;
}

/* Category Sections */
.category-section {
	margin-bottom: 3rem;
	background: var(--bg-primary);
	border-radius: var(--radius-xl);
	padding: 2rem;
	box-shadow: var(--shadow-lg);
}

.category-header {
	display: flex;
	align-items: center;
	gap: 1rem;
	margin-bottom: 2rem;
	padding-bottom: 1rem;
	border-bottom: 2px solid var(--border-color);
}

.category-icon {
	width: 3rem;
	height: 3rem;
	background: linear-gradient(135deg, var(--primary-color),
		var(--secondary-color));
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
	font-size: 1.25rem;
}

.category-title {
	font-size: 1.75rem;
	font-weight: 700;
	color: var(--text-primary);
	background: linear-gradient(135deg, var(--primary-color),
		var(--secondary-color));
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	background-clip: text;
}

.category-list {
	display: grid;
	gap: 1rem;
}

.category-item {
	display: flex;
	gap: 1rem;
	padding: 1rem;
	border-radius: var(--radius-lg);
	transition: all 0.3s ease;
	cursor: pointer;
	border: 1px solid transparent;
}

.category-item:hover {
	background: var(--bg-tertiary);
	border-color: var(--primary-color);
	transform: translateX(0.5rem);
}

.category-item-thumb {
	width: 120px;
	height: 80px;
	border-radius: var(--radius-md);
	overflow: hidden;
	flex-shrink: 0;
}

.category-item-thumb img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	transition: transform 0.3s ease;
}

.category-item:hover .category-item-thumb img {
	transform: scale(1.1);
}

.category-item-content {
	flex: 1;
}

.category-item-title {
	font-size: 1.125rem;
	font-weight: 600;
	line-height: 1.4;
	color: var(--text-primary);
	transition: color 0.3s ease;
}

.category-item:hover .category-item-title {
	color: var(--primary-color);
}

/* Responsive Design */
@media ( max-width : 1024px) {
	.hero-grid {
		grid-template-columns: 1fr;
		gap: 2rem;
	}
	.news-grid {
		grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
		gap: 1.5rem;
	}
}

@media ( max-width : 768px) {
	.navbar-links {
		display: none;
	}
	.menu-icon {
		display: block;
	}
	.topic-tag {
		display: none;
	}
	.hero-section {
		padding: 2rem 0;
	}
	.section-title {
		font-size: 1.5rem;
	}
	.category-title {
		font-size: 1.5rem;
	}
	.category-item {
		flex-direction: column;
		text-align: center;
	}
	.category-item-thumb {
		width: 100%;
		height: 150px;
	}
}

@media ( max-width : 640px) {
	.container {
		padding: 0 0.75rem;
	}
	.hero-section, .news-grid-section {
		padding: 1.5rem 0;
	}
	.category-section {
		padding: 1.5rem;
		margin-bottom: 2rem;
	}
	.news-grid {
		grid-template-columns: 1fr;
	}
}

/* Footer Styles */
.footer {
	background: linear-gradient(135deg, #1f2937, #111827);
	color: white;
	padding: 3rem 0 1rem;
	margin-top: 4rem;
}

.footer-content {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
	gap: 2rem;
	margin-bottom: 2rem;
}

.footer-section h3 {
	font-size: 1.25rem;
	font-weight: 700;
	margin-bottom: 1rem;
	color: white;
}

.footer-section p, .footer-section a {
	color: rgba(255, 255, 255, 0.8);
	text-decoration: none;
	line-height: 1.6;
	transition: color 0.3s ease;
}

.footer-section a:hover {
	color: var(--primary-color);
}

.footer-section ul {
	list-style: none;
	padding: 0;
}

.footer-section li {
	margin-bottom: 0.5rem;
}

.footer-bottom {
	border-top: 1px solid rgba(255, 255, 255, 0.1);
	padding-top: 2rem;
	text-align: center;
	color: rgba(255, 255, 255, 0.6);
}

.social-links {
	display: flex;
	justify-content: center;
	gap: 1rem;
	margin-bottom: 1rem;
}

.social-links a {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	width: 2.5rem;
	height: 2.5rem;
	background: rgba(255, 255, 255, 0.1);
	border-radius: 50%;
	color: rgba(255, 255, 255, 0.8);
	transition: all 0.3s ease;
}

.social-links a:hover {
	background: var(--primary-color);
	color: white;
	transform: translateY(-2px);
}

/* Animation Classes */
@
keyframes fadeInUp {from { opacity:0;
	transform: translateY(2rem);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
.fade-in-up {
	animation: fadeInUp 0.6s ease forwards;
}

/* Loading States */
.skeleton {
	background: linear-gradient(90deg, #f0f0f0 25%, #e0e0e0 50%, #f0f0f0 75%);
	background-size: 200% 100%;
	animation: loading 1.5s infinite;
}

@
keyframes loading { 0% {
	background-position: 200% 0;
}
100






%
{
background-position






:






-200




%
0




;
}
}
</style>
</head>
<body>
	<%@ include file="/views/header.jsp"%>

	<!-- Hero Section -->
	<section class="hero-section">
		<div class="container">
			<div class="hero-grid">
				<div class="hero-main">
					<c:forEach var="paper" items="${TodayPapers}" varStatus="loop">
						<c:if test="${loop.first}">
							<form
								action="${pageContext.request.contextPath}/user/paperDetail"
								method="get">
								<input type="hidden" name="id" value="${paper.id}" />
								<button type="submit" style="width: 100%; text-align: left;">
									<div class="hero-image">
										<img src="${paper.paperDetail.paperImage}"
											alt="${paper.paperName}" />
										<div class="hero-overlay">
											<span class="hero-meta"> <i class="fas fa-clock"></i>
												Tin mới nhất
											</span>
										</div>
									</div>
									<div class="hero-content">
										<h1 class="hero-title">${paper.paperName}</h1>
										<div class="hero-meta">
											<span><i class="fas fa-bolt"
												style="margin-right: 8px;"></i>Mới nhất</span>
										</div>
									</div>
								</button>
							</form>
						</c:if>
					</c:forEach>
				</div>

				<div class="hero-sidebar">
					<h3 class="sidebar-title">
						<i class="fas fa-fire"></i> Tin tức nổi bật
					</h3>
					<c:forEach var="p" items="${paperList}" begin="0" end="4">
						<div class="sidebar-item">
							<form
								action="${pageContext.request.contextPath}/user/paperDetail"
								method="get" style="width: 100%;">
								<input type="hidden" name="id" value="${p.id}" />
								<button type="submit"
									style="width: 100%; display: flex; gap: 1rem; align-items: center;">
									<div class="sidebar-thumb">
										<img src="${p.paperDetail.paperImage}" alt="${p.paperName}" />
									</div>
									<div class="sidebar-content">
										<div class="sidebar-item-title">${p.paperName}</div>
									</div>
								</button>
							</form>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>

	<!-- Latest News Grid -->
	<section class="news-grid-section">
		<div class="container">
			<div class="section-header">
				<h2 class="section-title">Tin tức khác</h2>
				<div style="flex: 1; height: 1px; background: var(--border-color);"></div>
			</div>

			<div class="news-grid">
				<c:forEach var="paper" items="${TodayPapers}" varStatus="loop">
					<c:if test="${loop.index > 0 && loop.index < 7}">
						<div class="news-card fade-in-up">
							<form
								action="${pageContext.request.contextPath}/user/paperDetail"
								method="get">
								<input type="hidden" name="id" value="${paper.id}" />
								<button type="submit" style="width: 100%; text-align: left;">
									<div class="news-card-image">
										<img src="${paper.paperDetail.paperImage}"
											alt="${paper.paperName}" />
									</div>
									<div class="news-card-content">
										<h3 class="news-card-title">${paper.paperName}</h3>
										<div class="news-card-meta">
											<span><i class="fas fa-calendar-alt"></i> Hôm nay</span> <span><i
												class="fas fa-user"></i> Tác giả</span>
										</div>
									</div>
								</button>
							</form>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</section>

	<!-- Vietnam Discovery Category -->
	<section class="category-section">
		<div class="container">
			<div class="category-header">
				<div class="category-icon">
					<i class="fas fa-map-marked-alt"></i>
				</div>
				<h2 class="category-title">Khám phá Việt Nam</h2>
			</div>

			<div class="category-list">
				<c:forEach var="p" items="${paperList}">
					<c:if test="${p.paperType.paperTypeName == 'Khám phá Việt Nam'}">
						<div class="category-item">
							<form
								action="${pageContext.request.contextPath}/user/paperDetail"
								method="get" style="width: 100%;">
								<input type="hidden" name="id" value="${p.id}" />
								<button type="submit"
									style="width: 100%; display: flex; gap: 1rem; align-items: center;">
									<div class="category-item-thumb">
										<img src="${p.paperDetail.paperImage}" alt="${p.paperName}" />
									</div>
									<div class="category-item-content">
										<h3 class="category-item-title">${p.paperName}</h3>
									</div>
								</button>
							</form>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</section>

	<!-- World Discovery Category -->
	<section class="category-section">
		<div class="container">
			<div class="category-header">
				<div class="category-icon">
					<i class="fas fa-globe-americas"></i>
				</div>
				<h2 class="category-title">Khám phá Thế giới</h2>
			</div>

			<div class="category-list">
				<c:forEach var="p" items="${paperList}">
					<c:if test="${p.paperType.paperTypeName == 'Khám phá thế giới'}">
						<div class="category-item">
							<form
								action="${pageContext.request.contextPath}/user/paperDetail"
								method="get" style="width: 100%;">
								<input type="hidden" name="id" value="${p.id}" />
								<button type="submit"
									style="width: 100%; display: flex; gap: 1rem; align-items: center;">
									<div class="category-item-thumb">
										<img src="${p.paperDetail.paperImage}" alt="${p.paperName}" />
									</div>
									<div class="category-item-content">
										<h3 class="category-item-title">${p.paperName}</h3>
									</div>
								</button>
							</form>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</section>

	<%@ include file="/views/footer.jsp"%>
</body>
</html>