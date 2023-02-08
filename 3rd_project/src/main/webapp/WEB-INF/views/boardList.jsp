<%@ page import="java.util.List"%>
<%@ page import="com.doptori.entity.Board"%>
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
	//basic.jsp가 실행이 되면 목록을 보여주는 함수가 실행이 될 수 있도록
	// 익명함수 실행
	
	$(document).ready(function(){
  		// boardList라고 하는 함수 실행!
  		// 자바스크립트의 호이스팅
  		boardList();
  	});
	
	function boardList(){
		$.ajax({
  			url : "${cpath}/board",
  			type : "get",
  			// 보내줄 데이터가 없어서 data:___ 적을게 없음
  			dataType : "json", // 서버가 클라이언트에게 돌려주는 데이터 형식
  			success : callBack, // ajax에서 함수를 부르는 경우 뒤에 ()적지 않는다!!
  			error : function(){
  				alert("error");
  			}
  			
  		});//ajax 끝
  		
  	}// boardList함수 끝!!
  	
  	function callBack(data){
  		// alert("데이터 통신 확인");
  		console.log(data);
  		
  		var bList = "<div class='panel-body'>";
  		var bList = "<table class='table table-hover table-bordered'>";
  		bList += "<thead>";
  		bList += "<tr>";
  		bList += "<td>번호</td>";
  		bList += "<td>제목</td>";
  		bList += "<td>작성자</td>";
  		bList += "<td>작성일</td>";
  		bList += "<td>조회수</td>";
  		bList += "</tr>";
  		bList += "</thead>";
  		
  		
  		/* 여기부터
  		<tbody>
    		<c:forEach var="vo" items="${list}" varStatus="status">
    			<tr>
					<td>${vo.bd_num}</td>						
					<c:if test="${vo.bd_level > 0}">
						<c:forEach begin="1" end="${vp.bd_level }">
							<span style="padding-left: 10px"></span>
						</c:forEach>
					</c:if>
						 <c:url var="contentlink" value="/boardContent.do/${vo.bd_num}" />		
					<td>
					<c:if test="${vo.bd_level > 0}">
						<c:forEach begin="1" end="${vo.bd_level }">
							<span style="padding-left: 10px"></span>
						</c:forEach>
					</c:if>
					<a href="${contentlink}">${vo.bd_title}</a>
					</td>
					<td>${memberNames[status.index]}</td>     			
					<td>${vo.bd_date}</td>  			
					<td>${vo.bd_cnt}</td>     			
    			</tr>
    		</c:forEach>
  			여기까지 이전 내용입니다 */ 
    		
  			
  		// {idx: 1, title: '스프링 게시판', content: '오늘 처음 써봅니다..',  writer: '홍길동', indate: '2023-02-08', ...}
  		// Array들어온 JSON데이터를 꺼낼때 반복문을 통해서 꺼냄
  		
  		// 제이쿼리에서 요소에 접근할 수 있는 for문과 같은 역할 --> $.each
  		// $.each(데이터, 데이터를 처리할 함수);
  		// function(idx,content){} 같은 역할 (idx,content)=>{}	--- 함수형 프로그래밍
  		// ()=>{} 이클립스에서 맞는 문법으로 인식하지 못한다
  		// json 데이터는 [인덱스:{데이터}, ...]
  		$.each(data,(index,obj)=>{
  			bList += "<tr>";
  			bList += "<td>" + obj.idx + "</td>";
  			// a태그를 누르면 href가 요청으로 가는게 아니라 js함수로 가도록 키워드
  			// href="javascript:함수이름()"
  			// 마치 button태그를 눌러서 onclick="함수이름()"비슷한 효과
  			// a태그 사용시 this 인식 불가
  			// 글의 내용을 보여주는 함수를 만들때- 어떤글 내용을 보여줄지 게시글번호로 인식
  			bList += "<td><a href='javascript:cview(" + obj.idx + ")'>" + obj.title + "</a></td>";
  			bList += "<td>" + obj.writer + "</td>";
  			bList += "<td>" + obj.indate + "</td>";
  			bList += "<td id='count" + obj.idx + "'>" + obj.count + "</td>";
  			bList += "</tr>";
  		
  			// 게시글 내용만 보여주는 태그
											// id=c1,c2,c3...
  			bList += "<tr style='display:none' id='c" + obj.idx + "'>";
	        bList += "<td>내용</td>"; 
	        bList += "<td colspan='4'>";
	        bList += "<div class='form-control form-board' style='height: auto;'  row='7' id='nc" + obj.idx + "'>" + obj.content + "</div>";
	         
	        // 로그인 정보와, 데이터memId가 같으면 수정 삭제 가능~~
	        if("${loginMember.memId}" == obj.memId) {
	        	bList += "<div class ='button add-list-button'><div class='btn' style = 'font-size:15px; padding:10px 30px; margin:5px;' onclick='goUpdate(" + obj.idx + ")'>수정</div></div>";
				bList += "<div class ='button add-list-button'><div class='btn' style = 'font-size:15px; padding:10px 30px; margin:5px;' onclick='goDel(" + obj.idx + ")'>삭제</div></div>";
	        	
	        }else{
	        	bList += "<button disabled class='btn' onclick='goUpdate(" + obj.idx + ")'></button>";
				bList += "<button disabled class='btn' onclick='goDel(" + obj.idx + ")'></button>";
	         }
	         bList += "</td>";
	         bList += "<tr>";
	         });// each 끝
	   
	         bList += "<tr>";
	         bList += "<td colspan='5'>";
	         bList += "<button class='btn btn-sm btn-success' onclick='goForm()'>글쓰기</button>";
	         bList += "</td>";
	         bList += "</tr>";
  		
	         bList += "</table>";
	         $("#list").html(bList);

  	
  	}// callBack함수 끝
	   
	   
  	function goForm() {
  		// 글쓰기 버튼을 눌렀을때
	  	// 리스트 목록은 없애고, 글쓰기 폼태그들은 화면에 보여주기
	  	$("#list").css("display","none");
	  	$("#wform").css("display","block");
  	}
	  	location.href="${cpath}/boardInsertForm.do"
  	}
	  	
  	function insertFn(){
  		// 1. form태그 안에 있는 input태그에 입력한 내용들 가져오기
	  	// var title = ${'#title'}.val();와 같이 일일이 가져와야하는데
	  	// .serialize - 직렬화 (값들을 한번에 정리해서 객체로)
	  	var fData = $("#frm").serialize();
	  	console.log("폼태그 내용",fData);
	  	  		
	  	// 2. 그 내용들을 ajax 통신으로 보내기
	  	$.ajax({
	  		url : "${cpath}/board",
	  	  	type : "post",
	  	  	data : fData, //보내주는 데이터가 있다면
	  	  	// dataType : "", // 받는 데이터가 있으면
	  	  	success : boardList,
	  	  	// boardList함수를 실행 - callBack에 있는 내용까지 실행
	  	  	// ajax에서는 함수 실행할때 ()적지않는것 기억할것!
	  	  	error : function(){
	  	  		alert("글쓰기 실패!");
	  	  	}
	  	  			
	  	});//insert ajax끝
	  	  		
	  	// 3. 잘 보내졌으면 다시 게시글 목록이 보여질 수 있도록~
	  	// ajax 끝나고 난 다음에는 여전히 css가 list는 none, wform은 block상태
	  	$("#list").css("display","block");
	  	$("#wform").css("display","none");
	  	  		
	  	// 4. 글쓰고 나면 form태그에 내용이 남은 상태
	  	//$("#title").val("");
	  	//$("#content").val("");
	  	//$("#writer").val("");
	  	//취소 버튼을 강제로 실행하는 js 코드
	  	$("#reset").trigger("click");
	  	  		
	  	  		
  	}// insertFn 끝!!
	  	  	
	  	  	
  	function cview(idx){
  		// c+idx c1,c2,,
	    // 만약에 c1이 none상태면~ table-row
	    // 만약에 c1이 table-rows이면 ~ none
	    if($("#c"+idx).css("display") == "none"){
	    	// 게시글 내용을 담은 tr을 보여주려고 할때 조회수를 +1씩
	    	$.ajax({
	    		url : "${cpath}/updateCount/"+idx, //PathVariable
	  		    type : "get",
	  		    // data : "{"idx":idx}, //보내주는 데이터가 있다면
	  		    // dataType : "", // 받는 데이터가 있으면
	  		    success : function(vo){
	  		    	console.log(vo.count);
	  		       	// vo.count의 값을 출력
	  		       	$("#count"+idx).text(vo.count);
	  		        	 
	  		    },
	  		    error : function(){
	  		    	alert("조회수 올리기 실패!!");
	  		    	}
	  		    }); // 조회수 ajax끝
	  		    
	  		    $("#c"+idx).css("display","table-row")
	  		    }else{
	  		    	$("#c"+idx).css("display","none")
	  		    	}
  		}// cview 함수 끝!
	    	
	    	
  		function goDel(idx){
  			// 삭제 버튼을 눌렀을때 진짜로 삭제할건지 물어보고 삭제하기
  			// console.log, alert, confirm
  			var real = confirm("정말 삭제하시겠습니까???");
  			if(real){
  				$.ajax({
  					url : "${cpath}/board/"+idx,// PathVariable로 넘기기
  					type : "delete",
	    	  	    // 보내주는 데이터 1개이면 직접 객체로 묶어서 보내줄 수 있음
	    	  	    		// "idx" : parameter name값 --> idx=2
	    	  	    // data : {"idx" : idx}, //보내주는 데이터가 있다면
	    	  	    // dataType : "", // 받는 데이터가 있으면
	    	  	    success : boardList,
	    	  	    error : function(){
	    	  	    	alert("글삭제 실패!!");
	    	  	    }
	      	         
  				});

  			}
	    		
  		}// goDel 함수 끝!
	      		
	      		
  		function goUpdate(idx){
  			// textarea의 내용 가져오기
  			// nc1,nc2,...선택자를 이용
  			var newContent = $("#nc"+idx).val();
	      	        
  			$.ajax({
  				url : "${cpath}/board",
  				type : "put",
	      	    // idx, content를 보내줘야함 --> 여러개의 데이터를 보낼때
	      	    // json형식으로 보내야함 --> contentType지정, JSON.stringify()로 형식도 바꿈
	      	    contentType : "application/json;charset=utf-8",
	      	    data : JSON.stringify({"idx":idx, "content": newContent}), //보내주는 데이터가 있다면
	      	    // dataType : "", // 받는 데이터가 있으면
	      	    success : boardList,
	      	    error : function(){
	      	    	alert("글 수정 실패!!");
	      	    }
	      	    
  		});

  	}
  		
  		
	</script>
