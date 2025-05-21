<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trang chủ</title>
<link rel="stylesheet" href="/newsWeb/views/Css/index.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
</head>
<body>
	<!-- Top Header -->
	<div class="top-header">
		<a href="#"> <img src="assets/images/Backgound-1.jpg" alt="">
		</a>
	</div>
	<!-- End Top Header -->

	<!-- Header -->
	<div class="header">
		<div class="container">
			<div class="inner-wrap">
				<!-- Menu Mobile -->
				<button class="inner-menu-mobile">
					<i class="fa-solid fa-bars"></i>
				</button>

				<!-- logo -->
				<div class="inner-logo">
					<a href="#"> <img src="assets/images/logo.jpg" alt="">
					</a>
				</div>

				<!-- menu  -->
				<nav class="inner-menu">
					<ul>
						<li><a href="#" class="active"> <i
								class="fa-solid fa-house"></i>
						</a></li>
						<c:forEach var="paper" items="${paperType}">
							<li><a href="#">${paper.paperTypeName}</a>
								<ul>
									<li><a href="#"> Chính trị </a></li>
									<li><a href="#"> Tinh gọn bộ máy </a></li>
									<li><a href="#"> Nhân sự </a></li>
									<li><a href="#"> Kỷ nguyên mới </a></li>
									<li><a href="#"> Dân sinh </a></li>
								</ul></li>
						</c:forEach>
					</ul>
				</nav>

				<!-- search -->
				<form action="${pageContext.request.contextPath}/user/search"
					method="get" class="inner-form">
					<div class="inner-search">
						<input type="text" name="keyword"
							placeholder="Nhập nội dung tìm kiếm" class="inner-input">
					</div>
					<button class="inner-button">
						<i class="fa-solid fa-magnifying-glass"></i> Tìm kiếm
					</button>
				</form>
			</div>
		</div>
	</div>
	<!-- Top Header -->

	<!--  Section 1  -->
	<div class="section-1">
		<div class="container">
			<div class="inner-wrap">
				<div class="inner-left">
					<div class="box-new">
						<div class="inner-item inner-item-1">
							<h3>Tin tức mới nhất hôm nay!</h3>
							<c:forEach var="paper" items="${TodayPapers}" varStatus="loop">
								<c:if test="${loop.first}">
									<form
										action="${pageContext.request.contextPath}/author/paperDetail"
										method="get" style="text-align: left;">
										<input type="hidden" name="id" value="${paper.id}" />
										<button type="submit"
											style="display: block; width: 100%; padding: 0; border: none; background: none; text-align: left; cursor: pointer;">
											<div class="inner-title">
												<p style="margin: 0; font-size: 14px;">${paper.paperName}</p>
												<img src="${paper.paperDetail.paperImage}"
													alt="${paper.paperName}"
													style="width: 90%; height: auto; margin-top: 5px;" />
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
						<c:forEach var="p" items="${TodayPapers}">
							<div class="inner-item">
								<form
									action="${pageContext.request.contextPath}/author/paperDetail"
									method="get" style="margin: 0; padding: 0; border: none;">
									<input type="hidden" name="id" value="${p.id}" />
									<button type="submit"
										style="display: flex; align-items: center; width: 100%; background: none; border: none; cursor: pointer; text-align: left; padding: 0;">
										<!-- Ảnh bên trái -->
										<div class="thumb" style="width: 100px; flex-shrink: 0;">
											<img src="${p.paperDetail.paperImage}" alt="${p.paperName}"
												style="width: 100%; height: 70px; object-fit: cover;" />
										</div>
										<!-- Tên bài bên phải -->
										<div class="title" style="margin-left: 15px; flex-grow: 1;">
											<span style="font-size: 14px; color: #333;">${p.paperName}</span>
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
	<!-- End Section 1  -->

	<!-- section-2 -->
	<div class="section-2">
		<div class="container">
			<div class="inner-wrap">
				<div class="inner-left">
					<div class="inner-box">
						<div class="inner-item">
							<c:forEach var="p" items="${BestPapers}">
								<div class="inner-item">
									<form
										action="${pageContext.request.contextPath}/author/paperDetail"
										method="get" style="margin: 0; padding: 0; border: none;">
										<input type="hidden" name="id" value="${p.id}" />
										<button type="submit"
											style="display: flex; align-items: center; width: 100%; background: none; border: none; cursor: pointer; text-align: left; padding: 0;">
											<!-- Ảnh bên trái -->
											<div class="thumb" style="width: 100px; flex-shrink: 0;">
												<img src="${p.paperDetail.paperImage}" alt="${p.paperName}"
													style="width: 100%; height: 70px; object-fit: cover;" />
											</div>
											<!-- Tên bài bên phải -->
											<div class="title" style="margin-left: 15px; flex-grow: 1;">
												<span style="font-size: 14px; color: #333;">${p.paperName}</span>
											</div>
										</button>
									</form>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="inner-right-2">
					<div class="box-right-2">
						<div class="inner-item">
							<div class="inner-image">
								<a href="#"> <img src="assets/images/banner_hcm_02-min.png"
									alt="">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End section-2 -->

	<!-- section-3 -->
	<div class="section">
		<div class="container">
			<div class="inner-wrap">
				<div class="inner-head">
					<h2>Khám phá Việt Nam</h2>
				</div>
				<div class="inner-item">
					<div class="inner-image">
						<a href="#"><img src="assets/images/a1.avif" alt=""></a>
					</div>
					<div class="inner-title">
						<p>Tổng Bí thư Tô Lâm dự chương trình nghệ thuật 'Bài ca chiến
							thắng'</p>
					</div>
				</div>
				<div class="inner-item">
					<div class="inner-image">
						<a href="#"><img src="assets/images/a2.avif" alt=""></a>
					</div>
					<div class="inner-title">
						<p>VKSND Tối cao hủy quyết định giải quyết khiếu nại có hiệu
							lực vụ nữ sinh tai nạn tử vong ở Vĩnh Long</p>
					</div>
				</div>
				<div class="inner-item">
					<div class="inner-image">
						<a href="#"><img src="assets/images/a3.avif" alt=""></a>
					</div>
					<div class="inner-title">
						<p>Tổng Bí thư Tô Lâm dự chương trình nghệ thuật 'Bài ca chiến
							thắng'</p>
					</div>
				</div>
				<div class="inner-item">
					<div class="inner-image">
						<a href="#"><img src="assets/images/a1.avif" alt=""></a>
					</div>
					<div class="inner-title">
						<p>Tổng Bí thư Tô Lâm dự chương trình nghệ thuật 'Bài ca chiến
							thắng'</p>
					</div>
				</div>
				<div class="inner-item">
					<div class="inner-image">
						<a href="#"><img src="assets/images/a2.avif" alt=""></a>
					</div>
					<div class="inner-title">
						<p>VKSND Tối cao hủy quyết định giải quyết khiếu nại có hiệu
							lực vụ nữ sinh tai nạn tử vong ở Vĩnh Long</p>
					</div>
				</div>
				<div class="inner-item">
					<div class="inner-image">
						<a href="#"><img src="assets/images/a3.avif" alt=""></a>
					</div>
					<div class="inner-title">
						<p>Tổng Bí thư Tô Lâm dự chương trình nghệ thuật 'Bài ca chiến
							thắng'</p>
					</div>
				</div>
				<div class="inner-item">
					<div class="inner-image">
						<a href="#"><img src="assets/images/a1.avif" alt=""></a>
					</div>
					<div class="inner-title">
						<p>Tổng Bí thư Tô Lâm dự chương trình nghệ thuật 'Bài ca chiến
							thắng'</p>
					</div>
				</div>
				<div class="inner-item">
					<div class="inner-image">
						<a href="#"><img src="assets/images/a2.avif" alt=""></a>
					</div>
					<div class="inner-title">
						<p>VKSND Tối cao hủy quyết định giải quyết khiếu nại có hiệu
							lực vụ nữ sinh tai nạn tử vong ở Vĩnh Long</p>
					</div>
				</div>
				<div class="inner-item">
					<div class="inner-image">
						<a href="#"><img src="assets/images/a3.avif" alt=""></a>
					</div>
					<div class="inner-title">
						<p>Tổng Bí thư Tô Lâm dự chương trình nghệ thuật 'Bài ca chiến
							thắng'</p>
					</div>
				</div>
				<div class="inner-item">
					<div class="inner-image">
						<a href="#"><img src="assets/images/a1.avif" alt=""></a>
					</div>
					<div class="inner-title">
						<p>Tổng Bí thư Tô Lâm dự chương trình nghệ thuật 'Bài ca chiến
							thắng'</p>
					</div>
				</div>
				<div class="inner-item">
					<div class="inner-image">
						<a href="#"><img src="assets/images/a2.avif" alt=""></a>
					</div>
					<div class="inner-title">
						<p>VKSND Tối cao hủy quyết định giải quyết khiếu nại có hiệu
							lực vụ nữ sinh tai nạn tử vong ở Vĩnh Long</p>
					</div>
				</div>
				<div class="inner-item">
					<div class="inner-image">
						<a href="#"><img src="assets/images/a3.avif" alt=""></a>
					</div>
					<div class="inner-title">
						<p>Tổng Bí thư Tô Lâm dự chương trình nghệ thuật 'Bài ca chiến
							thắng'</p>
					</div>
				</div>
				<div class="inner-item">
					<div class="inner-image">
						<a href="#"><img src="assets/images/a1.avif" alt=""></a>
					</div>
					<div class="inner-title">
						<p>Tổng Bí thư Tô Lâm dự chương trình nghệ thuật 'Bài ca chiến
							thắng'</p>
					</div>
				</div>
				<div class="inner-item">
					<div class="inner-image">
						<a href="#"><img src="assets/images/a2.avif" alt=""></a>
					</div>
					<div class="inner-title">
						<p>VKSND Tối cao hủy quyết định giải quyết khiếu nại có hiệu
							lực vụ nữ sinh tai nạn tử vong ở Vĩnh Long</p>
					</div>
				</div>
				<div class="inner-item">
					<div class="inner-image">
						<a href="#"><img src="assets/images/a3.avif" alt=""></a>
					</div>
					<div class="inner-title">
						<p>Tổng Bí thư Tô Lâm dự chương trình nghệ thuật 'Bài ca chiến
							thắng'</p>
					</div>
				</div>
				<div class="inner-item">
					<div class="inner-image">
						<a href="#"><img src="assets/images/a1.avif" alt=""></a>
					</div>
					<div class="inner-title">
						<p>Tổng Bí thư Tô Lâm dự chương trình nghệ thuật 'Bài ca chiến
							thắng'</p>
					</div>
				</div>
				<div class="inner-item">
					<div class="inner-image">
						<a href="#"><img src="assets/images/a2.avif" alt=""></a>
					</div>
					<div class="inner-title">
						<p>VKSND Tối cao hủy quyết định giải quyết khiếu nại có hiệu
							lực vụ nữ sinh tai nạn tử vong ở Vĩnh Long</p>
					</div>
				</div>
				<div class="inner-item">
					<div class="inner-image">
						<a href="#"><img src="assets/images/a3.avif" alt=""></a>
					</div>
					<div class="inner-title">
						<p>Tổng Bí thư Tô Lâm dự chương trình nghệ thuật 'Bài ca chiến
							thắng'</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End section-3 -->
	<!-- section-4 -->
	<div class="section">
		<div class="container">
			<div class="inner-wrap">
				<div class="inner-head">
					<h2>Khám phá thế giới</h2>
				</div>
				<c:forEach var="p" items="${ForeignPapers}">
					<div class="inner-item" style="margin-bottom: 15px;">
						<!-- Thêm khoảng cách giữa các mục -->
						<form
							action="${pageContext.request.contextPath}/author/paperDetail"
							method="get" style="margin: 0; padding: 0; border: none;">
							<input type="hidden" name="id" value="${p.id}" />
							<button type="submit"
								style="display: flex; align-items: center; width: 100%; background: none; border: none; cursor: pointer; text-align: left; padding: 0;">
								<!-- Ảnh bên trái: tăng kích thước -->
								<div class="thumb" style="width: 150px; flex-shrink: 0;">
									<img src="${p.paperDetail.paperImage}" alt="${p.paperName}"
										style="width: 150px; height: 100px; object-fit: cover;" />
								</div>
								<!-- Tên bài bên phải: tăng font-size và khoảng cách -->
								<div class="title" style="margin-left: 20px; flex-grow: 1;">
									<span style="font-size: 18px; color: #333;">${p.paperName}</span>
								</div>
							</button>
						</form>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- End section-4 -->
	<%-- 	Test
	<c:forEach var="paper" items="${TodayPapers}">
		<p>${paper.paperName}</p>
	</c:forEach> --%>

	<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="inner-top">
				<div class="inner-title">Đừng bỏ lỡ tin tức quan trọng!</div>
				<form action="${pageContext.request.contextPath}/user/register"
					method="get" class="inner-form">
					<input type="email" name="email" placeholder="Địa chỉ Email...">
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
				<nav class="inner-socials">
					<ul>
						<li><a href="#"> <i class="fa-brands fa-facebook-f"></i>
						</a></li>
						<li><a href="#"> <i class="fa-brands fa-x-twitter"></i>
						</a></li>
						<li><a href="#"> <i class="fa-brands fa-youtube"></i>
						</a></li>
						<li><a href="#"> <i class="fa-brands fa-tiktok"></i>
						</a></li>
					</ul>
				</nav>
			</div>
			<div class="inner-bottom">
				<div class="inner-copyright">© 1997-2025. Toàn bộ bản quyền
					thuộc VnExpress</div>
				<div class="inner-logo">
					<a href="#"> <img src="assets/images/logo.jpg" alt="">
					</a>
				</div>
			</div>
		</div>
	</div>
	<!-- End footer -->
</body>
</html>