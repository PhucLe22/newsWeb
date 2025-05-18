<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--     <link rel="stylesheet" href="/utedemyProject/views/Css/searchPaper.css">
 -->
<title>VNExpress - Kết quả tìm kiếm</title>
<style>
/* Thêm các style cần thiết tại đây */
.navbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 1rem;
	background-color: #fff;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.paper-card {
	display: flex;
	margin: 1rem 0;
	padding: 1rem;
	border: 1px solid #ddd;
	border-radius: 8px;
}

.hidden {
	display: none;
}

.price-container {
	display: flex;
	flex-direction: column;
	align-items: flex-end;
	min-width: 150px;
}
</style>
</head>
<body>
	<!-- Navbar -->
	<div class="navbar">
		<div class="logo">
			<div class="category-btn">DANH MỤC</div>
		</div>

		<%-- 		<div class="search-box">
			<form action="${pageContext.request.contextPath}/user/search"
				method="post">
				<input type="text" name="keyword" placeholder="Tìm kiếm..."
					value="${keyWord}">
				<button type="submit">🔍</button>
			</form>
		</div> --%>

		<div class="nav-links">
			<a href="#" class="nav-btn login-btn">Doanh nghiệp</a> <a href="#"
				class="nav-btn login-btn">Hội viên</a>
			<button class="nav-btn cta-btn">→ Vào học</button>
			<button class="icon-btn">❤️</button>
			<a href="/utedemyProject/user/cart" class="icon-btn">🛒</a> <a
				href="/utedemyProject/user/profile" class="icon-btn">👤</a>
		</div>
	</div>

	<!-- Main Content -->
	<div class="container">
		<div class="search-header">
			<h1>${searchAmount}kết quả cho "${keyWord}"</h1>

			<div class="filter-container">
				<button class="filter-btn">
					<span>Bộ lọc</span>
				</button>

				<div class="sort-dropdown">
					<button class="sort-btn" onclick="toggleDropdown()">
						<span>Sắp xếp theo</span> <span>▼</span>
					</button>
					<div id="dropdown-menu" class="dropdown-content hidden">
						<a href="?sort=popular">Học nhiều nhất</a> <a href="?sort=newest">Mới
							nhất</a> <a href="?sort=price_asc">Giá thấp nhất</a> <a
							href="?sort=price_desc">Giá cao nhất</a>
					</div>
				</div>
			</div>
		</div>

		<div class="content-wrapper">
			<!-- Sidebar Filters -->
			<div class="sidebar">
				<div class="filter-section">
					<h3 class="filter-title">Đánh giá</h3>
					<div class="rating-filter">
						<form id="ratingForm">
							<label class="rating-item"> <input type="radio"
								name="rating" value="4.5"> <span class="star-rating">★
									★ ★ ★ ★</span> <span>Từ 4.5 trở lên</span>
							</label> <label class="rating-item"> <input type="radio"
								name="rating" value="4.0"> <span class="star-rating">★
									★ ★ ★ ☆</span> <span>Từ 4.0 trở lên</span>
							</label> <label class="rating-item"> <input type="radio"
								name="rating" value="3.5"> <span class="star-rating">★
									★ ★ ☆ ☆</span> <span>Từ 3.5 trở lên</span>
							</label> <label class="rating-item"> <input type="radio"
								name="rating" value="3.0"> <span class="star-rating">★
									★ ★ ☆ ☆</span> <span>Từ 3.0 trở lên</span>
							</label>
						</form>
					</div>
				</div>

				<div class="filter-section">
					<h3 class="filter-title">Thời lượng video</h3>
					<div class="duration-filter">
						<form id="durationForm">
							<label class="duration-item"> <input type="checkbox"
								name="duration" value="0-1"> <span>0 đến 1 giờ</span>
							</label> <label class="duration-item"> <input type="checkbox"
								name="duration" value="1-3"> <span>1 đến 3 giờ</span>
							</label> <label class="duration-item"> <input type="checkbox"
								name="duration" value="3-6"> <span>3 đến 6 giờ</span>
							</label> <label class="duration-item"> <input type="checkbox"
								name="duration" value="6-17"> <span>6 đến 17 giờ</span>
							</label>
						</form>
					</div>
				</div>
			</div>

			<%-- <!-- paper List -->
			<div class="paper-list">
				<c:forEach var="paper" items="$PaperList}">
					<div class="paper-card">
						<img
							src="${not empty paper.image ? paper.image : '/utedemyProject/views/Images/default-paper.png'}"
							alt="${paper.paperName}" class="paper-image"
							style="width: 240px; height: 150px;">
						<div class="paper-details">
							<div>
								<h3 class="paper-title">${paper.paperName}</h3>
								<p class="instructor">${paper.instructorName}</p>
								<div class="rating">
									<span>${paper.rating}</span>
									<div class="rating-stars">
										<c:forEach begin="1" end="5" var="i">
											<c:choose>
												<c:when test="${i <= paper.rating}">★</c:when>
												<c:otherwise>☆</c:otherwise>
											</c:choose>
										</c:forEach>
									</div>
									<span class="rating-count">(${paper.rates})</span>
								</div>
							</div>
						</div>
						<div class="price-container">
							<span class="price"> <fmt:formatNumber
									value="${paper.paperPrice}" type="currency" currencyCode="VND" />
							</span>
							<c:if test="${paper.originalPrice > paper.paperPrice}">
								<span class="original-price"> <fmt:formatNumber
										value="${paper.originalPrice}" type="currency"
										currencyCode="VND" />
								</span>
							</c:if>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		Hello
		<c:choose>
			<c:when test="${not empty PaperList}">
				<c:forEach items="${PaperList}" var="c">
					<p>${c.paperName}</p>
					<p>id: ${c.id}</p>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<p>Không tìm thấy kết quả nào phù hợp với từ khóa "${keyWord}".</p>
			</c:otherwise>
		</c:choose>

	</div> --%>
	<c:forEach var="paper" items="${PaperList}">
	<p>${paper.paperName}<p>
	</c:forEach>

	<script>
        function toggleDropdown() {
            const dropdown = document.getElementById("dropdown-menu");
            dropdown.classList.toggle("hidden");
        }

        // Đóng dropdown khi click bên ngoài
        window.onclick = function(event) {
            if (!event.target.matches('.sort-btn')) {
                const dropdowns = document.getElementsByClassName("dropdown-content");
                for (let i = 0; i < dropdowns.length; i++) {
                    const openDropdown = dropdowns[i];
                    if (!openDropdown.classList.contains('hidden')) {
                        openDropdown.classList.add('hidden');
                    }
                }
            }
        }

        // Xử lý filter
        document.querySelectorAll('input[type="radio"], input[type="checkbox"]').forEach(input => {
            input.addEventListener('change', () => {
                const formData = new FormData(document.querySelector('form'));
                const params = new URLSearchParams(formData);
                window.location.search = params.toString();
            });
        });
    </script>
</body>
</html>