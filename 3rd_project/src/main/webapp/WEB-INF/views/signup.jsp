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
    <title>signup</title>


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
            <h1 class="h3 mb-3 fw-normal">Please sign up</h1>

            <form class="needs-validation" action="${cpath}/signup.do" method="post">

              <div class="col-12 ip">
              <label class="control-label col-sm-2" for="mb_id"></label>
                <input type="text" class="form-control" id="mb_id" name="mb_id" placeholder="아이디를 입력하세요">
                <div class="invalid-feedback">
                 아이디를 입력해주세요!
                </div>
                <div><font id="id_feedback" size="2"></font></div>
              </div>
  
              <div class="col-12 ip">
              <label class="control-label col-sm-2" for="mb_pw"></label>
                <input type="password" class="form-control" id="mb_pw" name="mb_pw" placeholder="비밀번호를 입력하세요">
                <div class="invalid-feedback">
                  비밀번호를 입력해주세요!
                </div>
              </div>

			<div class="col-12 ip">
                <input type="password" class="form-control" id="mb_pw" placeholder="비밀번호 한 번 더 입력하세요">
                <div class="invalid-feedback">
                  비밀번호를 다시 한번 더 입력해주세요!
                </div>
              </div>							
					
              <div class="col-12 ip">
              <label class="control-label col-sm-2" for="mb_nick"></label>
                <input type="text" class="form-control" id="mb_nick" name="mb_nick" placeholder="닉네임을 입력하세요">
                <div class="invalid-feedback">
                  닉네임을 입력해주세요!
                </div>
              </div>
              
              <div class="col-12">
              <label class="control-label col-sm-2" for="mb_type"></label>
                <div class="form-check-inline">
                  <input name="mb_type" type="radio" class="form-check-input" value="1" checked>
                  <label class="form-check-label" for="credit">영농인</label>
                </div>
                <div class="form-check-inline">
                  <input name="mb_type" type="radio" class="form-check-input" value="2">
                  <label class="form-check-label" for="debit">일반인</label>
                </div>
              </div>
              <div class="invalid-feedback">
                선택해주세요!
              </div>

              <hr class="my-4">

              <button class="w-100 btn btn-lg" type="submit">Continue to checkout</button>
          </form>

              <p class="text-base text-[#adadad]">
                Already have an account?
                <a href="${cpath}/signin.do" class="text-primary hover:underline">
                  Sign In
                </a>
              </p>
              <p class="mt-5 mb-3 text-muted">&copy; 2023_VeF</p>

        </main>


    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="${cpath}/resources/js/login.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script type="text/javascript">
    $('#mb_id').keyup(function(){
		let mb_id = $('#mb_id').val();
			
		$.ajax({
			url : "${cpath}/mbidCheck.do",
			type : "post",
			data : {mb_id: mb_id},
			dataType : 'json',
			success : function(result){
				if(result == 1){
					$("#id_feedback").html('이미 사용중인 아이디입니다.');
					$("#id_feedback").attr('color','#dc3545');
				} else{
					$("#id_feedback").html('사용할 수 있는 아이디입니다.');
					$("#id_feedback").attr('color','#2fb380');
				} 
			},
			error : function(){
				alert("서버요청실패");
			}
		})
			 
	})
    </script>
  </body>
</html>