</head>
<body>

<div class="container">
  <h2>게시판 목록보기</h2>
  <div class="panel panel-default">
    <div class="panel-heading">게시판</div>
<<<<<<< HEAD
    <div class="panel-body">
    	<table class="table table-bordered table-hover">
	    	<thead>
		    	 <tr>
		    	 	<td>번호</td>
		    	 	<td>제목</td>
		    	 	<td>작성자</td>
		    	 	<td>작성일</td>
		    	 	<td>조회수</td>
		    	 </tr>
	    	</thead>
	    	<tbody>
	    		<c:forEach var="vo" items="${list}" varStatus="status">
	    			<tr>
						<td>${vo.bd_num}</td>						
						<c:if test="${vo.bd_level > 0}">
							<c:forEach begin="1" end="${vp.bd_level }">
								<span style="padding-left: 10px"></span>
							</c:forEach>
						</c:if>
						<c:url var="contentlink" value="/boardContent.do/${vo.bd_num}" />		
						<td>
						<c:if test="${vo.bd_level > 0}">
							<c:forEach begin="1" end="${vo.bd_level }">
								<span style="padding-left: 10px"></span>
							</c:forEach>
						</c:if>
						<a href="${contentlink}">${vo.bd_title}</a>
						</td>
						<td>${memberNames[status.index]}</td>     			
						<td>${vo.bd_date}</td>  			
						<td>${vo.bd_cnt}</td>     			
	    			</tr>
	    		</c:forEach>
	    		<tr>
	    			<td colspan="5"><button class="btn btn-sm btn-success" onclick="goForm()">글쓰기</button></td>
	    		</tr>
	    	</tbody>
    	</table>
