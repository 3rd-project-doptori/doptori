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
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
    <meta name="generator" content="Hugo 0.104.2">

    <title>글 상세보기</title>
    <link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="${cpath}/resources/css/notice_detail.css">
	

    <!-- CSS only -->
    
    <style>
        table{
            border-right: 0;
        }
        #profile_img{
        	height: 70px;
			width: 70px;
			text-align: center;
        }
        
        </style>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
//1. 댓글 목록을 가져오는 API 호출하는 함수
function loadComments(postId) {
  $.post('/comments', { postId: postId }, function(data) {
    // 댓글 목록을 가져와서 화면에 표시
    $('#comment-list').html(data);
  });
}

// 2. 게시글 상세 정보 페이지를 로드할 때, 댓글 목록을 가져오는 API 호출
$(document).ready(function() {
  // URL에서 게시글 ID를 추출
  var postId = window.location.pathname.split('/').pop();

  // 댓글 목록을 가져오는 API 호출
  loadComments(postId);
});

// 3. 댓글을 추가할 때마다 새로운 API 호출을 수행하고 댓글 목록을 다시 로드
$('#comment-form').submit(function(event) {
  event.preventDefault();
  
  // 새로운 댓글을 추가하는 API 호출
  $.post('/comments/add', $(this).serialize(), function() {
    // 댓글을 추가한 후, 댓글 목록을 다시 로드
    var postId = window.location.pathname.split('/').pop();
    loadComments(postId);
    
    // 입력 필드를 초기화
    $('#comment-form')[0].reset();
  });
});
</script>
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
                    <th rowspan='2' align="center"><div><img id="profile_img" class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>${vo.mb_nick}</th>
                    <th>제목</th>
                    <td colspan="3">
                    	<h3>${vo.bd_title}</h3>
                    </td>
                </tr>
                <tr>
                    <th>날짜</th>
                    <td>${fn:split(vo.bd_date, " ")[0]} ${fn:split(vo.bd_date, " ")[1]} </td>
                    <th>조회수</th>
                    <td>${vo.bd_cnt}</td>
                </tr>
                <tr>
                	<% pageContext.setAttribute("newline", "\n"); %>
                    <td colspan="5">
                    <c:if test="${not empty vo.bd_pic}">
					  <img src="${bd_pic}" alt="게시글 이미지" width="300" height="300">
					</c:if>
					<br>
				    ${fn:replace(vo.bd_cont, newline, "<br>")}</td>
                </tr>
                <tr>
				 	<th>첨부파일</th>
				 	<c:if test="${vo.bd_pic ne null}">
						<td colspan="5" align="left"><a href="${cpath}/fileDownload.do?bd_pic=${vo.bd_pic}">${vo.bd_pic}</a></td>
				 	</c:if>
				</tr>
				<tr>
				 	<td colspan="5" align="right">
				 		<c:if test="${vo.bd_mb_num eq loginMember.mb_num}">	
				 		<button class="btn btn-sm btn-success" onclick="goUpdate()">수정</button>
				 		</c:if>
				 		<c:if test="${vo.bd_mb_num eq loginMember.mb_num || loginMember.mb_id=='admin'}">	
				 		<a class="btn btn-sm btn-warning" href="<c:url value='/boardDelete.do/${vo.bd_num}' />">삭제</a>
				 		</c:if>
				 		<a class="btn btn-sm btn-default" href="javascript:history.go(-1)">뒤로가기</a>
				 		<%-- <a class="btn btn-sm btn-info" href="<c:url value='/QnA_List.do' />">목록으로 돌아가기</a> --%>
				 		<%-- <c:if test="${loginMember.mb_id=='admin'}">	
				 		<button class="btn btn-sm btn-danger" onclick="goReply()">답글달기</button>	        
				 	    </c:if> --%>
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
				            <textarea type="text"  class="form-control me-2 tex" name="co_cont" id="repCon" required="required"></textarea>
				           <button class="btn btn-outline-secondary sub" type="submit" id="reply_btn">등록</button>
				           </form>
				    </c:otherwise>
				  </c:choose>
                
                <!-- Single comment-->
                <div class="d-flex mb-4"> 
                
			          <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
			          <div class="ms-3">
			          <ol>	
			      <c:forEach var="cvo" items="${list}" >
			          	<li>
			          	<div class="fw-bold">${cvo.mb_nick}</div>
			          				${cvo.co_cont}
			           				${cvo.co_date}
			           				
			          <c:if test="${cvo.co_mb_num eq loginMember.mb_num || loginMember.mb_id=='admin'}">
					  	  <a href="javascript:void(0);" onclick="deleteComment(${cvo.co_num}, ${vo.bd_num});">
						  	<button type="button" class="btn btn-info btn-sm">삭제</button>
						  </a>
				      </c:if>
				      </li>
			      </c:forEach>
			      </ol>
			      </div>
               </div> 
                
                
            </div>
        </div>
    </div>
    
    
    <!-- JavaScript Bundle with Popper -->
    
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
</html>