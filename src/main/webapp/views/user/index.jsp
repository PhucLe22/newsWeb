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
<title>Trang chủ</title>
<%-- <link rel="stylesheet" href="/newsWeb/views/Css/index.css"> --%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
<style>
@charset "UTF-8";

@import
	url('https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100..900;1,100..900&display=swap')
	;

:root {
	--color-primary: #679E98;
}

* {
	box-sizing: border-box;
	font-family: "Be Vietnam Pro", sans-serif;
}

body {
	margin: 0;
	background-color: #FFFFFF;
}

a {
	text-decoration: none;
}

input {
	outline: none;
}

/* Container */
.container {
	width: 1100px; /* Slightly reduced width for better balance */
	margin-left: auto;
	margin-right: auto;
}

@media ( max-width : 1199.98px) {
	.container {
		width: 960px;
	}
}

@media ( max-width : 991.98px) {
	.container {
		width: 720px;
	}
}

@media ( max-width : 767.98px) {
	.container {
		width: 540px;
	}
}

@media ( max-width : 575.98px) {
	.container {
		width: 100%;
		padding: 0 16px;
	}
}

/* Header - This is the navigation header */
.header {
	padding: 12px 0;
	background-color: #34a6b7; /* Full width blue background */
	top: 0;
	left: 0;
	width: 100%;
	position: sticky;
	z-index: 1000; /* Ensure header stays on top */
}

.header .inner-wrap {
	display: flex;
	justify-content: space-between;
	align-items: center;
	gap: 20px; /* Slightly reduced gap between elements */
}

.header .inner-logo {
	order: -2; /* Moves the logo to the far left */
}

.header .inner-logo img {
	height: 50px;
	width: auto;
}

.topic-tag {
	border: 1px solid #fff;
	border-radius: 20px;
	padding: 2px 10px;
	display: inline-flex;
	gap: 8px;
	font-size: 13px;
	white-space: nowrap;
	color: white;
}

.topic-tag span {
	border: 1px solid white;
	padding: 2px 8px;
	border-radius: 15px;
	white-space: nowrap;
}

.header .inner-form {
	display: flex;
	gap: 5px;
	padding: 0;
	/* Move the search form to the left */
	order: -1;
	/* Negative order to push it to the start of the flex container */
	margin-right: auto;
	/* Pushes other elements to the right, balancing the layout */
}

.header .inner-form .inner-search .inner-input {
	border-radius: 18px;
	height: 30px;
	width: 180px;
	border: 1px solid #A1A1A1;
	padding: 5px;
	background-color: white;
}

.header .inner-form .inner-button {
	background: var(--color-primary);
	border-radius: 18px;
	gap: 5px;
	display: flex;
	border: 1px solid #A1A1A1;
	align-items: center;
	justify-content: center;
	font-weight: 500;
	font-size: 14px;
	color: #FFFFFF;
	cursor: pointer;
	padding: 0 10px;
}

.header .inner-form .inner-button i {
	font-size: 16px;
}

.header .inner-form .inner-button:hover {
	opacity: 0.9;
}

.header .inner-menu-mobile {
	display: none;
	color: white;
	font-size: 24px;
	background: transparent;
	border: none;
	cursor: pointer;
}

/* Navbar specific styles (NÓNG, MỚI, etc.) */
.navbar {
	display: flex;
	align-items: center;
	padding: 0 10px;
	height: 40px;
}

/* Các link NÓNG, MỚI, VIDEO, CHỦ ĐỀ */
.navbar a {
	color: white;
	text-decoration: none;
	padding: 0 15px;
	line-height: 40px;
	font-weight: bold;
	border-left: 1px solid #ffffff40;
	white-space: nowrap;
}

.navbar a:first-child {
	border-left: none;
}

/* Avatar icon styling */
.header .inner-avatar {
	width: 30px;
	height: 30px;
	border-radius: 50%; /* Makes the avatar circular */
	overflow: hidden;
	/* Ensures the image stays within the circular shape */
	border: 1px solid white; /* Optional border around the avatar */
	flex-shrink: 0;
	/* Prevents the avatar from shrinking on smaller screens */
}

.header .inner-avatar img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	/* Ensures the image covers the entire area without distortion */
	display: block;
}

@media ( max-width : 1199.98px) {
	.navbar a {
		padding: 0 10px;
		font-size: 14px;
	}
	.topic-tag {
		font-size: 12px;
		gap: 6px;
		margin-left: 8px;
	}
}