=======
    <%-- jstl을 이용해서 로그인 안 한 상태라면 로그인 화면이,
    	로그인을 한 상태라면 로그아웃 버튼, 000님 환영합니다~ 출력
    	choose-when/otherwise
     --%>
     		<c:choose>
	     		<c:when test="${empty loginMember}">
			<form class="form-inline" action="${cpath}/Login.do" method="post">
				<div class="form-group">
		 	 		<label for="memId">ID:</label>
		    		<input type="text" class="form-control" id="memId" name="memId">
		  		</div>
		  		<div class="form-group">
		    		<label for="memPw">PW:</label>
		    		<input type="password" class="form-control" id="memPw" name="memPw">
		  		</div>
		  		<button type="submit" class="btn btn-default">로그인</button>
			</form>
		
	    	</c:when>
		<c:otherwise>
			<div class="form-group">
				<span>${loginMember.memName}님 환영합니다~~</span>
				<a class="btn btn-sm btn-default" href="${cpath}/Logout.do">로그아웃</a>
			</div>
		</c:otherwise>
    
    

    </c:choose>
>>>>>>> branch 'master' of https://github.com/3rd-project-doptori/doptori.git
    </div>
    <div class="panel-body" id="list" style="display:block">Panel Content</div>
    <div class="panel-body" id="wform" style="display:none">
    	<form class="form-horizontal" id="frm">
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="title">제목:</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력하세요">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="content">내용:</label>
		    <div class="col-sm-10">
		      <textarea class="form-control" name="content" rows="10" id="content"></textarea>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="writer">작성자:</label>
		    <div class="col-sm-10">
		      <input type="text" readonly="readonly" class="form-control" name="writer" id="writer" value="${loginMember.memName}">
		      <input type="hidden" name="memId" value="${loginMember.memId}">
		    </div>
		  </div>
		  <div class="form-group">
		     <!-- 부트스트랩은 한줄이 12 col-sm-2 col-sm-10 -->
		    <div class="col-sm-offset-2 col-sm-10">
		    <!-- button 기본 type은 submit이기 때문에 버튼으로만 사용하려면 type="button" -->
		      <button type="button" class="btn btn-default" onclick="insertFn()">등록</button>
		      <button type="reset" class="btn btn-default" id="reset">취소</button>
		    </div>
		  </div>
		</form>
    
    </div>
    <div class="panel-footer">게시판입니다😊</div>
  </div>


</body>
</html>