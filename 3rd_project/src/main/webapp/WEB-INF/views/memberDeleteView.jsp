<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "${cpath}/Main.do";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#mb_pw").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#mb_pw").focus();
					return false;
				}	
			});
			
				
			
		})
	</script>
</head>
<body>
	<section id="container">
			<form action="${cpath}/memberDelete.do" method="post">
				<div class="form-group has-feedback">
					<label class="control-label" for="mb_id">아이디</label>
					<input class="form-control" type="text" id="mb_id" name="mb_id" value="${loginMember.mb_id}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userPass">비밀번호</label>
					<input class="form-control" type="password" id="mb_pw" name="mb_pw" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userName">성명</label>
					<input class="form-control" type="text" id="mb_nick" name="mb_nick" value="${loginMember.mb_nick}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">회원탈퇴</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
			</form>
			<div>
				<c:if test="${msg == false}">
					비밀번호가 맞지 않습니다.
				</c:if>
			</div>
		</section>
		
</body>
</html>