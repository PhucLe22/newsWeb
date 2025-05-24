<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Footer</title>
</head>
<style>
:root {
	--color-primary: #34a6b7;
	--color-primary-hover: #2c8a98;
	--color-dark: #2c3e50;
	--color-gray: #6c757d;
	--color-light-gray: #f8f9fa;
	--color-border: #e9ecef;
	--shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
	--shadow-hover: 0 6px 20px rgba(0, 0, 0, 0.12);
	--border-radius: 8px;
	--transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

.footer {
	background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
	padding: 60px 0 30px 0;
	margin-top: 50px;
	position: relative;
	overflow: hidden;
}

.footer::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	height: 4px;
	background: linear-gradient(90deg, var(--color-primary), #20c997,
		var(--color-primary));
}

.container {
	max-width: 1200px;
	margin: 0 auto;
	padding: 0 15px;
}

.footer .inner-top {
	background: linear-gradient(135deg, var(--color-primary) 0%,
		var(--color-primary-hover) 100%);
	border-radius: 16px;
	padding: 40px 30px;
	display: flex;
	gap: 30px;
	align-items: center;
	margin-bottom: 50px;
	box-shadow: var(--shadow-hover);
	position: relative;
	overflow: hidden;
}

.footer .inner-top::before {
	content: '';
	position: absolute;
	top: -50%;
	right: -50%;
	width: 100%;
	height: 200%;
	background: rgba(255, 255, 255, 0.1);
	transform: rotate(45deg);
	transition: var(--transition);
}

.footer .inner-top:hover::before {
	transform: rotate(45deg) translateX(100%);
}

.footer .inner-top .inner-title {
	font-weight: 600;
	font-size: 24px;
	line-height: 1.3;
	color: #FFFFFF;
	flex-basis: 45%;
	text-transform: none;
	position: relative;
	z-index: 1;
}

.footer .inner-top .inner-title::after {
	content: '📧';
	margin-left: 10px;
	font-size: 20px;
}

.footer .inner-top .inner-form {
	background: rgba(255, 255, 255, 0.95);
	backdrop-filter: blur(10px);
	border-radius: 12px;
	padding: 8px;
	flex: 1;
	display: flex;
	gap: 8px;
	position: relative;
	z-index: 1;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
}

.footer .inner-top .inner-form input[type="email"] {
	flex: 1;
	height: 50px;
	padding: 0 20px;
	border: 2px solid transparent;
	font-weight: 500;
	font-size: 15px;
	border-radius: 8px;
	background: #ffffff;
	transition: var(--transition);
	outline: none;
}

.footer .inner-top .inner-form input[type="email"]:focus {
	border-color: var(--color-primary);
	box-shadow: 0 0 0 3px rgba(52, 166, 183, 0.1);
}

.footer .inner-top .inner-form input[type="email"]::placeholder {
	color: #999;
}

.footer .inner-top .inner-form button[type="submit"] {
	background: linear-gradient(135deg, var(--color-primary) 0%,
		var(--color-primary-hover) 100%);
	color: #FFFFFF;
	font-weight: 600;
	font-size: 15px;
	border-radius: 8px;
	text-align: center;
	border: none;
	cursor: pointer;
	padding: 0 25px;
	transition: var(--transition);
	position: relative;
	overflow: hidden;
}

.footer .inner-top .inner-form button[type="submit"]:hover {
	transform: translateY(-2px);
	box-shadow: 0 6px 20px rgba(52, 166, 183, 0.3);
}

.footer .inner-top .inner-form button[type="submit"]:active {
	transform: translateY(0);
}

.footer .inner-middle {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 50px;
	flex-wrap: wrap;
	gap: 30px;
}

.footer .inner-middle .inner-link ul {
	list-style: none;
	margin: 0;
	padding: 0;
	display: flex;
	flex-wrap: wrap;
	gap: 35px;
}

.footer .inner-middle .inner-link a {
	font-weight: 500;
	font-size: 15px;
	color: var(--color-dark);
	text-decoration: none;
	padding: 8px 12px;
	border-radius: 6px;
	transition: var(--transition);
	position: relative;
}

.footer .inner-middle .inner-link a:hover {
	color: var(--color-primary);
	background: rgba(52, 166, 183, 0.1);
	transform: translateY(-2px);
}