@media ( max-width : 991.98px) {
	/* Hide main navigation and avatar on smaller screens */
	.navbar a, .navbar .topic-tag, .navbar .menu-icon, .header .inner-avatar
		{
		display: none;
	}
	/* Show the mobile hamburger menu */
	.header .inner-menu-mobile {
		display: inline-block;
	}
	/* Adjust search form for smaller screens */
	.header .inner-form {
		flex-grow: 1; /* Allow search to take more space */
		justify-content: flex-start;
		/* Align to the left on smaller screens */
		margin-right: 0; /* Reset right margin */
	}
	/* Adjust container width for smaller screens */
	.header .container {
		width: 720px; /* Match the general container media query */
	}
}

@media ( max-width : 374.98px) {
	.header .inner-wrap {
		gap: 5px;
	}
	.header .inner-logo img {
		height: 40px;
	}
	.header .inner-form .inner-search .inner-input {
		width: 120px; /* Smaller search input */
	}
}
/* End Header */

/* Section 1 */
.section-1 {
	margin-top: 20px; /* Add some space below the sticky header */
}

.section-1 .inner-wrap {
	display: grid;
	grid-template-columns: 628fr 327fr;
	/* Defines two columns for the main content area */
	gap: 20px; /* Space between the two columns */
	padding: 10px;
	background-color: #FFFFFF;
}

/* inner-left */
.inner-left .box-new {
	display: grid;
	grid-template-columns: 1fr; /* Single column for the main news item */
	gap: 20px;
	padding-bottom: 10px;
	border-bottom: 1px solid #EEEEEE; /* Separator line */
}

.inner-left .box-new .inner-item-1 {
	width: 100%;
	overflow: hidden;
	border-bottom: 1px solid #EEEEEE;
	/* Separator line for the main item */
}

.inner-left .box-new .inner-item-1 .inner-image {
	/* This class is not directly used in the HTML for inner-item-1's image,
	   but defines a desired aspect ratio if an image container were used. */
	width: 100%;
	aspect-ratio: 790/397;
}

/* General styling for images within .box-new items */
.inner-left .box-new .inner-item img {
	/* Targets images directly within .inner-item */
	width: 100%;
	height: auto; /* Maintain aspect ratio */
	object-fit: cover;
	border-radius: 10px;
	transition: transform 0.3s ease; /* Smooth hover effect */
}

.box-new .inner-item button:hover .inner-title p {
	/* Changes text color on hover */
	color: var(--color-primary);
}

.box-new .inner-item button:hover img {
	/* Scales image slightly on hover */
	transform: scale(1.05);
	transition: transform 0.3s ease;
}

/* End inner-left */

/* inner-right (sidebar for Section 1) */
.inner-right .box-right {
	padding: 10px;
}

.inner-right .box-right .inner-item {
	display: flex;
	align-items: center;
	gap: 12px;
	border-bottom: 1px solid #EEEEEE;
	padding-bottom: 10px;
	margin-bottom: 10px;
}

.inner-right .box-right .inner-item:last-child {
	border-bottom: none; /* Remove border for the last item */
	margin-bottom: 0;
}

/* Styling for the thumbnail image within inner-right items */
.inner-right .box-right .inner-item .thumb {
	/* Targets the .thumb div */
	width: 100px; /* Fixed width for thumbnail */
	height: 70px; /* Fixed height for thumbnail */
	flex-shrink: 0; /* Prevents thumbnail from shrinking */
	overflow: hidden;
	border-radius: 4px;
}

.inner-right .box-right .inner-item .thumb img {
	/* Targets the image inside .thumb */
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.inner-right .box-right .inner-item .title {
	flex: 1; /* Allows the title to take remaining space */
}

.inner-right .box-right .inner-item button:hover .title span {
	color: var(--color-primary);
}

@media ( max-width : 1199.98px) {
	.section-1 .inner-wrap {
		grid-template-columns: 1fr;
		/* Stack left and right columns on smaller screens */
	}
	.inner-right .box-right {
		margin-top: 20px; /* Add space if stacked */
	}
}

@media ( max-width : 991.98px) {
	.inner-right .box-right {
		display: none;
		/* Hide the right sidebar on tablet and smaller screens */
	}
}

/* End inner-right */
/* End Section 1 */

/* section-2 */
.section-2 .inner-wrap {
	display: grid;
	grid-template-columns: 628fr 327fr;
	/* Two columns for main content and sidebar */
	gap: 20px;
	padding: 10px;
	margin-top: 20px;
	margin-bottom: 20px;
}

.section-2 .inner-left .inner-box {
	border-bottom: 1px solid #EEEEEE;
	padding-bottom: 10px;
}

/* Styles for items within .inner-list of section-2 */
.section-2 .inner-left .inner-list {
	display: flex;
	flex-wrap: wrap; /* Allows items to wrap to the next line */
	gap: 20px; /* Space between items */
}

.section-2 .inner-left .inner-list .inner-item {
	width: calc(33.333% - 14px);
	/* Creates 3 columns with appropriate spacing */
	margin-bottom: 10px;
}

.section-2 .inner-left .inner-list .inner-item .thumb {
	width: 100%;
	height: 120px;
	overflow: hidden;
	border-radius: 6px;
}

.section-2 .inner-left .inner-list .inner-item .thumb img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	transition: transform 0.3s ease;
}

