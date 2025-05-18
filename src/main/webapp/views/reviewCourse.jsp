<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
     <h1>Guitar</h1>
     <p>Guitar course gives you an wonderful experiences!</p>
     <p>Please leave some reviews and responses to our course. Thank You!</p>
     <!--Review Form-->
     <h1>Content</h1> 
     <form action="${pageContext.request.contextPath}/user/review" method="post">
     <input type="text" name="content" />
     <h1>Rate</h1>
     <input type="text" name="rate" min="1" max="5" required />
     <h1>Course ID</h1>
     <input type="text" name="courseId"/>
     <button>Gửi</button>
     </form>
</body>
</html>