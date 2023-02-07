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
	<div class="container">
		<h2>회원정보 수정</h2>
		<div class="panel panel-default">
			<div class="panel-heading">회원정보 수정</div>
			<div class="panel-body">
				<form class="form-horizontal" id="updateMember" action="${cpath}/userUpdate.do" method="post">
					<!-- 아이디 -->
					<div class="form-group">
						<label class="control-label col-sm-2">아이디 : </label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="mb_id" value="${loginMember.mb_id}" readonly="readonly">
						</div>
					</div>

					<!-- 비밀번호 -->
					<div class="form-group">
						<label class="control-label col-sm-2">비밀번호 : </label>
						<div class="col-sm-10">
							<!--  form-control 한줄 채워줌 -->
							<input type="password" class="form-control" placeholder="비밀번호를 입력하세요."  value="${loginMember.mb_pw}"></input>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">비밀번호 확인 : </label>
						<div class="col-sm-10">
							<!--  form-control 한줄 채워줌 -->
							<input type="password" class="form-control" placeholder="비밀번호를 입력하세요."
							name="mb_pw" value="${loginMember.mb_pw}"></input>
						</div>
					</div>
					
					<!-- 닉네임 -->
					<div class="form-group">
						<label class="control-label col-sm-2">닉네임 : </label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="mb_nick" placeholder="닉네임을 입력하세요."
								value="${loginMember.mb_nick}">
						</div>
					</div>

					<!-- 회원구분-->
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


					<!-- 작성 완료 / 취소 -->
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-info btn-sm">수정</button>
							<button type="reset" class="btn btn-warning btn-sm">취소</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>		
</body>
</html>