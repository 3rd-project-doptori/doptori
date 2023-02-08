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
<div class="container">
  <h2>DCX 분석 서비스 개발자 과정</h2>
  <div class="panel panel-default">
    <div class="panel-heading">게시판</div>
    <div class="panel-body">
		<form class="form-horizontal" action="${cpath}/boardUpdate.do" method="post">
		<input type="hidden" name="bd_num" value="${vo.bd_num}">
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="bd_mb_num">작성자:</label>
			    <div class="col-sm-10">
			       ${vo.bd_mb_num}
			      </div>
			  </div>
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="bd_title">제목:</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="bd_title" id="bd_title" value="${vo.bd_title}">
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="bd_cont">내용:</label>
			    <div class="col-sm-10">
			      <textarea class="form-control" name="bd_cont" rows="10" id="bd_cont">${vo.bd_cont}</textarea>
			    </div>
			  </div>
			  <div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
			      <button type="submit" class="btn btn-default">수정</button>
			    </div>
			  </div>
			</form>
	</div>
    <div class="panel-footer"></div>
  </div>
</div>

</body>
</html>