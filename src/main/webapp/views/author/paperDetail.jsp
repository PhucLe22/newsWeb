<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Xem Bài Viết</title>
</head>
<body>
	<c:forEach items="${listPaper}" var="i">
		<c:if test="${i.id == paperId}">
			<p>${i.paperDetail.paperContent}</p>
	</c:if>
	</c:forEach>

</body>
</html>