.section-2 .inner-left .inner-list .inner-item button:hover .thumb img {
	transform: scale(1.05);
}

.section-2 .inner-left .inner-list .inner-item .title {
	margin-top: 8px;
	width: 100%;
}

.section-2 .inner-left .inner-list .inner-item button:hover .title span
	{
	color: var(--color-primary);
}

/* Right sidebar for Section 2 (banner) */
.inner-right-2 {
	margin-left: 0; /* Reset margin, as gap on parent handles spacing */
	background-color: #F7F7F7;
	border-radius: 8px;
	padding: 15px;
}

.inner-right-2 .box-right-2 .inner-item {
	display: flex;
	align-items: center;
}

.inner-right-2 .box-right-2 .inner-item .inner-image {
	width: 100%;
	overflow: hidden;
	border-radius: 8px;
}

.inner-right-2 .box-right-2 .inner-item .inner-image img {
	width: 100%;
	height: auto;
	object-fit: cover;
	display: block;
}

@media ( max-width : 1199.98px) {
	.section-2 .inner-wrap {
		grid-template-columns: 1fr; /* Stack left and right columns */
	}
	.inner-right-2 {
		margin-left: 0;
		margin-top: 20px; /* Add space when stacked */
	}
}

@media ( max-width : 991.98px) {
	.inner-right-2 {
		display: none;
		/* Hide the right sidebar on tablet and smaller screens */
	}
	.section-2 .inner-left .inner-list {
		justify-content: center; /* Center items when right column is gone */
	}
	.section-2 .inner-left .inner-list .inner-item {
		width: calc(50% - 10px); /* Adjust to 2 columns on tablet */
	}
}

@media ( max-width : 767.98px) {
	.section-2 .inner-left .inner-list .inner-item {
		width: 100%; /* Full width on mobile */
	}
}

/* End section-2 */

/* section-3 and section-4 (General .section styling) */
.section .inner-wrap {
	display: grid;
	grid-template-columns: 1fr; /* Default to single column layout */
	gap: 15px; /* Gap between header and items */
	padding: 10px;
	margin-top: 20px;
	margin-bottom: 20px;
}

.section .inner-wrap .inner-head {
	color: #DB562B;
	font-weight: 700; /* Bold text */
	font-size: 24px; /* Heading size */
	margin-bottom: 10px;
	border-bottom: 2px solid #DB562B; /* Underline to match color */
	padding-bottom: 5px;
}

/* Styling for each item in section-3 and section-4 */
.section .inner-wrap>.inner-item {
	/* Target direct children .inner-item (news items) */
	margin-bottom: 10px; /* Space between news items */
	border-bottom: 1px solid #eee; /* Separator line */
	padding-bottom: 10px;
}

.section .inner-wrap>.inner-item:last-child {
	border-bottom: none; /* Remove border for the last item */
	margin-bottom: 0;
}

/* Image styling within .section items */
.section .inner-wrap .inner-item .thumb {
	width: 120px; /* Fixed width for thumbnail */
	height: 80px; /* Fixed height for thumbnail */
	flex-shrink: 0; /* Prevents thumbnail from shrinking */
	overflow: hidden;
	border-radius: 4px;
}

.section .inner-wrap .inner-item .thumb img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	transition: transform 0.3s ease;
}

/* Hover effect for .section items */
.section .inner-wrap .inner-item button:hover .thumb img {
	transform: scale(1.05);
}

.section .inner-wrap .inner-item button:hover .title span {
	color: var(--color-primary);
}
/* End section-3 / section-4 */

/* Footer */
.footer {
	background-color: #F7F7F7;
	padding: 40px 0 20px 0;
	margin-top: 30px; /* Space above footer */
}

