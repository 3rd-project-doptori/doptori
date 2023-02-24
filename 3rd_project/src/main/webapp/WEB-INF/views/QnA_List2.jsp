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
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <link rel="stylesheet" href="${cpath}/resources/css/notice_qa.css">
  <!-- CSS only -->
  
  <style>
  
     @font-face {
       font-family: 'IBMPlexSansKR-Regular';
       src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/IBMPlexSansKR-Regular.woff') format('woff');
       font-weight: normal;
       font-style: normal;
   }
   body{
      font-family: 'IBMPlexSansKR-Regular';
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
        <div><span>공지사항</span></div>
      </button>
      <button class="tab" onclick="openTab(event, 'tab-2')">
        <div><span>Q&A</span></div>
      </button>
    </div>
    <div class="content">
      <div class="content__inner" id="tab-1">
          <div class="res">
           
              <form class="d-flex col-sm-4 " role="search" method="post" action="${cpath}/QnA_List2.do" onsubmit="return check(this)">
                       
                     <select name="searchType" id="searchType">
                       <option value="0">선 택</option>
                       <option value="bd_title">제 목</option>
                       <option value="bd_cont">내 용</option>
                       <option value="bd_mb_num">작성자</option>
                     </select>
                     <div class="input-group">
                     <input type="text" id="autoSizingInputGroup" class="form-control"  placeholder="검색어를 입력하세요." autocomplete="off" name="sword" size="20" value="${sword}">
                     <input  class="input-group-text btn btn-sm btn-outline-secondary" type="button" value="🔍">
                    </div>
               </form>
          
             <!-- <font size="2">          
                  <select onchange="move(this)" id="pcnt">
                  <option value="10"> 10개 </option>
                  <option value="20"> 20개 </option>
                  <option value="30"> 30개 </option>
                  <option value="50"> 50개 </option>
                </select>
                </font> -->
         
                 
                    
                  </div>
        <div class="table-responsive">
          <table class="table">
          
            <thead align="center">
                  <tr>
                  <th scope="col">번호</th>
                  <th scope="col">작성자</th>
                  <th scope="col">제목</th>
                  <th scope="col">작성일</th>
                  </tr>
              </thead>
              <tbody class="table-group-divider">
                  <c:forEach items="${noticelist}" var="vo" varStatus="status">
                   <c:set var="vo_indexed" value="${noticelist[noticelist.size() - status.count]}" />
                   <tr>   
                       <td align="center" scope="row">${noticelist.size() - status.count + 1}</td>
                       <td align="center">${vo_indexed.mb_nick}</td>
                       <c:url var="contentlink" value="/boardContent.do/${vo_indexed.bd_num}" />
                       <td><a href="${contentlink}">${vo_indexed.bd_title}</a></td>
                       <td align="center">${vo_indexed.bd_date}</td>
                   </tr>
               </c:forEach>
              </tbody>
          </table>
             <!-- 페이징 -->
             <div class="fe">
             <c:if test="${loginMember.mb_id=='admin'}">
             <button class="btn btn-sm btn-outline-secondary sub" onclick="goForm()">글쓰기</button>
             
             </c:if>
             </div>
             <div class="fc">
                 <!-- 10페이지 단위로 이전 이동하기  :  -->
                <c:if test="${pstart != 1}"> <!-- 첫번재 그룹이 아닐때는  -->
                    <a href="QnA_List.do?page=${pstart-1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}"> 《 </a>
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
                </div>


               
        </div>
      </div>

      <div class="content__inner" id="tab-2">
         <div class="res">
              
         <!-- <div id="right" style="float:right;"><font size="2">          
               <select onchange="move(this)" id="pcnt">
               <option value="10"> 10개 </option>
               <option value="20"> 20개 </option>
               <option value="30"> 30개 </option>
               <option value="50"> 50개 </option>
             </select>
             </font>
           </div> -->
             <form class="d-flex col-sm-4 " role="search" method="post" action="${cpath}/QnA_List2.do" onsubmit="return check(this)">
                       
                     <select name="searchType" id="searchType">
                       <option value="0">선 택</option>
                       <option value="bd_title">제 목</option>
                       <option value="bd_cont">내 용</option>
                       <option value="bd_mb_num">작성자</option>
                     </select>
                     <div class="input-group">
                     <input type="text" id="autoSizingInputGroup" class="form-control"  placeholder="검색어를 입력하세요." autocomplete="off" name="sword" size="20" value="${sword}">
                     <input  class="input-group-text btn btn-sm btn-outline-secondary" type="button" value="🔍">
                    </div>
               </form>
         </div>
        <div class="table-responsive">
          <table class="table">
          
              <thead align="center">
                  <tr>
                  <th scope="col">번호</th>
                  <th scope="col">작성자</th>
                  <th scope="col">제목</th>
                  <th scope="col">작성일</th>

                  </tr>
              </thead>
              <tbody class="table-group-divider">
                  <c:forEach items="${qnalist}" var="vo" varStatus="status">
                   <c:set var="vo_indexed" value="${qnalist[qnalist.size() - status.count]}" />
                   <tr>   
                       <td align="center" scope="row">${qnalist.size() - status.count + 1}</td>
                       <td align="center">${vo_indexed.mb_nick}</td>
                       <c:url var="contentlink" value="/boardContent.do/${vo_indexed.bd_num}" />
                       <td><a href="${contentlink}">${vo_indexed.bd_title}</a></td>
                       <td align="center">${vo_indexed.bd_date}</td>
                   </tr>
               </c:forEach>
              </tbody>
             </table>
             <!-- 페이징 -->
              <div class="fe"> 
              <c:if test="${loginMember != null}">
          		<button class="btn btn-sm btn-outline-secondary sub" onclick="goForm()">글쓰기</button>
          	</c:if>
          	</div>
             <div class="fc">
                 <!-- 10페이지 단위로 이전 이동하기  :  -->
                <c:if test="${pstart != 1}"> <!-- 첫번재 그룹이 아닐때는  -->
                    <a href="QnA_List.do?page=${pstart-1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}"> 《 </a>
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
              
               </div>

        </div>
      </div>
    </div>
  </div>
  <!-- partial -->
  <script  src="${cpath}/resources/js/notice_qa.js"></script>
</body>




</html>