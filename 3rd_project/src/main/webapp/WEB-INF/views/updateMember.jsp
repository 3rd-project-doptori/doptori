<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="${cpath}/resources/css/index.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
</head>
<body>
	<div class="panel-body">
		<form class="form-horizontal" id="userUpdate" action="${cpath}/userUpdate.do" method="post">
		<input type="hidden" class="form-control" name="mb_id" id="mb_id" value="${mvo.mb_id}">
		<div class="form-group">
		    <label class="control-label col-sm-2">비밀번호:</label>
		    <div class="col-sm-10">
		      <input type="password" class="form-control" placeholder="비밀번호를 입력하세요.">
		    </div>
		</div>
		<div class="form-group">
		    <label class="control-label col-sm-2" for="mb_pw">비밀번호 확인:</label>
		    <div class="col-sm-10">
		      <input type="password" class="form-control" name="mb_pw" id="mb_pw" placeholder="비밀번호를 입력하세요.">
		    </div>
		</div>
		<div class="form-group">
		    <label class="control-label col-sm-2" for="mb_nick">닉네임:</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="mb_nick" id="mb_nick" value="${loginMember.mb_nick}" placeholder="">
		    </div>
		</div>
		<div class="form-group">
		    <label class="control-label col-sm-2" for="mb_type">회원 선택:</label>
		    <div class="col-sm-10">
		      <select name="mb_type">
                    <option value="choose">회원 선택</option>
                    <option value=1>농업인</option>
	                <option value=2>일반인</option>
                </select>
		    </div>
		</div>
		<div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <button type="submit" class="btn btn-success">수정하기</button>
		      <button type="reset" class="btn btn-danger" id="reset">지우기</button>
		    </div>
		  </div>
		</form>
	</div>	
</body>
</html>