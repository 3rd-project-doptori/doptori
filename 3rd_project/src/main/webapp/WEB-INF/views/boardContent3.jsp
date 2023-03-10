<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.doptori.entity.Member"%>
<%@ page import="com.doptori.entity.Board"%>
<%@ page import="com.doptori.entity.Comment"%>
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
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="${cpath}/resources/notice_detail.css">
    <style>
        table{
            border-right: 0;
        }
    </style>
</head>
<body>
 <script type="text/javascript">
 	function goUpdate() {
		location.href="${cpath}/boardUpdateForm.do?bd_num=${vo.bd_num}";
	}
 	
 	function goReply() {
		location.href="${cpath}/boardReplyForm.do";
	}
 	function deleteComment(co_num, bd_num) {
		  if (confirm("정말 삭제하시겠습니까?")) {
		    $.ajax({
		      url: "${cpath}/commentDelete",
		      type: "POST",
		      data: {
		        co_num: co_num,
		        bd_num: bd_num
		      },
		      success: function() {
		        location.reload();
		      },
		      error: function() {
		        alert("댓글 삭제에 실패하였습니다.");
		      }
		    });
		  }
		}
	
 </script>

		<div class="container py-4">
       <jsp:include page="/WEB-INF/views/header.jsp"/>
        <section class="mb-5">
            <table class="table table-bordered text-center">
                <colgroup>
                    <col width="10%">
                    <col width="8%">
                    <col width="18%">
                    <col width="8%">
                    <col width="15%">
                </colgroup>
            <tbody>
                <tr>
                    <th>이미지??  여긴 뭐가 들어 감?? 작성자 프로필 사진?  ${vo.mb_nick}</th>
                    <td>${vo.mb_nick}</td>
                    <th>제목</th>
                    <td colspan="3">${vo.bd_title}</td>
                </tr>
                <tr>
                    <th>날짜</th>
                    <td>${fn:split(vo.bd_date, " ")[0]} ${fn:split(vo.bd_date, " ")[1]} </td>
                    <th>조회수</th>
                    <td>${vo.bd_cnt}</td>
                </tr>
                <tr>
                	<% pageContext.setAttribute("newline", "\n"); %>
                    <td colspan="5">${fn:replace(vo.bd_cont, newline, "<br>")}</td>
                </tr>
                <tr>
				 	<th>첨부파일</th>
				 	<c:if test="${vo.bd_pic ne null}">
						<td colspan="5" align="left"><a href="${cpath}/fileDownload.do?bd_pic=${vo.bd_pic}">${vo.bd_pic}</a></td>
				 	</c:if>
				</tr>
				<tr>
				 	<td colspan="5" align="right">>
				 		<c:if test="${vo.bd_mb_num eq loginMember.mb_num}">	
				 		<button class="btn btn-sm btn-success" onclick="goUpdate()">수정</button>
				 		</c:if>
				 		<c:if test="${vo.bd_mb_num eq loginMember.mb_num || loginMember.mb_id=='admin'}">	
				 		<a class="btn btn-sm btn-warning" href="<c:url value='/boardDelete.do/${vo.bd_num}' />">삭제</a>
				 		</c:if>
				 		<a class="btn btn-sm btn-default" href="javascript:history.go(-1)">뒤로가기</a>
				 		<%-- <a class="btn btn-sm btn-info" href="<c:url value='/QnA_List.do' />">목록으로 돌아가기</a> --%>
				 		<c:if test="${loginMember.mb_id=='admin'}">	
				 		<button class="btn btn-sm btn-danger" onclick="goReply()">답글달기</button>	        
				 	    </c:if>
				 	</td>
			 </tr>
            </tbody>
        </table>
        </section>
        
         <c:set var="bd_num" value="${param.bd_num}" />
        
        <div class="card bg-light">
            <div class="card-body">
            
                <!-- Comment form-->
                <c:choose>
				    <c:when test="${empty loginMember}">
				      	<p>소감을 남기시려면 <a href="${cpath}/signin.do">로그인</a>해주세요</p>
				    </c:when>
				    <c:otherwise>
				        <form class="d-flex for" role="search" action="${cpath}/commentInsert.do?co_bd_num=${vo.bd_num}" method="post" autocomplete="off">
				          <c:if test="${not empty co_bd_num and co_bd_num ne 0}">
				            <input type="hidden" name="co_bd_num" value="${cvo.co_bd_num}">
				          </c:if>
				          <div>
				            <textarea class="form-control me-2 tex" name="co_cont" id="repCon" required="required"></textarea>
				          </div>
				          <div>
				            <button class="btn login sub" type="submit" id="reply_btn">등록</button>
				          </div>
				        </form>
				    </c:otherwise>
				  </c:choose>
                
                
                <div class="d-flex"> 
                
                <ol>
			      <c:forEach var="cvo" items="${list}" >
			        <li>
			          <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
			          <div class="ms-3">
			          <div class="fw-bold"><span>${cvo.mb_nick}</span></div>
			            <span class="date">${cvo.co_date}</span>
			          ${cvo.co_cont}
			          <c:if test="${cvo.co_mb_num eq loginMember.mb_num || loginMember.mb_id=='admin'}">
					  	  <a href="javascript:void(0);" onclick="deleteComment(${cvo.co_num}, ${vo.bd_num});">
						  <button type="button" class="btn btn-info btn-sm">삭제</button>
						  </a>
				      </c:if>
				      </div>
			        </li>
			      </c:forEach>
			    </ol>
               </div> 
                
                
            </div>
        </div>
    </div>
    
    
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>