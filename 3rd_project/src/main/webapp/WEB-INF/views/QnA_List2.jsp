<%@ page import="java.util.List"%>
<%@ page import="com.doptori.entity.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>notice_qa</title>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
  <link rel="stylesheet" href="${cpath}/resources/css/notice_qa.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <!-- CSS only -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <style>
      .login{
      background-color: #FF809F;
      border: none;
      color: white;
      margin-left: 1rem;
      }

      .login:hover{
          background-color: #FF4D79;
          color: white;
      }
  </style>
  <script type="text/javascript">

	  	function goForm() {
	  		location.href="${cpath}/boardInsertForm.do"
	  	}
  </script>
</head>
<body>
  <div class="container py-4 folder">
    <jsp:include page="/WEB-INF/views/header.jsp"/>
    <div class="tabs">
      <button class="tab active" onclick="openTab(event, 'tab-1')">
        <div><span>Q&A</span></div>
      </button>
      <button class="tab" onclick="openTab(event, 'tab-2')">
        <div><span>공지사항</span></div>
      </button>
    </div>
    <div class="content">
      <div class="content__inner" id="tab-1">
        <div class="table-responsive">
          <table class="table">
              <thead>
                  <tr>
                  <th scope="col">번호</th>
                  <th scope="col">제목</th>
                  <th scope="col">작성자</th>
                  <th scope="col">작성일</th>

                  </tr>
              </thead>
              <tbody class="table-group-divider">
                  <c:forEach items="${qnalist}" var="vo">
                  <c:set var="cnt" value="${cnt+1}" />
                  <tr>
                  <th scope="row">${cnt}</th>
                  <td>${vo.bd_mb_num}</td>
                  <td>${vo.bd_title}</td>
                  <td>${vo.bd_date}</td>
                  </tr>
                  </c:forEach>
              </tbody>
          </table>
        </div>
      </div>

      <div class="content__inner" id="tab-2">
        <div class="table-responsive">
          <table class="table">
              <thead>
                  <tr>
                  <th scope="col">#</th>
                  <th scope="col">second</th>
                  <th scope="col">second</th>
                  <th scope="col">second</th>
                  </tr>
              </thead>
              <tbody class="table-group-divider">
                  <tr>
                  <th scope="row">1</th>
                  <td>Mark</td>
                  <td>Mark</td>
                  <td>Mark</td>
                  </tr>
              </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
  <!-- partial -->
  <script  src="${cpath}/resources/js/notice_qa.js"></script>

</body>
</html>
