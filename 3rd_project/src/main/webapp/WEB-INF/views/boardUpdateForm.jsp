<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Bootstrap Example</title>
</head>
<body>
	<div class="container">
  <h2>마이페이지 수정하기</h2>
  <div class="panel panel-default">
    <div class="panel-heading">마이페이지 수정하기</div>
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