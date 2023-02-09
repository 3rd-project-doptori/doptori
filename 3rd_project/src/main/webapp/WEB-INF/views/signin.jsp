<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton">
    <meta name="generator" content="Hugo 0.104.2">
    <title>Signin</title>


    <!-- CSS only -->
    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/checkout/">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    
    <link rel="stylesheet" href="${cpath}/resources/css/login.css">


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <!-- Custom styles for this template -->
    <link href="${cpath}/resources/css/signin.css" rel="stylesheet">
  </head>

  <body class="text-center">
            
        <main class="form-signin w-100 m-auto">
            <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

            <form class="needs-validation" action="${cpath}/Login.do" method="post">

              <div class="col-12 ip">
                <input type="text" class="form-control" id="mb_id" name="mb_id" placeholder="아이디" required>
                <div class="invalid-feedback">
                 아이디를 입력해주세요!
                </div>
              </div>
  
              <div class="col-12">
                <input type="password" class="form-control" id="mb_pw" name="mb_pw" placeholder="비밀번호" required>
                <div class="invalid-feedback">
                  비밀번호를 입력해주세요!
                </div>
              </div>
  
              <div class="checkbox mb-3">
                <label for="checkId">
                  <input type="checkbox" id="checkId" name="checkId" value="remember-me"> <span>Remember me</span>
                </label>
              </div>

              <hr class="my-4">

              <button class="w-100 btn btn-lg" type="submit">Continue to checkout</button>
              <p class="text-base text-[#adadad]">
                Not a member yet?
                <a class="text-primary hover:underline" href="${cpath}/signup.do">Sign Up</a>
              </p>
              <p class="mt-5 mb-3 text-muted">&copy; 2023_VeF</p>
          </form>

        </main>

    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="${cpath}/resources/js/login.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  	<script type="text/javascript">	
		$(document).ready(function(){
			// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
		    var key = getCookie("key");
		    $("#mb_id").val(key); 
		     
		    // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
		    if($("#mb_id").val() != ""){ 
		        $("#checkId").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
		    }
		     
		    $("#checkId").change(function(){ // 체크박스에 변화가 있다면,
		        if($("#checkId").is(":checked")){ // ID 저장하기 체크했을 때,
		            setCookie("key", $("#mb_id").val(), 1); // 1일 동안 쿠키 보관
		        }else{ // ID 저장하기 체크 해제 시,
		            deleteCookie("key");
		        }
		    });
		     
		    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
		    $("#mb_id").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
		        if($("#checkId").is(":checked")){ // ID 저장하기를 체크한 상태라면,
		            setCookie("key", $("#mb_id").val(), 1); // 1일 동안 쿠키 보관
		        }
		    });
	
		// 쿠키 저장하기 
		// setCookie => saveid함수에서 넘겨준 시간이 현재시간과 비교해서 쿠키를 생성하고 지워주는 역할
		function setCookie(cookieName, value, exdays) {
			var exdate = new Date();
			exdate.setDate(exdate.getDate() + exdays);
			var cookieValue = escape(value)
					+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
			document.cookie = cookieName + "=" + cookieValue;
		}
	
		// 쿠키 삭제
		function deleteCookie(cookieName) {
			var expireDate = new Date();
			expireDate.setDate(expireDate.getDate() - 1);
			document.cookie = cookieName + "= " + "; expires="
					+ expireDate.toGMTString();
		}
	     
		// 쿠키 가져오기
		function getCookie(cookieName) {
			cookieName = cookieName + '=';
			var cookieData = document.cookie;
			var start = cookieData.indexOf(cookieName);
			var cookieValue = '';
			if (start != -1) { // 쿠키가 존재하면
				start += cookieName.length;
				var end = cookieData.indexOf(';', start);
				if (end == -1) // 쿠키 값의 마지막 위치 인덱스 번호 설정 
					end = cookieData.length;
	                console.log("end위치  : " + end);
				cookieValue = cookieData.substring(start, end);
			}
			return unescape(cookieValue);
		}
	</script>
  </body>
</html>
