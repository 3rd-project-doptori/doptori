<!-- 톰캣이 실행되면 자동으로 인식하는 첫 웰컴페이지 index...
	톰캣 Servers - web.xml 제일 하단에 welcome-file
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// response.sendRedirect("boardList.do");
	// jstl 몰랐을때 사용했던 방법!!
%>

<c:redirect url="Main.do" />



</body>
</html>