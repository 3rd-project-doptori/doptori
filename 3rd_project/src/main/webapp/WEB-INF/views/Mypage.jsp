<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="${cpath}/resources/css/index.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
	function goUpdate(){
		location.href="${cpath}/boardUpdateForm.do?idx=${vo.idx}";
	}
</script>
</head>
<body>
	<div class="container">
  <h2>마이페이지 테스트</h2>
  <div class="panel panel-default">
    <div class="panel-heading">마이페이지</div>
    <div class="panel-body">
		<table class="table table-hover table-striped">
			<tr>
				<td>사진</td>
				<td>${loginMember.mb_pic}
				<span><img src="resources/images/default2.png"></span>
				</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>${loginMember.mb_id}</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>${loginMember.mb_pw}</td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td>${loginMember.mb_nick}</td>
			</tr>
			<tr>
				<td colspan="2">
					<button class="btn btn-sm btn-success" onclick="goUpdate()">수정</button>
					<a class="btn btn-sm btn-info" href="<c:url value='/basic.do'/>">메인페이지로 돌아가기</a>
				</td>
			</tr>
		</table>
	</div>
    <div class="panel-footer">지금 많이 배고픈 신경수😊</div>
  </div>
</div>
</body>
</html>