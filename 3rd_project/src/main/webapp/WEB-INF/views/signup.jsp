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


    
    <!-- Custom styles for this template -->
    <link href="${cpath}/resources/css/signin.css" rel="stylesheet">
  </head>

  <body class="text-center">
 
        <main class="form-signin w-100 m-auto">
            <h1 class="h3 mb-3 fw-normal">Please sign up</h1>

            <form class="needs-validation" action="${cpath}/signup.do" method="post">

              <div class="col-12 ip">
                <input type="id" class="form-control" id="mb_id" name="mb_id" placeholder="아이디" required>
                <div class="invalid-feedback">
                 아이디를 입력해주세요!
                </div>
              </div>
  
              <div class="col-12 ip">
                <input type="password" class="form-control" id="mb_pw" name="mb_pw" placeholder="비밀번호" required>
                <div class="invalid-feedback">
                  비밀번호를 입력해주세요!
                </div>
              </div>

              <div class="col-12 ip">
                <input type="nickname" class="form-control" id="mb_nick" name="mb_nick" placeholder="닉네임" required>
                <div class="invalid-feedback">
                  닉네임을 입력해주세요!
                </div>
              </div>
              
              <div class="col-12">
                <div class="form-check-inline">
                  <input id="mb_type" name="mb_type" type="radio" class="form-check-input" value="1" checked required>
                  <label class="form-check-label" for="credit">영농인</label>
                </div>
                <div class="form-check-inline">
                  <input id="mb_type" name="mb_type" type="radio" class="form-check-input" value="2" required>
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
  </body>
</html>
