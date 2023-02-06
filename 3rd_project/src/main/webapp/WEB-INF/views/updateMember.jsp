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
<<<<<<< HEAD
	<div class="container">
		<h2>회원정보 수정</h2>
		<div class="panel panel-default">
			<div class="panel-heading">Update FORM</div>
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
<<<<<<< HEAD
							<input type="password" class="form-control" value="${loginMember.mb_pw}"></input>
=======
							<input type="password" class="form-control" placeholder="비밀번호" 
							name="mb_pw" vlaue="${loginMember.mb_pw}"></input>
>>>>>>> branch 'master' of https://github.com/3rd-project-doptori/doptori.git
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">비밀번호 확인 : </label>
						<div class="col-sm-10">
							<!--  form-control 한줄 채워줌 -->
<<<<<<< HEAD
							<input type="password" class="form-control" 
							name="mb_pw" value="${loginMember.mb_pw}"></input>
=======
							<input type="password" class="form-control" placeholder="비밀번호 확인"
							name="mb_pw" vlaue="${loginMember.mb_pw}"></input>
>>>>>>> branch 'master' of https://github.com/3rd-project-doptori/doptori.git
						</div>
					</div>
					
					<!-- 닉네임 -->
					<div class="form-group">
						<label class="control-label col-sm-2">닉네임 : </label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="mb_nick" placeholder="닉네임 입력"
								value="${loginMember.mb_nick}">
						</div>
					</div>

					<!-- 전화번호-->
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
							<button type="reset" class="brn btn-warning btn-sm">취소</button>
						</div>
					</div>
				</form>
			</div>
<<<<<<< HEAD
=======
			<div class="panel-body"></div>
=======
	<div class="panel-body">
		<h2>회원정보 수정</h2>
		<form class="form-horizontal" id="updateMember" action="${cpath}/updateMember.do" method="post">
		<div class="form-group">
		    <label class="control-label col-sm-2">비밀번호:</label>
		    <div class="col-sm-10">
		      <input type="password" class="form-control" placeholder="비밀번호">
		    </div>
>>>>>>> branch 'master' of https://github.com/3rd-project-doptori/doptori.git
		</div>
<<<<<<< HEAD
=======
		<div class="form-group">
		    <label class="control-label col-sm-2" for="mb_pw">비밀번호 확인:</label>
		    <div class="col-sm-10">
		      <input type="password" class="form-control" name="mb_pw" id="mb_pw" placeholder="비밀번호 확인">
		    </div>
		</div>
		<div class="form-group">
		    <label class="control-label col-sm-2" for="mb_nick">닉네임:</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="mb_nick" id="mb_nick" value="${loginMember.mb_nick}" placeholder="닉네임 입력">
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
>>>>>>> branch 'master' of https://github.com/3rd-project-doptori/doptori.git
	</div>	
>>>>>>> branch 'master' of https://github.com/3rd-project-doptori/doptori.git
</body>
</html>