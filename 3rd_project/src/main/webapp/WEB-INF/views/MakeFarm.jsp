<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="${cpath}/resources/css/index.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
 
<div class="container">
  <h2>농장 만들기</h2>
  <div class="panel panel-default">
    <div class="panel-heading">농장 만들기</div>
    <div class="panel-body">
		<form class="form-horizontal" action="${cpath}/MakeFarm.do" method="post">
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="fm_name">농장 이름:</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="fm_name" id="fm_name" placeholder="농장이름을 입력하세요.">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="fm_dong">동,개 이름:</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="fm_dong" id="fm_dong" placeholder="동,개 이름을 입력하세요.">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="writer">작성자:</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="writer" id="writer" placeholder="작성자 이름">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="writer">작성자:</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="writer" id="writer" placeholder="작성자 이름">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="writer">작성자:</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="writer" id="writer" placeholder="작성자 이름">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="writer">작성자:</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="writer" id="writer" placeholder="작성자 이름">
		    </div>
		  </div>
		  <div class="form-group">
		  <!-- 부트스트랩은 한줄이 12 col-sm-2 col-sm-10 -->
		    <div class="col-sm-offset-2 col-sm-10">
		      <button type="submit" class="btn btn-success">등록</button>
		      <button type="reset" class="btn btn-danger">취소</button>
		    </div>
		  </div>
		</form>
	</div>
    <div class="panel-footer">농장을 등록해 주세요😊</div>
  </div>
</div>

</body>
</html>
