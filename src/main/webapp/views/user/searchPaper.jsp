<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>

<%
Date now = new Date();
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Kết quả tìm kiếm</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f2f2f2;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 1200px;
	margin: 40px auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 12px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
	display: grid;
	grid-template-columns: 2fr 1fr;
	gap: 30px;
}

.main-content {
	display: flex;
	flex-direction: column;
	gap: 24px;
}

.paper-card {
	display: flex;
	border: 1px solid #e0e0e0;
	border-radius: 8px;
	overflow: hidden;
	background-color: #fafafa;
	transition: box-shadow 0.2s;
}

.paper-card:hover {
	box-shadow: 0 3px 10px rgba(0, 0, 0, 0.08);
}

.paper-card form {
	display: flex;
	width: 100%;
	text-align: left;
}

.paper-image-container {
	width: 250px;
	height: 180px;
	overflow: hidden;
	flex-shrink: 0;
}

.paper-image {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.paper-details {
	padding: 16px;
	display: flex;
	flex-direction: column;
	justify-content: center;
}

.paper-title {
	font-size: 1.2em;
	margin: 0 0 8px;
	color: #333;
	font-weight: 600;
}

.paper-date {
	font-size: 0.9em;
	color: #888;
}

.sidebar {
	background-color: #fdfdfd;
	padding: 20px;
	border-radius: 8px;
	border: 1px solid #e5e5e5;
}

.sidebar-title {
	font-size: 1.2em;
	margin-bottom: 16px;
	font-weight: bold;
	color: #444;
	border-bottom: 2px solid #ccc;
	padding-bottom: 6px;
}

.sidebar-news-item {
	margin-bottom: 20px;
}

.sidebar-news-item form {
	width: 100%;
}

.sidebar-news-item img {
	width: 100%;
	height: 150px;
	object-fit: cover;
	border-radius: 6px;
}

.news-title {
	font-size: 0.95em;
	font-weight: bold;
	color: #333;
	margin: 8px 0 4px;
}

.news-date {
	font-size: 0.85em;
	color: #777;
}

@media ( max-width : 768px) {
	.container {
		grid-template-columns: 1fr;
		padding: 16px;
	}
}
</style>
</head>
<body>
	<%@ include file="/views/header.jsp" %>
	<div class="container">
		<div class="main-content">
			<c:forEach var="paper" items="${PaperList}">
				<div class="paper-card">
					<form
						action="${pageContext.request.contextPath}/user/paperDetail"
						method="get">
						<input type="hidden" name="id" value="${paper.id}" />
						<div class="paper-image-container">
							<img class="paper-image"
								src="${not empty paper.paperDetail.paperImage ? paper.paperDetail.paperImage : '/newsWeb/views/Images/default-paper.png'}"
								alt="${paper.paperName}">
						</div>
						<div class="paper-details">
							<div class="paper-title">${paper.paperName}</div>
							<div class="paper-date">${paper.paperDetail.createdAt}</div>
						</div>
					</form>
				</div>
			</c:forEach>
		</div>

		<div class="sidebar">
			<div class="sidebar-title">Tin tức 24h</div>
			<c:forEach var="paper" items="${TodayPapers}">
				<div class="sidebar-news-item">
					<form
						action="${pageContext.request.contextPath}/user/paperDetail"
						method="get">
						<input type="hidden" name="id" value="${paper.id}" />
						<button type="submit"
							style="all: unset; cursor: pointer; display: block; width: 100%;">
							<img
								src="${not empty paper.paperDetail.paperImage ? paper.paperDetail.paperImage : '/newsWeb/views/Images/default-paper.png'}"
								alt="${paper.paperName}" />
							<div class="news-title">${paper.paperName}</div>
							<div class="news-date">${paper.paperDetail.createdAt}</div>
						</button>
					</form>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>