.footer .inner-top {
	background-color: var(--color-primary);
	border-radius: 4px;
	padding: 20px;
	display: flex;
	gap: 20px; /* Increased gap */
	align-items: center;
	margin-bottom: 40px;
}

.footer .inner-top .inner-title {
	font-weight: 500;
	font-size: 20px;
	line-height: 1.2;
	color: #FFFFFF;
	flex-basis: 40%; /* Give it a base width */
	text-transform: capitalize;
}

.footer .inner-top .inner-form {
	background-color: #F7F7F7; /* Or #FFFFFF for better contrast */
	border-radius: 4px;
	padding: 12px;
	flex: 1; /* Take remaining space */
	display: flex;
	gap: 12px;
}

.footer .inner-top .inner-form input[type="email"] {
	flex: 1;
	height: 45px;
	padding: 0 15px;
	border: 1px solid #A1A1A1;
	font-weight: 500;
	font-size: 14px;
	border-radius: 4px;
}

.footer .inner-top .inner-form button[type="submit"] {
	background-color: var(--color-primary);
	color: #FFFFFF;
	font-weight: 500;
	font-size: 14px;
	border-radius: 4px;
	text-align: center;
	border: 1px solid var(--color-primary);
	cursor: pointer;
	padding: 0 20px;
}

.footer .inner-top .inner-form button[type="submit"]:hover {
	opacity: 0.9;
}

.footer .inner-middle {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 40px;
	flex-wrap: wrap; /* Allow wrapping on small screens */
	gap: 20px; /* Add gap for wrapped items */
}

.footer .inner-middle .inner-link ul {
	list-style: none;
	margin: 0;
	padding: 0;
	display: flex;
	flex-wrap: wrap; /* Allow links to wrap */
	gap: 30px; /* Adjusted gap */
}

.footer .inner-middle .inner-link a {
	font-weight: 500;
	font-size: 14px;
	color: #25282B;
}

.footer .inner-middle .inner-link a:hover {
	color: var(--color-primary);
}

.footer .inner-middle .inner-socials ul {
	list-style: none;
	margin: 0;
	padding: 0;
	display: flex;
	gap: 20px; /* Adjusted gap */
}

.footer .inner-middle .inner-socials a {
	font-weight: 500;
	font-size: 20px;
	color: #25282B;
}

.footer .inner-middle .inner-socials a:hover {
	color: var(--color-primary);
}

.footer .inner-bottom {
	padding-top: 20px;
	border-top: 1px solid #cccccc;
	display: flex;
	flex-wrap: wrap; /* Allow wrapping */
	justify-content: space-between; /* Align items better */
	align-items: center;
	gap: 15px;
}

.footer .inner-bottom .inner-copyright {
	font-size: 14px;
	color: #555;
}

.footer .inner-bottom .inner-logo img {
	height: 40px;
	width: auto;
}