.footer .inner-middle .inner-socials {
	display: flex;
	align-items: center;
	gap: 15px;
}

.footer .inner-middle .inner-socials .social-title {
	font-weight: 600;
	font-size: 16px;
	color: var(--color-dark);
	margin-right: 10px;
}

.footer .inner-middle .inner-socials ul {
	list-style: none;
	margin: 0;
	padding: 0;
	display: flex;
	gap: 15px;
}

.footer .inner-middle .inner-socials a {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 45px;
	height: 45px;
	background: #ffffff;
	color: var(--color-gray);
	border-radius: 50%;
	transition: var(--transition);
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	font-size: 18px;
}

.footer .inner-middle .inner-socials a:hover {
	color: #ffffff;
	transform: translateY(-3px) scale(1.1);
	box-shadow: var(--shadow-hover);
}

.footer .inner-middle .inner-socials a.facebook:hover {
	background: #3b5998;
}

.footer .inner-middle .inner-socials a.twitter:hover {
	background: #1da1f2;
}

.footer .inner-middle .inner-socials a.instagram:hover {
	background: linear-gradient(45deg, #f09433 0%, #e6683c 25%, #dc2743 50%, #cc2366 75%
		, #bc1888 100%);
}

.footer .inner-middle .inner-socials a.youtube:hover {
	background: #ff0000;
}

.footer .inner-middle .inner-socials a.linkedin:hover {
	background: #0077b5;
}

.footer .inner-bottom {
	padding-top: 30px;
	border-top: 2px solid var(--color-border);
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	align-items: center;
	gap: 20px;
	position: relative;
}

.footer .inner-bottom::before {
	content: '';
	position: absolute;
	top: 0;
	left: 50%;
	transform: translateX(-50%);
	width: 100px;
	height: 2px;
	background: linear-gradient(90deg, transparent, var(--color-primary),
		transparent);
}

.footer .inner-bottom .inner-copyright {
	font-size: 15px;
	color: var(--color-gray);
	display: flex;
	align-items: center;
	gap: 8px;
}

.footer .inner-bottom .inner-copyright::before {
	content: '©';
	font-size: 18px;
	color: var(--color-primary);
	font-weight: bold;
}

.footer .inner-bottom .inner-logo img {
	height: 45px;
	width: auto;
	transition: var(--transition);
	filter: grayscale(20%);
}

.footer .inner-bottom .inner-logo img:hover {
	transform: scale(1.05);
	filter: grayscale(0%);
}

.footer .inner-bottom .back-to-top {
	position: fixed;
	bottom: 30px;
	right: 30px;
	width: 50px;
	height: 50px;
	background: var(--color-primary);
	color: white;
	border: none;
	border-radius: 50%;
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 18px;
	box-shadow: var(--shadow);
	transition: var(--transition);
	opacity: 0;
	visibility: hidden;
	z-index: 1000;
}

.footer .inner-bottom .back-to-top.show {
	opacity: 1;
	visibility: visible;
}

.footer .inner-bottom .back-to-top:hover {
	background: var(--color-primary-hover);
	transform: translateY(-3px);
	box-shadow: var(--shadow-hover);
}

/* Modal Styles */
.modal {
	display: none;
	position: fixed;
	z-index: 2000;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	backdrop-filter: blur(5px);
	animation: fadeIn 0.3s ease-out;
}

.modal.show {
	display: flex;
	align-items: center;
	justify-content: center;
}

.modal-content {
	background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%);
	margin: 20px;
	padding: 0;
	border-radius: 16px;
	max-width: 600px;
	width: 90%;
	max-height: 80vh;
	overflow-y: auto;
	box-shadow: 0 20px 60px rgba(0, 0, 0, 0.2);
	position: relative;
	animation: slideIn 0.3s ease-out;
}

.modal-header {
	background: linear-gradient(135deg, var(--color-primary) 0%,
		var(--color-primary-hover) 100%);
	color: white;
	padding: 25px 30px;
	border-radius: 16px 16px 0 0;
	display: flex;
	align-items: center;
	justify-content: space-between;
	position: relative;
	overflow: hidden;
}

.modal-header::before {
	content: '';
	position: absolute;
	top: -50%;
	right: -50%;
	width: 100%;
	height: 200%;
	background: rgba(255, 255, 255, 0.1);
	transform: rotate(45deg);
}

