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

						<li><a href="#"> Thời sự </a>
							<ul>
								<li><a href="#"> Chính trị </a></li>
								<li><a href="#"> Tinh gọn bộ máy </a></li>
								<li><a href="#"> Nhân sự </a></li>
								<li><a href="#"> Kỷ nguyên mới </a></li>
								<li><a href="#"> Dân sinh </a></li>
							</ul></li>


						<li><a href="#"> Thế giới </a>
							<ul>
								<li><a href="#"> Tư liệu </a></li>
								<li><a href="#"> Phân tích </a></li>
								<li><a href="#"> Người Việt 55 châu </a></li>
								<li><a href="#"> Cuộc sống đó đây </a></li>
								<li><a href="#"> Quân sự </a></li>
							</ul></li>


						<li><a href="#"> Kinh doanh </a>
							<ul>
								<li><a href="#"> NetZero </a></li>
								<li><a href="#"> Quốc tế </a></li>
								<li><a href="#"> Doanh nghiệp </a></li>
								<li><a href="#"> Chứng Khoán </a></li>
							</ul></li>


						<li><a href="#"> khoa học công nghệ </a>
							<ul>
								<li><a href="#"> AI </a></li>
								<li><a href="#"> Vũ trụ </a></li>
								<li><a href="#"> Thiết bị </a></li>
							</ul></li>


						<li><a href="#"> video </a>
							<ul>
								<li><a href="#"> Thời sự </a></li>
								<li><a href="#"> Nhịp sống </a></li>
							</ul></li>
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
							<div class="inner-image">
								<a href="#"> <img src="assets/images/anh1.avif" alt="anh 1">
								</a>
							</div>
							<div class="inner-title">
								<a href="#">
									<h2>Hôm nay, cao tốc cửa ngõ phía Nam Thủ đô dự kiến đón
										140.000 lượt xe/ngày</h2>
								</a>
							</div>
						</div>
						<c:forEach var="p" items="${BestPapers}">
							<div class="inner-item">
								<div class="inner-title">
									<c:set var="img" value="${p[0].paperDetail.paperImage}" />
									<form action="${pageContext.request.contextPath}/user/paper"
										method="get" style="text-align: left;">
										<input type="hidden" name="id" value="${p[0].id}" />

										<!-- Button bọc cả ảnh + tên, canh theo ảnh -->
										<button type="submit"
											style="display: block; width: 100px; padding: 0; border: none; background: none; text-align: left; cursor: pointer;">

											<img src="${img}" alt="${p[0].paperName}"
												style="width: 100%; height: auto; display: block; margin-bottom: 5px;" />

											<span
												style="display: inline-block; width: 100%; font-size: 14px; line-height: 1.2; word-wrap: break-word; text-align: left;">
												${p[0].paperName} </span>
										</button>
									</form>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="inner-right">
					<div class="box-right">
						<div class="inner-item">
							<div class="inner-image">
								<a href="#"><img src="assets/images/a1.avif" alt=""></a>
							</div>
							<div class="inner-title">
								<p>Tổng Bí thư Tô Lâm dự chương trình nghệ thuật 'Bài ca
									chiến thắng'</p>
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
								<p>ổng Bí thư Tô Lâm dự chương trình nghệ thuật 'Bài ca
									chiến thắng</p>
							</div>
						</div>
						<div class="inner-item">
							<div class="inner-image">
								<a href="#"><img src="assets/images/a4.avif" alt=""></a>
							</div>
							<div class="inner-title">
								<p>ổng Bí thư Tô Lâm dự chương trình nghệ thuật 'Bài ca
									chiến thắng</p>
							</div>
						</div>
						<div class="inner-item">
							<div class="inner-image">
								<a href="#"><img src="assets/images/a5.avif" alt=""></a>
							</div>
							<div class="inner-title">
								<p>ổng Bí thư Tô Lâm dự chương trình nghệ thuật 'Bài ca
									chiến thắng</p>
							</div>
						</div>
						<div class="inner-item">
							<div class="inner-image">
								<a href="#"><img src="assets/images/a6.avif" alt=""></a>
							</div>
							<div class="inner-title">
								<p>ổng Bí thư Tô Lâm dự chương trình nghệ thuật 'Bài ca
									chiến thắng</p>
							</div>
						</div>
						<div class="inner-item">
							<div class="inner-image">
								<a href="#"><img src="assets/images/a7.avif" alt=""></a>
							</div>
							<div class="inner-title">
								<p>ổng Bí thư Tô Lâm dự chương trình nghệ thuật 'Bài ca
									chiến thắng</p>
							</div>
						</div>
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
							<div class="inner-image">
								<a href="#"><img src="assets/images/a1.avif" alt=""></a>
							</div>
							<div class="inner-title">
								<p>Tổng Bí thư Tô Lâm dự chương trình nghệ thuật 'Bài ca
									chiến thắng'</p>
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
								<p>Tổng Bí thư Tô Lâm dự chương trình nghệ thuật 'Bài ca
									chiến thắng'</p>
							</div>
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
	<!-- End section-4 -->

	<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="inner-top">
				<div class="inner-title">Đừng bỏ lỡ tin tức quan trọng!</div>
				<form action="" class="inner-form">
					<input type="email" name="" placeholder="Địa chỉ Email...">
					<button>Đăng Ký Ngay</button>
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