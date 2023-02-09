<%@ page import="java.util.List"%>
<%@ page import="com.doptori.entity.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	  	function goForm() {
	  		location.href="${cpath}/boardInsertForm.do"
	  		
	  	}
  </script>
<div class="container">
  <h2>게시판 목록보기</h2>
  <div class="panel panel-default">
    <div class="panel-heading">게시판</div>
    <div class="panel-body">
    	<table class="table table-bordered table-hover">
	    	<thead>
		    	 <tr>
		    	 	<td>번호</td>
		    	 	<td>제목</td>
		    	 	<td>작성자</td>
		    	 	<td>작성일</td>
		    	 	<td>조회수</td>
		    	 </tr>
	    	</thead>
	    	<tbody>
	    		<c:forEach var="vo" items="${list}" varStatus="status">
	    			<tr>
						<td>${vo.bd_num}</td>						
						<c:if test="${vo.bd_level > 0}">
							<c:forEach begin="1" end="${vp.bd_level }">
								<span style="padding-left: 10px"></span>
							</c:forEach>
						</c:if>
						<c:url var="contentlink" value="/boardContent.do/${vo.bd_num}" />		
						<td>
						<c:if test="${vo.bd_level > 0}">
							<c:forEach begin="1" end="${vo.bd_level }">
								<span style="padding-left: 10px"></span>
							</c:forEach>
						</c:if>
						<a href="${contentlink}">${vo.bd_title}</a>
						</td>
						<td>${memberNames[status.index]}</td>     			
						<td>${vo.bd_date}</td>  			
						<td>${vo.bd_cnt}</td>     			
	    			</tr>
	    		</c:forEach>
	    		<tr>
	    			<td colspan="5"><button class="btn btn-sm btn-success" onclick="goForm()">글쓰기</button></td>
	    		</tr>
	    	</tbody>
    	</table>
    </div>
    <div class="panel-footer"></div>
  </div>
</div>

</body>
</html>