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
  <script type="text/javascript">
  
  
  function InsertMb(){
		// 1. form태그 안에 있는 input태그에 입력한 내용들 가져오기
		// var title = $("#title").val(); -->와 같이 일일이 가져와야하는데
		//.serialize() -->직렬화(값들을 한번에 정리해서 객체로)
		var MemberData = $("#join").serialize();
		console.log("회원가입 내용",MemberData);
		
		// 2. 그 내용들을 ajax 통신으로 보내기
		$.ajax({
			url:"${cpath}/member",
			type:"post",
			data:MemberData,
			success: function(){
				alert("회원가입 성공");
				location.reload();
			},
			error: function(){
				alert("회원가입 실패");
			}
			
		});// insert ajax 끝!!
		
	}// InsertMb 끝!!
	
	
	function UpdatePhoto(){
		
		var title = $("#photo").val();
		
		$.ajax({
			url:"${cpath}/member",
			type:"post",
			data:MemberData,
			success: function(){
				alert("회원가입 성공");
				location.reload();
			},
			error: function(){
				alert("회원가입 실패");
			}
			
		});// insert ajax 끝!!
		
	}// InsertPhoto 끝!!

	function FarmList(){
		location.href = "${cpath}/FarmList.do"
	}
	
	function Calendar(){
		location.href = "${cpath}/Diary_Calendar.do"
	}

	//회원정보 수정
	function updateMember(){
		location.href = "${cpath}/updateMember.do"
	}

	//회원탈퇴
	function memberDeleteView(){
		location.href = "${cpath}/memberDeleteView.do"
	}

	</script>
</head>

<body>
	<div class="container">
  <h2>테스트</h2>
  <div class="panel panel-default">
    <div class="panel-heading">
    	<c:choose>
    		<c:when test="${empty loginMember}">
				<form class="form-inline" action="${cpath}/Login.do" method="post">
				    <div class="form-group">
					    <label for="mb_id">ID:</label>
					    <input type="text" class="form-control" id="mb_id2" name="mb_id">
					 </div>
				    <div class="form-group">
					    <label for="mb_pw">Password:</label>
					    <input type="password" class="form-control" id="mb_pw" name="mb_pw">
				    </div>
				    <button type="submit" class="btn btn-default">로그인</button>
				</form>
			</c:when>
			<c:otherwise>
				<div class="form-group">
					<c:choose>
					<c:when test="${empty loginMember.mb_pic}">
					<style>
					img{
            		border-radius: 100%;
        			}
					</style>
						<a href="${cpath}/Mypage.do"><span><img src="resources/images/default3.png"></span></a>
					</c:when>
					<c:otherwise>
						<a href="${cpath}/Mypage.do"><span>${loginMember.mb_pic}</span></a>
					</c:otherwise>
					</c:choose>
					<span>${loginMember.mb_nick}님 환영합니다~</span>
					<a class="btn btn-sm btn-default" href="${cpath}/Logout.do">로그아웃</a>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
    <div class="panel-body">
		<form class="form-horizontal" id="join">
		<div class="form-group">
		    <label class="control-label col-sm-2" for="mb_id">아이디:</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="mb_id" id="mb_id" placeholder="아이디를 입력하세요.">
		    </div>
		    <div><font id="id_feedback" size="2"></font></div>
		</div>
		<div class="form-group">
		    <label class="control-label col-sm-2">비밀번호:</label>
		    <div class="col-sm-10">
		      <input type="password" class="form-control" placeholder="비밀번호를 입력하세요.">
		    </div>
		</div>
		<div class="form-group">
		    <label class="control-label col-sm-2" for="mb_pw">비밀번호 확인:</label>
		    <div class="col-sm-10">
		      <input type="password" class="form-control" name="mb_pw" id="mb_pw" placeholder="비밀번호를 입력하세요.">
		    </div>
		</div>
		<div class="form-group">
		    <label class="control-label col-sm-2" for="mb_nick">닉네임:</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="mb_nick" id="mb_nick" placeholder="닉네임을 입력하세요.">
		    </div>
		</div>
		<div class="form-group">
		    <label class="control-label col-sm-2" for="mb_type">회원 선택:</label>
		    <div class="col-sm-10">
		      <select name="mb_type">
                    <option value="choose">회원 선택</option>
                    <option value=1>농업인</option>
	                <option value=2>일반인</option>
                </select>
		    </div>
		</div>
		<div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <button type="button" class="btn btn-success" onclick="InsertMb()">회원가입</button>
		      <button type="reset" class="btn btn-danger" id="reset">지우기</button>
		    </div>
		  </div>
		</form>
	</div>
	<div class="panel-body">
		<form class="form-horizontal" id="photo">
			<div class="form-group">
				<label class="control-label col-sm-2" for="mb_pic">사진 등록:</label>
			    <div class="col-sm-10">
			      <input type="file" class="form-control" name="mb_pic" id="mb_pic">
			    </div>
			</div>
			<div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
			      <button type="button" class="btn btn-success" onclick="InsertPhoto()">사진등록</button>
			      <button type="reset" class="btn btn-danger" id="reset">지우기</button>
			    </div>
		  	</div>
		</form>
	</div>
    <div class="panel-footer"><button class="btn btn-sm btn-success" onclick="FarmList()">내농장</button></div>
    <div class="panel-footer"><button class="btn btn-sm btn-success" onclick="Calendar()">캘린더</button></div>
    <div class="panel-footer"><button class="btn btn-sm btn-success" onclick="updateMember()">회원정보수정</button></div>
    <div class="panel-footer"><button class="btn btn-sm btn-warning" onclick="memberDeleteView()">회원탈퇴</button></div>
  </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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