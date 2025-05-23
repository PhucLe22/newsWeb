<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="vn.iotstar.entity.User"%>

<div class="header">
	<div class="container">
		<div class="inner-wrap">
			<button class="inner-menu-mobile">
				<i class="fa-solid fa-bars"></i>
			</button>

			<div class="inner-logo">
				<a href="${pageContext.request.contextPath}/"> <img
					src="https://play-lh.googleusercontent.com/P8D-vfnCmeaP3b3pbS_JmWlDkGGYaPg1xE4rOXMWPiTsL8fKlpsTxgVOkWj7w1ryx0pC"
					alt="Logo">
				</a>
			</div>

			<div class="navbar">
				<a href="${pageContext.request.contextPath}/user/category">CHỦ
					ĐỀ</a>
			</div>
			<form action="${pageContext.request.contextPath}/user/search"
				method="get" class="inner-form">
				<div class="inner-search">
					<input type="text" name="keyword"
						placeholder="Nhập nội dung tìm kiếm" class="inner-input">
				</div>
				<button type="submit" class="inner-button">
					<i class="fa-solid fa-magnifying-glass"></i> Tìm kiếm
				</button>
			</form>

			<div class="inner-avatar-wrapper">
				<%
				User currentUser = (User) session.getAttribute("user");
				%>
				<div class="inner-avatar-wrapper"
					style="display: flex; align-items: center; gap: 10px;">
					<div class="inner-avatar">
						<img
							src="<%=(currentUser != null) ? currentUser.getAvatarUrl() : "https://via.placeholder.com/30"%>"
							alt="Avatar"
							style="width: 30px; height: 30px; border-radius: 50%;">
					</div>

					<%
					if (currentUser == null) {
					%>
					<form action="${pageContext.request.contextPath}/user/login"
						method="get" style="margin: 0;">
						<button type="submit" class="auth-btn">Đăng nhập</button>
					</form>
					<form action="${pageContext.request.contextPath}/register"
						method="get" style="margin: 0;">
						<button type="submit" class="auth-btn">Đăng ký</button>
					</form>
					<%
					} else {
					%>
					<form action="${pageContext.request.contextPath}/user/login"
						method="get" style="margin: 0;">
						<button type="submit"
							style="background-color: #f5f5dc; color: #dc3545; border: 2px solid #dc3545; border-radius: 12px; padding: 10px 20px; font-weight: bold; cursor: pointer; transition: background-color 0.3s ease, color 0.3s ease, box-shadow 0.3s ease;"
							onmouseover="this.style.backgroundColor='#dc3545'; this.style.color='#f5f5dc'; this.style.boxShadow='0 4px 8px rgba(220,53,69,0.4)';"
							onmouseout="this.style.backgroundColor='#f5f5dc'; this.style.color='#dc3545'; this.style.boxShadow='none';">
							Đăng xuất</button>
					</form>
					<%
					}
					%>
				</div>

			</div>
		</div>
	</div>
</div>