<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.doptori.entity.Board"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>

	<link rel="stylesheet" href="${cpath}/resources/css/write_form.css">

</head>
<body>
 <script type="text/javascript">
 	function goUpdate() {
		location.href="${cpath}/boardUpdateForm.do?bd_num=${vo.bd_num}";
	}
 	
 	 if($("#bd_type").val() == ""){
 		alert("카테고리를 선택하세요");
 		return false;
 	}
  
 	
 </script>
<div class="container py-4" id="wrap">
	<jsp:include page="/WEB-INF/views/header.jsp"/>
		<main id="main">
			<div class="main-left-container">

				<section class="board-wrap write white pd30">
					<h1 class="command-go-link" data-link="/board/write">글쓰기</h1>
					
					<form class="form-horizontal"  action="${cpath}/boardUpdate.do" method="post" enctype="multipart/form-data">
					<input type="hidden" name="bd_num" value="${vo.bd_num}">
					<div class="division-line"></div>
					
					<ul class="board-write-form">
						
					    <li class="title">
							<div class="write-form-left">
								<span>제목</span>
							</div>
							<div class="write-form-right">
							 <input type="text" name="bd_title" id="bd_title" value="${vo.bd_title}" required>
		     				</div>
						</li>

                        <li class="nickname">
							<div class="write-form-left">
								<span>닉네임</span>
							</div>
							<div class="write-form-right">
							 ${loginMember.mb_nick}
		     					<input type="hidden" class="short" name="bd_mb_num" id="bd_mb_num" value="${loginMember.mb_num}" readonly="readonly"> 
							</div>
						</li>
                        
						<li class="contents">
							<div class="write-form-left">
								<span>내용</span>
							</div>
							<div class="write-form-right">
						      	 <textarea class="ttb-editor" rows="10"  name="bd_cont" rows="10" id="bd_cont"  cols="130" rows="20"  required>${vo.bd_cont}</textarea>
							</div>
						</li>

						<li class="">
							<div class="write-form-left">
								<span>첨부파일</span>
							</div>
							<div class="write-form-right">
						      	<c:if test="${vo.bd_pic ne null}">
									<td align="left"><a href="fileDownload.do?bd_pic=${vo.bd_pic}">${vo.bd_pic}</a></td>
						 		</c:if>
							</div>
						</li>
						
					</ul>

					<div class="button-wrap">
						<button type="submit" id="addBtn" class="logine">수정하기</button>
					    <button type="reset" class="login">초기화</button>
					    <a class="cancel" href="javascript:history.go(-1)" class="login"><button type="button" class="login">취소</button></a>
					</div>
				
				</form>
				
				</section>
			</div>

			<aside class="main-right-container">


		</main>
	</div>

</body>
</html>