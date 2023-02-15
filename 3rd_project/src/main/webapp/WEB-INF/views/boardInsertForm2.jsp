<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="${cpath}/resources/css/index.css"> 
  <script type="text/javascript">
  	if($("#bd_type").val() == ""){
  		alert("카테고리를 선택하세요");
  		return false;
  	}
  </script>
</head>
<body>
<div class="container">
  <div class="panel panel-default">
    <div class="panel-heading">Q&A 글쓰기</div>
    <div class="panel-body">
    	<form class="form-horizontal" action="${cpath}/boardInsert.do" method="post"  enctype="multipart/form-data">
		  
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="bd_type">카테고리:</label>
		    <div class="col-sm-10">
		      <select name="bd_type" id="bd_type">
                    <!-- <option value="">선택하기</option> -->
                    <c:if test="${loginMember.mb_id=='admin'}">
                    	<option value=1>공지사항</option>
                    </c:if>
	                	<option value=2>Q&A</option>
	                	<option value=3>직거래</option>
                </select>
		    </div>
		</div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="bd_mb_num">작성자</label>
		    <div class="col-sm-10">
			       ${loginMember.mb_nick}
		      <input type="hidden" class="form-control" name="bd_mb_num" id="bd_mb_num" value="${loginMember.mb_num}" readonly="readonly"> 
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="bd_title">제목</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="bd_title" id="bd_title" placeholder="제목을 입력하세요." required>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="bd_cont">내용</label>
		    <div class="col-sm-10">
		      <textarea class="form-control" rows="10" name="bd_cont" id="bd_cont" placeholder="내용을 입력하세요." required></textarea>
			</div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="bd_pic">첨부파일</label>
		    <div class="col-sm-10">
		      <input type="file" name="bd_pic"/></td>
			</div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <button type="submit" class="btn btn-default">등록</button>
		      <button type="reset" class="btn btn-default">초기화</button>
		      <a class="btn btn-default" href="javascript:history.go(-1)">뒤로가기</a>
		      <%-- <a class="btn btn-sm btn-info" href="<c:url value='/boardList.do' />">목록으로 돌아가기</a> --%>
		    </div>
		  </div>
		</form>
    </div>
    <div class="panel-footer"></div>
  </div>
</div>

</body>
</html>