.modal-header h2 {
	margin: 0;
	font-size: 22px;
	font-weight: 600;
	position: relative;
	z-index: 1;
	display: flex;
	align-items: center;
	gap: 10px;
}

.modal-close {
	background: rgba(255, 255, 255, 0.2);
	border: none;
	color: white;
	font-size: 24px;
	cursor: pointer;
	padding: 8px;
	border-radius: 50%;
	width: 40px;
	height: 40px;
	display: flex;
	align-items: center;
	justify-content: center;
	transition: var(--transition);
	position: relative;
	z-index: 1;
}

.modal-close:hover {
	background: rgba(255, 255, 255, 0.3);
	transform: rotate(90deg);
}

.modal-body {
	padding: 30px;
	line-height: 1.7;
	color: var(--color-dark);
}

.modal-body h3 {
	color: var(--color-primary);
	margin-top: 25px;
	margin-bottom: 15px;
	font-size: 18px;
	font-weight: 600;
}

.modal-body p {
	margin-bottom: 15px;
	text-align: justify;
}

.modal-body ul {
	margin: 15px 0;
	padding-left: 20px;
}

.modal-body li {
	margin-bottom: 8px;
}

.contact-info {
	background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
	padding: 20px;
	border-radius: 12px;
	margin: 20px 0;
	border-left: 4px solid var(--color-primary);
}

.contact-item {
	display: flex;
	align-items: center;
	margin: 12px 0;
	gap: 12px;
}

.contact-item i {
	width: 24px;
	color: var(--color-primary);
	font-size: 16px;
}

@
keyframes fadeIn {from { opacity:0;
	
}

to {
	opacity: 1;
}

}
@
keyframes slideIn {from { opacity:0;
	transform: translateY(-50px) scale(0.95);
}

to {
	opacity: 1;
	transform: translateY(0) scale(1);
}

}
@media ( max-width : 991.98px) {
	.footer {
		padding: 40px 0 20px 0;
		margin-top: 30px;
	}
	.footer .inner-top {
		padding: 30px 20px;
		flex-direction: column;
		align-items: stretch;
		gap: 25px;
	}
	.footer .inner-top .inner-title {
		flex-basis: auto;
		width: 100%;
		text-align: center;
		font-size: 20px;
	}
	.footer .inner-top .inner-form {
		flex-direction: column;
		gap: 15px;
		padding: 15px;
	}
	.footer .inner-top .inner-form input[type="email"] {
		height: 45px;
	}
	.footer .inner-top .inner-form button[type="submit"] {
		height: 45px;
	}
	.footer .inner-middle {
		flex-direction: column;
		align-items: center;
		gap: 25px;
	}
	.footer .inner-middle .inner-link ul {
		gap: 20px;
		justify-content: center;
		text-align: center;
	}
	.footer .inner-middle .inner-socials {
		flex-direction: column;
		gap: 15px;
	}
	.footer .inner-bottom {
		flex-direction: column;
		justify-content: center;
		text-align: center;
		gap: 15px;
	}
	.footer .inner-bottom .inner-copyright {
		order: 2;
		justify-content: center;
	}
	.footer .inner-bottom .inner-logo {
		order: 1;
	}
	.modal-content {
		margin: 10px;
		width: 95%;
	}
	.modal-header {
		padding: 20px;
	}
	.modal-body {
		padding: 20px;
	}
}

@media ( max-width : 480px) {
	.footer .inner-middle .inner-link ul {
		flex-direction: column;
		gap: 15px;
	}
	.footer .inner-middle .inner-socials ul {
		gap: 12px;
	}
	.footer .inner-middle .inner-socials a {
		width: 40px;
		height: 40px;
		font-size: 16px;
	}
	.modal-header h2 {
		font-size: 18px;
	}
}
</style>

