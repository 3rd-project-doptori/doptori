<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="${cpath}/resources/css/index.css"> 
</head>
<body>
 <script type="text/javascript">
 	function goUpdate() {
		location.href="${cpath}/boardUpdateForm.do?bd_num=${vo.bd_num}";
	}
 </script>
<div class="container">
  <h2>게시판 상세보기</h2>
  <div class="panel panel-default">
    <div class="panel-heading">게시판</div>
    <div class="panel-body">
		<table class="table table-bordered table-hover">
			 <tr> 
			 	<td>제목</td>
			 	<td>${vo.bd_title}</td>
			 </tr>	
			 <tr>
			 	<td>내용</td>
			 	<% pageContext.setAttribute("newline", "\n"); %>
			 	<td>${fn:replace(vo.bd_cont, newline, "<br>")}</td>
			 </tr>
			 <tr>
			 	<td>작성자</td>
			 	<td>${vo.bd_mb_num}</td>
			 </tr>
			 <tr>
			 	<td>작성일자</td>
			 	<td>${fn:split(vo.bd_date, " ")[0]}</td>
			 </tr>
			 <tr>	
			 	<td>작성일시</td>
			 	<td>${fn:split(vo.bd_date, " ")[1]}</td>
			 </tr>
			 <tr>
			 	<td colspan="2">
			 		<button class="btn btn-sm btn-success" onclick="goUpdate()">수정</button>
			 		<a class="btn btn-sm btn-warning" href="<c:url value='/boardDelete.do/${vo.bd_num}' />">삭제</a>
			 		<a class="btn btn-sm btn-info" href="<c:url value='/boardList.do' />">목록으로 돌아가기</a>
			 	</td>
			 </tr>
		</table>
	</div>
    <div class="panel-footer">${vo.bd_mb_num}</div>
  </div>
</div>

</body>
</html>