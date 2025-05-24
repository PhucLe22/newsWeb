<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Điều khoản sử dụng - Báo Mới</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<style>
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
	width: 1184px;
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

/* /* Header */
.header {
	padding: 12px 0;
	background-color: #FFFFFF;
	top: 0;
	left: 0;
	width: 100%;
	position: sticky;
	z-index: 1000;
	border-bottom: 1px solid #f0f0f0;
}

.header .inner-wrap {
	display: flex;
	justify-content: space-between;
	align-items: center;
	gap: 30px;
}

.header .inner-logo img {
	height: 50px;
	width: auto;
}

.header .inner-menu ul {
	display: inline-flex;
	list-style: none;
	padding: 0;
	margin: 0;
	gap: 40px;
}

.header .inner-menu>ul>li {
	position: relative;
}

.header .inner-menu>ul>li>a {
	font-weight: 500;
	font-size: 16px;
	color: #25282B;
}

.header .inner-menu>ul>li>a.active, .header .inner-menu>ul>li>a:hover {
	color: var(--color-primary);
}

.header .inner-menu>ul>li>ul {
	position: absolute;
	margin: 0;
	padding: 8px 0;
	list-style: none;
	background-color: #FFFFFF;
	width: 280px;
	border-radius: 0 0 10px 10px;
	top: 100%;
	left: 0;
	z-index: 999;
	display: none;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.header .inner-menu>ul>li:hover>ul {
	display: block;
}

.header .inner-menu>ul>li>ul>li>a {
	display: block;
	padding: 8px 22px;
	font-weight: 400;
	font-size: 16px;
	color: var(--color-primary);
}

.header .inner-menu>ul>li>ul>li>a.active, .header .inner-menu>ul>li>ul>li>a:hover
	{
	background-color: var(--color-primary);
	color: #FFFFFF;
}

.header .inner-form {
	display: flex;
	gap: 5px;
	padding: 0;
}

.header .inner-form .inner-search .inner-input {
	border-radius: 18px;
	height: 30px;
	width: 180px;
	border: 1px solid #A1A1A1;
	padding: 5px 15px;
}

.header .inner-form .inner-button {
	background: var(--color-primary);
	border-radius: 18px;
	padding: 0 15px;
	display: flex;
	border: 1px solid #A1A1A1;
	align-items: center;
	justify-content: center;
	font-weight: 500;
	font-size: 14px;
	color: #FFFFFF;
	cursor: pointer;
}

.header .inner-form .inner-button i {
	font-size: 16px;
}

.header .inner-form .inner-button:hover {
	opacity: 0.9;
}

.header .inner-menu-mobile {
	display: none;
} */

@media ( max-width : 1199.98px) {
	.header .inner-menu ul {
		gap: 25px;
	}
}

@media ( max-width : 991.98px) {
	.header .inner-menu {
		display: none;
	}
	.header .inner-menu-mobile {
		display: inline-block;
		font-size: 22px;
		color: #25282B;
		background-color: transparent;
		border: 0;
		cursor: pointer;
	}
}

@media ( max-width : 374.98px) {
	.header .inner-wrap {
		gap: 10px;
	}
}
/* End Header */

/* Main Content Area */
.inner-admin {
	background-color: #FFFFFF;
	padding: 40px 0;
}

.inner-admin .inner-title-0 h2 {
	color: var(--color-primary);
	text-align: left;
	font-weight: 500;
	font-size: 28px;
	margin-top: 0;
	margin-bottom: 20px;
}

.inner-admin .inner-box {
	background-color: #f7f7f7;
	padding: 50px;
	border-radius: 8px;
}

.inner-admin .inner-box .inner-wrap {
	background-color: #FFFFFF;
	padding: 40px;
	border-radius: 15px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
}

.inner-admin .inner-box .inner-wrap .inner-passage .inner-title-1 h1 {
	text-align: center;
	color: var(--color-primary);
	font-weight: 700;
	font-size: 32px;
	margin-top: 0;
	margin-bottom: 30px;
}

.inner-admin .inner-box .inner-wrap .inner-passage .inner-title-2 h2 {
	font-weight: 600;
	font-size: 22px;
	color: #25282B;
	border-bottom: 1px solid #eee;
	padding-bottom: 10px;
	margin-top: 30px;
	margin-bottom: 15px;
}

.inner-admin .inner-box .inner-wrap .inner-passage p {
	line-height: 1.7;
	font-size: 16px;
	color: #555;
	text-align: justify;
}

.inner-admin .inner-box .inner-wrap .inner-passage ul {
	padding-left: 20px;
	line-height: 1.7;
	color: #555;
	text-align: justify;
}

/* Footer */
.footer {
	background-color: #F7F7F7;
	padding: 40px 0 20px 0;
	margin-top: 50px;
}

.footer .inner-top {
	background-color: var(--color-primary);
	border-radius: 4px;
	padding: 20px;
	display: flex;
	gap: 20px;
	align-items: center;
	margin-bottom: 40px;
}

.footer .inner-top .inner-title {
	font-weight: 500;
	font-size: 20px;
	line-height: 1.2;
	color: #FFFFFF;
	flex-basis: 40%;
}

.footer .inner-top .inner-form {
	background-color: #FFFFFF;
	border-radius: 4px;
	padding: 12px;
	flex: 1;
	display: flex;
	gap: 12px;
}

.footer .inner-top .inner-form input {
	flex: 1;
	height: 45px;
	padding: 0 20px;
	border: 1px solid #A1A1A1;
	border-radius: 4px;
	font-weight: 500;
	font-size: 14px;
}

.footer .inner-top .inner-form button {
	background-color: var(--color-primary);
	color: #FFFFFF;
	font-weight: 500;
	font-size: 14px;
	border-radius: 4px;
	text-align: center;
	padding: 0 20px;
	border: 1px solid var(--color-primary);
	cursor: pointer;
}

.footer .inner-top .inner-form button:hover {
	opacity: 0.9;
}

.footer .inner-middle {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 40px;
}

.footer .inner-middle .inner-link ul {
	list-style: none;
	margin: 0;
	padding: 0;
	display: flex;
	gap: 40px;
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
	gap: 25px;
}

.footer .inner-middle .inner-socials a {
	font-size: 20px;
	color: #25282B;
}

.footer .inner-middle .inner-socials a:hover {
	color: var(--color-primary);
}

.footer .inner-bottom {
	padding-top: 30px;
	border-top: 1px solid #ddd;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	gap: 15px;
	color: #555;
	font-size: 14px;
}

.footer .inner-bottom .inner-logo img {
	height: 40px;
	width: auto;
}

@media ( max-width : 991.98px) {
	.footer .inner-top {
		flex-direction: column;
		align-items: stretch;
		text-align: center;
	}
	.footer .inner-middle {
		flex-direction: column;
		gap: 30px;
	}
}
</style>
</head>
<body>
	<header class="header">
		<div class="container">
			<div class="inner-wrap">
				<div class="inner-logo">
					<a href="#"> <img
						src="https://baomoi-static.zadn.vn/web/styles/img/logo.png"
						alt="Logo Báo Mới">
					</a>
				</div>
				<nav class="inner-menu">
					<ul>
						<li><a href="#" class="active">Trang Chủ</a></li>
						<li><a href="#">Nóng</a></li>
						<li><a href="#">Mới</a></li>
						<li><a href="#">Chủ Đề</a>
							<ul>
								<li><a href="#">Khám Phá Việt Nam</a></li>
								<li><a href="#">Khám Phá Thế Giới</a></li>
								<li><a href="#">Công Nghệ</a></li>
								<li><a href="#">Thể Thao</a></li>
							</ul></li>
						<li><a href="#">Video</a></li>
					</ul>
				</nav>
				<div class="inner-form">
					<div class="inner-search">
						<input class="inner-input" type="text" placeholder="Tìm kiếm...">
					</div>
					<button class="inner-button">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
				</div>
				<button class="inner-menu-mobile">
					<i class="fa-solid fa-bars"></i>
				</button>
			</div>
		</div>
	</header>
	<main class="inner-admin">
		<div class="container">
			<div class="inner-title-0">
				<h2>Trang chính sách</h2>
			</div>
			<div class="inner-box">
				<div class="inner-wrap">
					<div class="inner-passage">
						<div class="inner-title-1">
							<h1>ĐIỀU KHOẢN SỬ DỤNG BÁO MỚI</h1>
						</div>
						<p>Cập nhật lần cuối: 24/05/2025</p>

						<h2 class="inner-title-2">1. Chấp nhận Điều khoản và Điều
							kiện</h2>
						<p>Chào mừng bạn đến với Báo Mới. Bằng việc truy cập và sử
							dụng trang web của chúng tôi (bao gồm cả phiên bản di động và ứng
							dụng), bạn đồng ý tuân thủ và bị ràng buộc bởi các Điều khoản sử
							dụng này ("Điều khoản"). Nếu bạn không đồng ý với bất kỳ phần nào
							của các điều khoản này, vui lòng không sử dụng Dịch vụ của chúng
							tôi. Chúng tôi có quyền sửa đổi các điều khoản này bất cứ lúc
							nào.</p>

						<h2 class="inner-title-2">2. Quyền sở hữu trí tuệ</h2>
						<p>Tất cả nội dung trên trang web này, bao gồm nhưng không
							giới hạn ở văn bản, đồ họa, logo, biểu tượng, hình ảnh, clip âm
							thanh, video và phần mềm, là tài sản của Báo Mới hoặc các nhà
							cung cấp nội dung của chúng tôi và được bảo vệ bởi luật bản quyền
							của Việt Nam và quốc tế. Việc tổng hợp tất cả nội dung trên trang
							web này là tài sản độc quyền của Báo Mới.</p>

						<h2 class="inner-title-2">3. Sử dụng Dịch vụ</h2>
						<p>Bạn đồng ý sử dụng Dịch vụ của chúng tôi chỉ cho các mục
							đích hợp pháp và theo cách không vi phạm quyền, hạn chế hoặc ức
							chế việc sử dụng và hưởng thụ trang web này của bất kỳ bên thứ ba
							nào. Các hành vi bị cấm bao gồm:</p>
						<ul>
							<li>Gây phiền toái hoặc bất tiện cho bất kỳ người nào.</li>
							<li>Truyền tải nội dung tục tĩu, xúc phạm hoặc gây rối luồng
								đối thoại thông thường trong Báo Mới.</li>
							<li>Sử dụng Dịch vụ để thu thập thông tin nhận dạng cá nhân
								của người dùng khác.</li>
							<li>Phát tán virus, mã độc hoặc bất kỳ công nghệ nào khác có
								thể gây hại cho Báo Mới hoặc lợi ích của người dùng.</li>
						</ul>

						<h2 class="inner-title-2">4. Từ chối bảo đảm và Giới hạn
							trách nhiệm</h2>
						<p>Dịch vụ và tất cả thông tin, sản phẩm và nội dung khác được
							cung cấp "nguyên trạng" và "sẵn có" mà không có bất kỳ sự bảo đảm
							nào, dù rõ ràng hay ngụ ý. Báo Mới không đảm bảo rằng trang web
							sẽ không bị gián đoạn hoặc không có lỗi.</p>
						<p>Trong mọi trường hợp, Báo Mới, các giám đốc, nhân viên hoặc
							đại lý của chúng tôi sẽ không chịu trách nhiệm pháp lý cho bất kỳ
							thiệt hại trực tiếp, gián tiếp, ngẫu nhiên, đặc biệt hoặc do hậu
							quả nào phát sinh từ việc bạn sử dụng hoặc không thể sử dụng Dịch
							vụ.</p>

						<h2 class="inner-title-2">5. Liên kết đến các trang web của
							bên thứ ba</h2>
						<p>Dịch vụ của chúng tôi có thể chứa các liên kết đến các
							trang web hoặc dịch vụ của bên thứ ba không thuộc sở hữu hoặc
							quyền kiểm soát của Báo Mới. Chúng tôi không có quyền kiểm soát
							và không chịu trách nhiệm về nội dung, chính sách bảo mật hoặc
							thực tiễn của bất kỳ trang web hoặc dịch vụ nào của bên thứ ba.</p>

						<h2 class="inner-title-2">6. Luật áp dụng</h2>
						<p>Các Điều khoản này sẽ được điều chỉnh và hiểu theo luật
							pháp của nước Cộng hòa Xã hội Chủ nghĩa Việt Nam, mà không tính
							đến xung đột các quy định của pháp luật.</p>
					</div>
				</div>
			</div>
		</div>
	</main>
	<footer class="footer">
		<div class="container">
			<div class="inner-top">
				<div class="inner-title">Đừng bỏ lỡ những tin tức quan trọng,
					đăng ký ngay!</div>
				<form class="inner-form">
					<input type="email" placeholder="Nhập địa chỉ email của bạn...">
					<button type="submit">Đăng Ký</button>
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
				<div class="inner-socials">
					<ul>
						<li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
						<li><a href="#"><i class="fab fa-twitter"></i></a></li>
						<li><a href="#"><i class="fab fa-youtube"></i></a></li>
						<li><a href="#"><i class="fab fa-instagram"></i></a></li>
					</ul>
				</div>
			</div>
			<div class="inner-bottom">
				<div class="inner-logo">
					<img src="https://baomoi-static.zadn.vn/web/styles/img/logo.png"
						alt="Logo Báo Mới">
				</div>
				<div class="inner-copyright">© 1997-2025. Toàn bộ bản quyền
					thuộc về Báo Mới.</div>
			</div>
		</div>
	</footer>
</body>
</html>