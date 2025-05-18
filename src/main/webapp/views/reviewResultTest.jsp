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
     <h1>Result</h1>
     <p>Responses from Customers: ${response}</p>
     <p>Reviews from Customers: ${review}</p>
     <p>Course ID: ${courseID}</p>
     
     <form action="${pageContext.request.contextPath}/user/review" method="get">
     <span>
     <button>Return</button>
     </span>
     </form>
     
</body>
</html>