<div class="footer">
	<div class="container">
		<div class="inner-top">
			<div class="inner-title">Đừng bỏ lỡ tin tức quan trọng!</div>
			<form action="${pageContext.request.contextPath}/register"
				method="get" class="inner-form">
				<input type="email" name="email"
					placeholder="Nhập địa chỉ email của bạn..." required>
				<button type="submit">
					<i class="fas fa-paper-plane" style="margin-right: 6px;"></i> Đăng
					Ký
				</button>
			</form>
		</div>

		<div class="inner-middle">
			<nav class="inner-link">
				<ul>
					<li><a href="#" onclick="openModal('termsModal')"> <i
							class="fas fa-file-contract" style="margin-right: 6px;"></i> Điều
							khoản sử dụng
					</a></li>
					<li><a href="#" onclick="openModal('privacyModal')"> <i
							class="fas fa-shield-alt" style="margin-right: 6px;"></i> Chính
							sách bảo mật
					</a></li>
					<li><a href="#" onclick="openModal('cookiesModal')"> <i
							class="fas fa-cookie-bite" style="margin-right: 6px;"></i>
							Cookies
					</a></li>
					<li><a href="#" onclick="openModal('rssModal')"> <i
							class="fas fa-rss" style="margin-right: 6px;"></i> RSS
					</a></li>
					<li><a href="#" onclick="openModal('contactModal')"> <i
							class="fas fa-phone" style="margin-right: 6px;"></i> Liên hệ
					</a></li>
				</ul>
			</nav>
		</div>

		<div class="inner-bottom">
			<div class="inner-copyright">1997-2025. Toàn bộ bản quyền thuộc
				Báo mới</div>
			<div class="inner-logo">
				<img src="https://baomoi-static.zadn.vn/web/styles/img/logo.png"
					alt="Logo">
			</div>
		</div>
	</div>

	<button class="back-to-top" onclick="scrollToTop()"
		title="Về đầu trang">
		<i class="fas fa-arrow-up"></i>
	</button>
</div>

<!-- Modal Điều khoản sử dụng -->
<div id="termsModal" class="modal">
	<div class="modal-content">
		<div class="modal-header">
			<h2>
				<i class="fas fa-file-contract"></i> Điều khoản sử dụng
			</h2>
			<button class="modal-close" onclick="closeModal('termsModal')">&times;</button>
		</div>
		<div class="modal-body">
			<h3>1. Chấp nhận điều khoản</h3>
			<p>Bằng việc truy cập và sử dụng website này, bạn đã đồng ý tuân
				thủ và bị ràng buộc bởi các điều khoản và điều kiện sử dụng sau đây.</p>

			<h3>2. Sử dụng nội dung</h3>
			<p>Tất cả nội dung trên website này được bảo vệ bởi luật bản
				quyền. Bạn có thể:</p>
			<ul>
				<li>Đọc và chia sẻ nội dung cho mục đích cá nhân</li>
				<li>Trích dẫn với ghi rõ nguồn</li>
				<li>Sử dụng nội dung cho mục đích giáo dục phi lợi nhuận</li>
			</ul>

			<h3>3. Hành vi cấm</h3>
			<p>Người sử dụng không được phép:</p>
			<ul>
				<li>Sao chép toàn bộ nội dung mà không có sự cho phép</li>
				<li>Sử dụng nội dung cho mục đích thương mại</li>
				<li>Đăng tải nội dung vi phạm pháp luật</li>
				<li>Gây cản trở hoạt động của website</li>
			</ul>

			<h3>4. Miễn trừ trách nhiệm</h3>
			<p>Website không chịu trách nhiệm về bất kỳ thiệt hại nào phát
				sinh từ việc sử dụng thông tin trên website này.</p>

			<h3>5. Thay đổi điều khoản</h3>
			<p>Chúng tôi có quyền thay đổi các điều khoản này bất kỳ lúc nào
				mà không cần thông báo trước.</p>
		</div>
	</div>
</div>

