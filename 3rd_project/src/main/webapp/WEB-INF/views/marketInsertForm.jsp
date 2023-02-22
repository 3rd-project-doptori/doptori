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
  <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
    <meta name="generator" content="Hugo 0.104.2">

    <script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  
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
					<h1 class="command-go-link" data-link="/board/write">직거래 등록</h1>
					
					<form class="form-horizontal" action="${cpath}/boardInsert.do" method="post" enctype="multipart/form-data" name="market">

					<div class="division-line"></div>
					
					<ul class="board-write-form">
					
						<li class="">
							<div class="write-form-left">
								<span>카테고리</span>
							</div>
							<div class="write-form-right">
								<select name="bd_type" id="bd_type">
				                    <!-- <option value="">선택하기</option> -->
					                <option value=3>직거래</option>
				                </select>
							</div>
						</li>
						
					    <li class="title">
							<div class="write-form-left">
								<span>제목</span>
							</div>
							<div class="write-form-right">
		     					<input type="text"name="bd_title" id="bd_title" placeholder="제목을 입력하세요." required>
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
								<span>상품명</span>
							</div>
							<div class="write-form-right">
								<input type="text" id="cp_name">				
							</div>
						</li>
						<li class="contents">
							<div class="write-form-left">
								<span>중량(kg)</span>
							</div>
							<div class="write-form-right">
								<input type="text" id="weight">				
							</div>
						</li>
						<li class="contents">
							<div class="write-form-left">
								<span>가격(원)</span>
							</div>
							<div class="write-form-right">
								<input type="text" id="price">				
							</div>
						</li>
						<li class="contents">
							<div class="write-form-left">
								<span>상품 상세 정보</span>
							</div>
							<div class="write-form-right">
								<input type="text" id="memo">				
							</div>
						</li>
						<li class="contents">
							<div class="write-form-left">
								<span>내용</span>
							</div>
							<div class="write-form-right">
						      	<textarea class="ttb-editor" rows="10" id="content" cols="130" rows="20"  placeholder="내용을 입력하세요." required></textarea>
							</div>
						</li>

						<li class="">
							<div class="write-form-left">
								<span>첨부파일</span>
							</div>
							<div class="write-form-right">
						      	<input type="file" name="uploadFile"  multiple="multiple" onchange="previewImage(this)"/>
						      	<!-- <input type="file" name="uploadFile" multiple="multiple"/> -->
							</div>
						</li>
						<!-- 첨부파일 이미지 미리보기 -->
						<li class="">
							<div class="write-form-left">
							</div>
							<div class="write-form-right">
								<img id="preview">
							</div>
						</li>
						
					</ul>

					<div class="button-wrap">
						<button onclick="trans_info_and_submit()" id="addBtn" class="logine">등록</button>
					    <button type="reset" class="login">초기화</button>
					    <a class="cancel" href="javascript:history.go(-1)" class="login"><button type="button" class="login">취소</button></a>
					</div>
				
				</form>
				
				</section>
			</div>

			<aside class="main-right-container">


		</main>
	</div>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
	  function previewImage(input) {
	    var file = input.files[0];
	    var img = document.getElementById("preview");
	    if (file.type.match('image.*')) {
	      var reader = new FileReader();
	      reader.onload = (function(img) {
	        return function(e) {
	          img.src = e.target.result;
	        };
	      })(img);
	      reader.readAsDataURL(file);
	    }
	  }
	  
	  function trans_info_and_submit(){
		  var form = document.market;
		  var input   = document.createElement('input');
		  input.type   = 'hidden';
		  input.name  = 'bd_cont';
		  input.value  = $("#cp_name").val()+"|"+$("#weight").val()+"|"+$("#price").val()+"|"+$("#memo").val()+"|"+$("#content").val();
		  form.appendChild(input);
		  
		  var element = document.getElementById("cp_name");
		  element.parentNode.removeChild(element);
		  
		  var element = document.getElementById("weight");
		  element.parentNode.removeChild(element);
		  
		  var element = document.getElementById("price");
		  element.parentNode.removeChild(element);
		  
		  var element = document.getElementById("memo");
		  element.parentNode.removeChild(element);
		  
		  var element = document.getElementById("content");
		  element.parentNode.removeChild(element);
		  
		  form.submit();
	  }
	  
	</script>
</body>
</html>