@media ( max-width : 991.98px) {
	.footer .inner-top {
		padding: 15px;
		flex-direction: column; /* Stack title and form */
		align-items: stretch; /* Make items full width */
	}
	.footer .inner-top .inner-title {
		flex-basis: auto;
		width: 100%;
		text-align: center;
		margin-bottom: 15px;
	}
	.footer .inner-middle {
		flex-direction: column; /* Stack links and socials */
		align-items: center;
	}
	.footer .inner-middle .inner-link ul {
		gap: 15px;
		justify-content: center;
		margin-bottom: 20px;
	}
	.footer .inner-middle .inner-socials ul {
		gap: 15px;
		justify-content: center;
	}
	.footer .inner-bottom {
		flex-direction: column;
		justify-content: center;
		text-align: center;
	}
	.footer .inner-bottom .inner-copyright {
		order: 2; /* Put copyright below logo on small screens */
		margin-top: 10px;
	}
	.footer .inner-bottom .inner-logo {
		order: 1;
	}
}
</style>
</head>
<body>
	<%@ include file="/views/header.jsp" %>
	<div class="section-1">
		<div class="container">
			<div class="inner-wrap">
				<div class="inner-left">
					<div class="box-new">
						<div class="inner-item inner-item-1"
							style="border-bottom: none !important;">
							<h3 style="transition: color 0.2s ease-in-out;"
								onmouseover="this.style.color='#34a6b7'"
								onmouseout="this.style.color='#333'">Tin tức mới nhất hôm
								nay!</h3>
							<c:forEach var="paper" items="${TodayPapers}" varStatus="loop">
								<c:if test="${loop.first}">
									<form
										action="${pageContext.request.contextPath}/user/paperDetail"
										method="get" style="text-align: left;">
										<input type="hidden" name="id" value="${paper.id}" />
										<button type="submit"
											style="display: block; width: 100%; padding: 0; border: none; background: none; text-align: left; cursor: pointer;">
											<div class="inner-title">
												<%-- Image comes first --%>
												<img src="${paper.paperDetail.paperImage}"
													alt="${paper.paperName}"
													style="width: 100%; height: auto; max-height: 450px; object-fit: cover; margin-bottom: 10px; border-radius: 8px;" />
												<%-- Then the text (paper name) --%>
												<p
													style="margin: 0; font-size: 20px; font-weight: bold; color: #333; line-height: 1.4; transition: color 0.2s ease-in-out;"
													onmouseover="this.style.color='#34a6b7'"
													onmouseout="this.style.color='#333'">${paper.paperName}</p>
											</div>
										</button>
									</form>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="inner-right">
					<div class="box-right">
						<c:forEach var="p" items="${paperList}" begin="0" end="4">
							<div class="inner-item">
								<form
									action="${pageContext.request.contextPath}/user/paperDetail"
									method="get"
									style="margin: 0; padding: 0; border: none; width: 100%;">
									<input type="hidden" name="id" value="${p.id}" />
									<button type="submit"
										style="display: flex; align-items: center; width: 100%; background: none; border: none; cursor: pointer; text-align: left; padding: 10px 0;">
										<div class="thumb"
											style="width: 100px; height: 70px; flex-shrink: 0; overflow: hidden; border-radius: 4px; transition: transform 0.2s ease-in-out;">
											<img src="${p.paperDetail.paperImage}" alt="${p.paperName}"
												style="width: 100%; height: 100%; object-fit: cover; transition: transform 0.2s ease-in-out;"
												onmouseover="this.style.transform='scale(1.05)'"
												onmouseout="this.style.transform='scale(1)'"
												onmousedown="this.style.transform='scale(0.95)'; this.style.opacity='0.8';"
												onmouseup="this.style.transform='scale(1)'; this.style.opacity='1';" />
										</div>
										<div class="title"
											style="margin-left: 15px; flex-grow: 1; transition: color 0.2s ease-in-out;">
											<span
												style="font-size: 14px; color: #333; line-height: 1.4; transition: color 0.2s ease-in-out;"
												onmouseover="this.style.color='#34a6b7'"
												onmouseout="this.style.color='#333'">${p.paperName}</span>
										</div>
									</button>
								</form>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="section-2"
		style="overflow: hidden; padding-top: 30px; padding-bottom: 30px; padding-left: 30px; padding-right: 30px; margin-left: 25px;">
		<h3
			style="text-align: left; margin-left: 45px; margin-right: auto; font-size: 1.5em; margin-bottom: 15px;">Tin
			tức khác</h3>
		<div class="inner-list"
			style="display: flex; gap: 20px; align-items: flex-start; justify-content: flex-start; margin-left: 45px;">
			<c:forEach var="paper" items="${TodayPapers}" varStatus="loop">
				<c:if test="${loop.index > 0 && loop.index < 4}">
					<%-- Bắt đầu từ bài thứ 2 (index 1) và hiển thị tối đa 3 tin --%>
					<div class="inner-item" style="flex: 0 0 auto; max-width: 180px;">
						<form
							action="${pageContext.request.contextPath}/user/paperDetail"
							method="get"
							style="margin: 0; padding: 0; border: none; height: 100%;">
							<input type="hidden" name="id" value="${paper.id}" />
							<button type="submit"
								style="display: flex; flex-direction: column; align-items: flex-start; width: 100%; height: 100%; background: none; border: none; cursor: pointer; padding: 0; text-align: left;">

								<div class="thumb"
									style="width: 100%; height: 90px; overflow: hidden; border-radius: 4px; margin-bottom: 5px; cursor: pointer; transition: background-color 0.2s ease-in-out;"
									onmouseover="this.style.backgroundColor='#34a6b7';"
									onmouseout="this.style.backgroundColor='transparent';">
									<img src="${paper.paperDetail.paperImage}"
										alt="${paper.paperName}"
										style="width: 100%; height: 100%; object-fit: cover; transition: transform 0.2s ease-in-out, opacity 0.2s ease-in-out;"
										onmouseover="this.style.transform='scale(1.05)'"
										onmouseout="this.style.transform='scale(1)'"
										onactive="this.style.transform='scale(0.95)'; this.style.opacity='0.8';" />
								</div>

								<div class="title"
									style="width: 100%; transition: color 0.2s ease-in-out;">
									<span
										style="font-size: 14px; color: #333; word-wrap: break-word; display: inline-block; line-height: 1.2;"
										onmouseover="this.style.color='#34a6b7'"
										onmouseout="this.style.color='#333'">${paper.paperName}</span>
								</div>
							</button>
						</form>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="inner-wrap">
				<div class="inner-head">
					<h2 style="transition: color 0.2s ease-in-out; font-size: 1.8em;"
						onmouseover="this.style.color='#34a6b7'"
						onmouseout="this.style.color='#DB562B'"># Khám phá Việt Nam</h2>
				</div>
				<c:forEach var="p" items="${paperList}">
					<c:if test="${p.paperType.paperTypeName == 'Khám phá Việt Nam'}">
						<div class="inner-item" style="margin-bottom: 8px;">
							<form
								action="${pageContext.request.contextPath}/user/paperDetail"
								method="get"
								style="margin: 0; padding: 0; border: none; width: 100%;">
								<input type="hidden" name="id" value="${p.id}" />
								<button type="submit"
									style="display: flex; align-items: center; width: 100%; background: none; border: none; cursor: pointer; text-align: left; padding: 8px 0;">
									<div class="thumb"
										style="width: 150px; height: 100px; flex-shrink: 0; overflow: hidden; border-radius: 4px;">
										<img src="${p.paperDetail.paperImage}" alt="${p.paperName}"
											style="width: 100%; height: 100%; object-fit: cover;" />
									</div>
									<div class="title" style="margin-left: 10px; flex-grow: 1;">
										<span
											style="font-size: 1.1em; color: #333; font-weight: 500; line-height: 1.3; transition: color 0.2s ease-in-out;"
											onmouseover="this.style.color='#34a6b7'"
											onmouseout="this.style.color='#333'">${p.paperName}</span>
									</div>
								</button>
							</form>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="inner-wrap">
				<div class="inner-head">
					<h2 style="transition: color 0.2s ease-in-out; font-size: 1.8em;"
						onmouseover="this.style.color='#34a6b7'"
						onmouseout="this.style.color='#DB562B'"># Khám phá Thế giới</h2>
				</div>
				<c:forEach var="p" items="${paperList}">
					<c:if test="${p.paperType.paperTypeName == 'Khám phá thế giới'}">
						<div class="inner-item" style="margin-bottom: 8px;">
							<form
								action="${pageContext.request.contextPath}/user/paperDetail"
								method="get"
								style="margin: 0; padding: 0; border: none; width: 100%;">
								<input type="hidden" name="id" value="${p.id}" />
								<button type="submit"
									style="display: flex; align-items: center; width: 100%; background: none; border: none; cursor: pointer; text-align: left; padding: 8px 0;">
									<div class="thumb"
										style="width: 150px; height: 100px; flex-shrink: 0; overflow: hidden; border-radius: 4px;">
										<img src="${p.paperDetail.paperImage}" alt="${p.paperName}"
											style="width: 100%; height: 100%; object-fit: cover;" />
									</div>
									<div class="title" style="margin-left: 10px; flex-grow: 1;">
										<span
											style="font-size: 1.1em; color: #333; font-weight: 500; line-height: 1.3; transition: color 0.2s ease-in-out;"
											onmouseover="this.style.color='#34a6b7'"
											onmouseout="this.style.color='#333'">${p.paperName}</span>
									</div>
								</button>
							</form>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="footer">
		<div class="container">
			<div class="inner-top">
				<div class="inner-title">Đừng bỏ lỡ tin tức quan trọng!</div>
				<form action="${pageContext.request.contextPath}/user/register"
					method="get" class="inner-form">
					<input type="email" name="email" placeholder="Địa chỉ Email..."
						required>
					<button type="submit">Đăng Ký Ngay</button>
				</form>
			</div>
			<div class="inner-middle">
				<nav class="inner-link">
					<ul>
						<li><a href="#">Điều khoản sử dụng</a></li>
						<li><a href="#">Chính sách bảo mật</a></li>
						<li><a href="#">Cookies</a></li>
						<li><a href="#">RSS</a></li>
					</ul>
				</nav>
			</div>
			<div class="inner-bottom">
				<div class="inner-copyright">© 1997-2025. Toàn bộ bản quyền
					thuộc Báo mới</div>
			</div>
		</div>
	</div>
</body>
</html>