<!-- Modal Chính sách bảo mật -->
<div id="privacyModal" class="modal">
	<div class="modal-content">
		<div class="modal-header">
			<h2>
				<i class="fas fa-shield-alt"></i> Chính sách bảo mật
			</h2>
			<button class="modal-close" onclick="closeModal('privacyModal')">&times;</button>
		</div>
		<div class="modal-body">
			<h3>1. Thu thập thông tin</h3>
			<p>Chúng tôi thu thập thông tin khi bạn:</p>
			<ul>
				<li>Đăng ký nhận bản tin</li>
				<li>Bình luận trên bài viết</li>
				<li>Liên hệ với chúng tôi</li>
				<li>Sử dụng các tính năng tương tác khác</li>
			</ul>

			<h3>2. Sử dụng thông tin</h3>
			<p>Thông tin được sử dụng để:</p>
			<ul>
				<li>Gửi bản tin và thông báo</li>
				<li>Cải thiện trải nghiệm người dùng</li>
				<li>Phản hồi các yêu cầu hỗ trợ</li>
				<li>Tuân thủ các yêu cầu pháp lý</li>
			</ul>

			<h3>3. Bảo vệ thông tin</h3>
			<p>Chúng tôi cam kết bảo vệ thông tin cá nhân của bạn thông qua:</p>
			<ul>
				<li>Mã hóa dữ liệu nhạy cảm</li>
				<li>Kiểm soát truy cập nghiêm ngặt</li>
				<li>Cập nhật bảo mật thường xuyên</li>
				<li>Đào tạo nhân viên về bảo mật</li>
			</ul>

			<h3>4. Chia sẻ thông tin</h3>
			<p>Chúng tôi không bán, trao đổi hoặc chuyển giao thông tin cá
				nhân cho bên thứ ba mà không có sự đồng ý của bạn, trừ khi được yêu
				cầu bởi pháp luật.</p>

			<h3>5. Quyền của người dùng</h3>
			<p>Bạn có quyền yêu cầu truy cập, chỉnh sửa hoặc xóa thông tin cá
				nhân của mình bất kỳ lúc nào.</p>
		</div>
	</div>
</div>

<!-- Modal Cookies -->
<div id="cookiesModal" class="modal">
	<div class="modal-content">
		<div class="modal-header">
			<h2>
				<i class="fas fa-cookie-bite"></i> Chính sách Cookies
			</h2>
			<button class="modal-close" onclick="closeModal('cookiesModal')">&times;</button>
		</div>
		<div class="modal-body">
			<h3>1. Cookies là gì?</h3>
			<p>Cookies là những tệp tin nhỏ được lưu trữ trên thiết bị của
				bạn khi truy cập website. Chúng giúp website ghi nhớ thông tin về
				lượt truy cập của bạn.</p>

			<h3>2. Loại cookies chúng tôi sử dụng</h3>
			<p>
				<strong>Cookies cần thiết:</strong> Đảm bảo website hoạt động bình
				thường
			</p>
			<p>
				<strong>Cookies phân tích:</strong> Giúp chúng tôi hiểu cách người
				dùng sử dụng website
			</p>
			<p>
				<strong>Cookies tùy chỉnh:</strong> Ghi nhớ sở thích và cài đặt của
				bạn
			</p>
			<p>
				<strong>Cookies quảng cáo:</strong> Hiển thị quảng cáo phù hợp với
				sở thích
			</p>

			<h3>3. Mục đích sử dụng</h3>
			<ul>
				<li>Cải thiện hiệu suất website</li>
				<li>Cá nhân hóa trải nghiệm người dùng</li>
				<li>Phân tích lưu lượng truy cập</li>
				<li>Ghi nhớ đăng nhập và cài đặt</li>
			</ul>

			<h3>4. Quản lý cookies</h3>
			<p>Bạn có thể quản lý hoặc xóa cookies thông qua cài đặt trình
				duyệt. Tuy nhiên, việc vô hiệu hóa cookies có thể ảnh hưởng đến một
				số tính năng của website.</p>

			<h3>5. Cookies của bên thứ ba</h3>
			<p>Website có thể sử dụng cookies từ các dịch vụ bên thứ ba như
				Google Analytics, Facebook, Twitter để cải thiện trải nghiệm người
				dùng.</p>
		</div>
	</div>
</div>

