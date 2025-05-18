<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<head>
<meta charset="UTF-8">
<title>Chi tiết đề thi</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f5f7fa;
	margin: 40px;
	color: #333;
}

h2 {
	color: #2c3e50;
	font-size: 24px;
	margin-bottom: 10px;
}

p {
	font-size: 16px;
	line-height: 1.6;
}

.paper-container {
	background-color: white;
	padding: 25px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	max-width: 700px;
	margin: auto;
}
</style>
</head>
<body>
	<div class="paper-list">
		<h2>Danh sách Bài Báo đã lưu</h2>
		<c:forEach items="${ListPaper}" var="paper">
			<c:if test="${paper.id == ${paperId}">
				<div class="paper-item">
					<a
						href="${pageContext.request.contextPath}/author/paperDetail?id=${paper.id}">
						${paper.paperName} </a>
				</div>
			</c:if>
		</c:forEach>
	</div>
</body>
</html>