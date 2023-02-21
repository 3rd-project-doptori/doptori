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

  function signin(){
      location.href = "${cpath}/signin.do"
   }
  
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
          
          <caption> <h3 align="right"> <font size="2">
          <div id="left" style="float:left;"> <!-- select 검색 창  -->
              <form method="post" action="${cpath}/QnA_List.do" onsubmit="return check(this)">
               <select name="searchType" id="searchType">
                 <option value="0">선 택</option>
                 <option value="bd_title">제 목</option>
                 <option value="bd_cont">내 용</option>
                 <option value="bd_mb_num">작성자</option>
               </select>
               <input type="text" id="searchText" placeholder="검색어를 입력하세요." autocomplete="off" name="sword" size="20" value="${sword}">
               <input type="submit" value="검색">
              </form>
              
          </div>
          
         <div id="right" style="float:right;"><font size="2">          
               <select onchange="move(this)" id="pcnt">
               <option value="10"> 10개 </option>
               <option value="20"> 20개 </option>
               <option value="30"> 30개 </option>
               <option value="50"> 50개 </option>
             </select>
             </font>
           </div>
        
          </h3></caption>
          
              <thead>
                  <tr>
                  <th scope="col">번호</th>
                  <th scope="col">작성자</th>
                  <th scope="col">제목</th>
                  <th scope="col">작성일</th>

                  </tr>
              </thead>
              <tbody class="table-group-divider">
                  <c:forEach items="${qnalist}" var="vo">
                  <c:set var="cnt" value="${cnt+1}" />
                  <c:url var="contentlink" value="/boardContent.do/${vo.bd_num}" />
                  <tr>
                  <th scope="row">${cnt}</th>
                  <td>${vo.mb_nick}</td>
                  <td><a href="${contentlink}">${vo.bd_title}</a></td>
                  <td>${vo.bd_date}</td>
                  </tr>
                  </c:forEach>
              </tbody>
              <tfoot>
             <!-- 페이징 -->
             <tr>
                <td colspan="5" align="center">
                 <!-- 10페이지 단위로 이전 이동하기  :  -->
                <c:if test="${pstart != 1}"> <!-- 첫번재 그룹이 아닐때는  -->
                    <a href="QnA_List.do?page=${pstart-1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}"> << </a>
                </c:if>
                <c:if test="${pstart == 1}"> <!-- 첫번째 그룹일때(1~10)는 이전 10페이지 이동 X -->
                《<!-- 넘어가는 꺽세 -->
                </c:if>
                
                 <!-- 1페이지 단위로 이전으로 가기 => 현재페이지에서 1을 뺀 페이지로 이동 --> 
                <c:if test="${page != 1}"> <!-- 현재 페이지가 1이 아닌경우 -->
                    <a href="QnA_List.do?page=${page-1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}"> ◀  </a>
                </c:if>
                <c:if test="${page == 1}"> <!-- 현재페이지가 1인경우 -->
                              ◀
                </c:if>
                
                  <c:forEach begin="${pstart}" end="${pend}" var="i">  <!-- 페이지 출력하기 -->
                    <!-- 현재 페이지의 색을 빨강 -->
                     <c:if test="${page == i}"> <!-- 출력되는 페이지가 현재페이지와 같다면 -->
                        <c:set var="st" value="style='color:darkblue;'"/>
                     </c:if>
                     <c:if test="${page != i}"> <!-- 출력되는 페이지가 현재페이지와 다르다면 -->
                        <c:set var="st" value=""/>
                     </c:if>
                     <a href="QnA_List.do?page=${i}&pcnt=${pcnt}&sel=${sel}&sword=${sword}" ${st}> ${i} </a>
                  </c:forEach>
                  
                <!-- 1페이지 단위로 다음 이동하기 -->
                <c:if test="${page != chong}"> <!-- 현재 페이지가 마지막 페이지가 아니라면 -->
                    <a href="QnA_List.do?page=${page+1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}"> ▶  </a>
                </c:if>
                <c:if test="${page == chong}"> <!-- 현재 페이지가 마지막 페이지라면 -->
                              ▶
                </c:if>
                 
                <!-- 10페이지 단위로 다음 이동하기 -->
                <c:if test="${chong != pend}"> <!-- 현재 출력되는 페이지 그룹이 마지막이 아닐겨우 -->
                     <a href="QnA_List.do?page=${pend+1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}"> >> </a>
                </c:if>
                <c:if test="${chong == pend}"> <!-- 현재 출력되는 페이지 그룹이 마지막일 경우 -->
                   》 <!-- 넘어가는 꺽세 -->
                </c:if>
                </td>
              </tr>

             <tr>
                <td colspan="5"><button onclick="goForm()">글쓰기</button></td>
             </tr>
          </tfoot>
          </table>
        </div>
      </div>

      <div class="content__inner" id="tab-2">
        <div class="table-responsive">
          <table class="table">
          
         <caption> <h3 align="right"> <font size="2">
          <div id="left" style="float:left;"> <!-- select 검색 창  -->
              <form method="post" action="${cpath}/QnA_List.do" onsubmit="return check(this)">
               <select name="searchType" id="searchType">
                 <option value="0">선 택</option>
                 <option value="bd_title">제 목</option>
                 <option value="bd_cont">내 용</option>
                 <option value="bd_mb_num">작성자</option>
               </select>
               <input type="text" id="searchText" placeholder="검색어를 입력하세요." autocomplete="off" name="sword" size="20" value="${sword}">
               <input type="submit" value="검색">
              </form>
              
          </div>
          
         <div id="right" style="float:right;"><font size="2">          
               <select onchange="move(this)" id="pcnt">
               <option value="10"> 10개 </option>
               <option value="20"> 20개 </option>
               <option value="30"> 30개 </option>
               <option value="50"> 50개 </option>
             </select>
             </font>
           </div>
        
          </h3></caption>          
          
              <thead>
                  <tr>
                  <th scope="col">번호</th>
                  <th scope="col">작성자</th>
                  <th scope="col">제목</th>
                  <th scope="col">작성일</th>
                  </tr>
              </thead>
              <tbody class="table-group-divider">
                  <c:forEach items="${noticelist}" var="vo2">
                  <c:set var="cnt2" value="${cnt2+1}" />
                  <c:url var="contentlink" value="/boardContent.do/${vo2.bd_num}" />
                  <tr>   
                  <th scope="row">${cnt2}</th>
                  <td>${vo2.mb_nick}</td>
                  <td><a href="${contentlink}">${vo2.bd_title}</a></td>
                  <td>${vo2.bd_date}</td>
                  </tr>
                  </c:forEach>
              </tbody>
              <tfoot>
             <!-- 페이징 -->
             <tr>
                <td colspan="5" align="center">
                 <!-- 10페이지 단위로 이전 이동하기  :  -->
                <c:if test="${pstart != 1}"> <!-- 첫번재 그룹이 아닐때는  -->
                    <a href="QnA_List.do?page=${pstart-1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}"> << </a>
                </c:if>
                <c:if test="${pstart == 1}"> <!-- 첫번째 그룹일때(1~10)는 이전 10페이지 이동 X -->
                《<!-- 넘어가는 꺽세 -->
                </c:if>
                
                 <!-- 1페이지 단위로 이전으로 가기 => 현재페이지에서 1을 뺀 페이지로 이동 --> 
                <c:if test="${page != 1}"> <!-- 현재 페이지가 1이 아닌경우 -->
                    <a href="QnA_List.do?page=${page-1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}"> ◀  </a>
                </c:if>
                <c:if test="${page == 1}"> <!-- 현재페이지가 1인경우 -->
                              ◀
                </c:if>
                
                  <c:forEach begin="${pstart}" end="${pend}" var="i">  <!-- 페이지 출력하기 -->
                    <!-- 현재 페이지의 색을 빨강 -->
                     <c:if test="${page == i}"> <!-- 출력되는 페이지가 현재페이지와 같다면 -->
                        <c:set var="st" value="style='color:darkblue;'"/>
                     </c:if>
                     <c:if test="${page != i}"> <!-- 출력되는 페이지가 현재페이지와 다르다면 -->
                        <c:set var="st" value=""/>
                     </c:if>
                     <a href="QnA_List.do?page=${i}&pcnt=${pcnt}&sel=${sel}&sword=${sword}" ${st}> ${i} </a>
                  </c:forEach>
                  
                <!-- 1페이지 단위로 다음 이동하기 -->
                <c:if test="${page != chong}"> <!-- 현재 페이지가 마지막 페이지가 아니라면 -->
                    <a href="QnA_List.do?page=${page+1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}"> ▶  </a>
                </c:if>
                <c:if test="${page == chong}"> <!-- 현재 페이지가 마지막 페이지라면 -->
                              ▶
                </c:if>
                 
                <!-- 10페이지 단위로 다음 이동하기 -->
                <c:if test="${chong != pend}"> <!-- 현재 출력되는 페이지 그룹이 마지막이 아닐겨우 -->
                     <a href="QnA_List.do?page=${pend+1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}"> >> </a>
                </c:if>
                <c:if test="${chong == pend}"> <!-- 현재 출력되는 페이지 그룹이 마지막일 경우 -->
                   》 <!-- 넘어가는 꺽세 -->
                </c:if>
                </td>
              </tr>

             <tr>
                <td colspan="5"><button onclick="goForm()">글쓰기</button></td>
             </tr>
          </tfoot>
          </table>
        </div>
      </div>
    </div>
  </div>
  <!-- partial -->
  <script  src="${cpath}/resources/js/notice_qa.js"></script>

</body>
</html>