<!-- Modal RSS -->
<div id="rssModal" class="modal">
	<div class="modal-content">
		<div class="modal-header">
			<h2>
				<i class="fas fa-rss"></i> RSS Feed
			</h2>
			<button class="modal-close" onclick="closeModal('rssModal')">&times;</button>
		</div>
		<div class="modal-body">
			<h3>1. RSS là gì?</h3>
			<p>RSS (Really Simple Syndication) là một định dạng web feed cho
				phép người dùng và ứng dụng truy cập cập nhật website theo định dạng
				chuẩn hóa.</p>

			<h3>2. Lợi ích của RSS</h3>
			<ul>
				<li>Nhận thông báo ngay khi có nội dung mới</li>
				<li>Đọc tin tức từ nhiều nguồn tại một nơi</li>
				<li>Tiết kiệm thời gian theo dõi website</li>
				<li>Không bị spam email</li>
			</ul>

			<h3>3. Cách sử dụng RSS</h3>
			<p>Để sử dụng RSS feed của chúng tôi:</p>
			<ol>
				<li>Sao chép đường link RSS bên dưới</li>
				<li>Mở ứng dụng đọc RSS (Feedly, Inoreader, etc.)</li>
				<li>Thêm feed mới và dán đường link</li>
				<li>Bắt đầu nhận cập nhật tự động</li>
			</ol>

			<h3>4. Đường link RSS của chúng tôi</h3>
			<div class="contact-info">
				<div class="contact-item">
					<i class="fas fa-rss-square"></i> <a href="#" target="_blank"
						rel="noopener noreferrer">https://baomoi.com/rss</a>
				</div>
			</div>

			<h3>5. Các loại RSS Feed</h3>
			<p>Chúng tôi cung cấp các loại RSS feed sau:</p>
			<ul>
				<li><strong>Trang chủ:</strong> Tất cả tin bài mới nhất</li>
				<li><strong>Tin nóng:</strong> Các sự kiện nổi bật</li>
				<li><strong>Thể thao:</strong> Tin tức về các môn thể thao</li>
				<li><strong>Giải trí:</strong> Thông tin về showbiz, âm nhạc,
					phim ảnh</li>
				<li><strong>Công nghệ:</strong> Tin tức về thiết bị, internet,
					khoa học</li>
				<li><strong>Đời sống:</strong> Các vấn đề xã hội, gia đình, sức
					khỏe</li>
			</ul>
		</div>
	</div>
</div>

<div id="contactModal" class="modal">
	<div class="modal-content">
		<div class="modal-header">
			<h2>
				<i class="fas fa-phone"></i> Liên hệ
			</h2>
			<button class="modal-close" onclick="closeModal('contactModal')">&times;</button>
		</div>
		<div class="modal-body">
			<h3>Thông tin liên hệ</h3>
			<p>Chúng tôi luôn sẵn lòng lắng nghe ý kiến đóng góp và giải đáp
				mọi thắc mắc của bạn.</p>

			<div class="contact-info">
				<div class="contact-item">
					<i class="fas fa-map-marker-alt"></i> <span>Địa chỉ: Tòa nhà
						ABC, Đường XYZ, Quận 1, TP. Hồ Chí Minh</span>
				</div>
				<div class="contact-item">
					<i class="fas fa-envelope"></i> <span>Email:
						lienhe@baomoi.com</span>
				</div>
				<div class="contact-item">
					<i class="fas fa-phone-alt"></i> <span>Điện thoại: (028)
						1234 5678</span>
				</div>
				<div class="contact-item">
					<i class="fas fa-fax"></i> <span>Fax: (028) 8765 4321</span>
				</div>
				<div class="contact-item">
					<i class="fas fa-globe"></i> <a href="https://baomoi.com"
						target="_blank" rel="noopener noreferrer">Website: baomoi.com</a>
				</div>
			</div>
		</div>
	</div>
</div>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<script>
	// Back to top button
	let backToTopButton = document.querySelector(".back-to-top");

	window.onscroll = function() {
		scrollFunction();
	};

	function scrollFunction() {
		if (document.body.scrollTop > 20
				|| document.documentElement.scrollTop > 20) {
			backToTopButton.classList.add("show");
		} else {
			backToTopButton.classList.remove("show");
		}
	}

	function scrollToTop() {
		document.body.scrollTop = 0; // For Safari
		document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
	}

	// Modal functions
	function openModal(modalId) {
		const modal = document.getElementById(modalId);
		modal.classList.add('show');
		document.body.style.overflow = 'hidden'; // Prevent scrolling behind the modal
	}

	function closeModal(modalId) {
		const modal = document.getElementById(modalId);
		modal.classList.remove('show');
		document.body.style.overflow = 'auto'; // Enable scrolling again
	}

	// Close modal when clicking outside
	window.addEventListener('click', function(event) {
		if (event.target.classList.contains('modal')) {
			event.target.classList.remove('show');
			document.body.style.overflow = 'auto';
		}
	});
</script>