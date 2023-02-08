<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
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
function history_back() {
	history_back();
}	
</script>
</head>
<body>
<div class="container">
  <h2>게시판 답글달기</h2>
  <div class="panel panel-default">
    <div class="panel-heading">게시판</div>
    <div class="panel-body">
		<form class="form-horizontal" action="${cpath}/boardReply.do" method="post">
			<input type="hidden" name="bd_num" value="${parent.bd_num}">
			<div class="form-group">
			    <label class="control-label col-sm-2" for="bd_type">카테고리:</label>
			    <div class="col-sm-10">
					<select name="bd_type">
	                    <option value=3>Q&A</option>
	                </select>
           		 </div>
            </div>
			<!-- <input type="hidden" name="bd_mb_num" value="${vo.bd_mb_num}"> -->
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="bd_mb_num">작성자:</label>
			    <div class="col-sm-10">
			    <input type="hidden" class="form-control" name="bd_mb_num" value="${vo.bd_mb_num}" readonly="readonly">  
			      <%-- ${vo.bd_mb_num} --%>
			      </div>
			  </div>
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="bd_title">제목:</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="bd_title" id="bd_title" placeholder="제목을 입력하세요." value="RE: ${parent.bd_title}">
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="bd_cont">답글:</label>
			    <div class="col-sm-10">
			      <textarea class="form-control" name="bd_cont" rows="10" id="bd_cont" placeholder="내용을 입력하세요."></textarea>
			    </div>
			  </div>
			  <div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
			      <button type="submit" class="btn btn-default">답글등록</button>
			     <!-- <a class="btn btn-sm btn-info" href="<c:url value='/boardContent.do/${vo.bd_num}' />">뒤로가기</a>  --> 
			   	  <a class="btn btn-default" href="javascript:history.go(-1)">뒤로가기</a>
			    </div>
			  </div>
			</form>
	</div>
    <div class="panel-footer"></div>
  </div>
</div>

</body>
</html>