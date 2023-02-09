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
  <h2>게시판 글쓰기</h2>
  <div class="panel panel-default">
    <div class="panel-heading">게시판</div>
    <div class="panel-body">
    	<form class="form-horizontal" action="${cpath}/boardInsert.do" method="post">
		  
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="bd_type">카테고리:</label>
		    <div class="col-sm-10">
		      <select name="bd_type">
                    <option value="choose">선택하기</option>
                    <c:if test="${loginMember.mb_id=='admin'}">
                    	<option value=1>공지사랑</option>
                    </c:if>
	                <option value=2>커뮤니티</option>
	                <option value=3>장터</option>
                </select>
		    </div>
		</div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="bd_mb_num">작성자</label>
		    <div class="col-sm-10">
			       ${loginMember.mb_nick}
		      <input type="hidden" class="form-control" name="bd_mb_num" id="bd_mb_num" value="${loginMember.mb_num}" readonly="readonly"> 
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="bd_title">제목</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="bd_title" id="bd_title" placeholder="제목을 입력하세요.">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="bd_cont">내용</label>
		    <div class="col-sm-10">
		      <textarea class="form-control" rows="10" name="bd_cont" id="bd_cont" placeholder="내용을 입력하세요."></textarea>
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <button type="submit" class="btn btn-default">등록</button>
		      <button type="reset" class="btn btn-default">취소</button>
		    </div>
		  </div>
		</form>
    </div>
    <div class="panel-footer"></div>
  </div>
</div>

</body>
</html>