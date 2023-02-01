<%@page import="com.doptori.entity.Farm"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
</head>
<body>

<script type="text/javascript">
	function MakeFarm(){
		location.href = "${cpath}/MakeFarm.do"
	}
</script>

<div class="container">
  <h2>DCX분석서비스 개발자과정</h2>
  <div class="panel panel-default">
    <div class="panel-heading">게시판</div>
    <div class="panel-body">
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<td>농장 이름</td>
					<td>동,개 이름</td>
					<td>재배 작물</td>
					<td>면적</td>
					<td>주소</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="vo">
					<c:choose>
						<c:when test="${loginMember.mb_id} == vo.fm_mb_num">
							<tr>
								<td>${vo.fm_name}</td>
								<td>${vo.fm_dong}</td>
								<td>${vo.fm_crop}</td>
								<td>${vo.fm_size}</td>
								<td>${vo.fm_ad_num}</td>
							</tr>
						</c:when>
					</c:choose>
				</c:forEach>
					<tr>
						<td colspan="5"><button class="btn btn-sm btn-success" onclick="MakeFarm()">농장 만들기</button></td>
					</tr>
			</tbody>
		</table>
	</div>
    <div class="panel-footer">지금 많이 배고픈 신경수😊</div>
  </div>
</div>

</body>
</html>
