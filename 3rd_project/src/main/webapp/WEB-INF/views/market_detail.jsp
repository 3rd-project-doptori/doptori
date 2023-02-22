<%@ page language="java" contentType="text/html; charset=UTF-8" 
   pageEncoding="UTF-8"%>
<%@ page import="com.doptori.entity.Board"%>
<%@ page import="com.doptori.entity.Comment"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
    <meta name="generator" content="Hugo 0.104.2">
    <title>직거래_상세보기</title>

    <!-- CSS only -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    
      <!-- Favicons -->
    <link rel="apple-touch-icon" href="/docs/5.2/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
    <link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
    <link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
    <link rel="manifest" href="/docs/5.2/assets/img/favicons/manifest.json">
    <link rel="mask-icon" href="/docs/5.2/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
    <link rel="icon" href="/docs/5.2/assets/img/favicons/favicon.ico">
    <link rel="stylesheet" href="${cpath}/resources/css/market_detail.css">
    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900&amp;display=swap">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
       var my_num = Number('${loginMember.getMb_num()}');
       var try_num = 0;
       var start_num = 0
       
      function start_chat(){
          if(start_num==0){
            var your_num = 1; //상대방의 회원번호. 여기에서는 임의로 넣음
            if(my_num==your_num){
               alert("자기 자신과는 채팅할 수 없습니다!");      
            }else{
               var who = new Object();
                  who.my_num = my_num;
                  who.your_num = your_num;
                  socket.emit('START',who);
            }
            start_num = 1;
          }else{
             $('.chat-popup').toggleClass("active");
          }
      }
       
      
      function set_reserve(){
         var text = "<div class='bubble my-bubble'>예약 장소 : <input type='text' id='re_place'><br>";
         text +="예약 시간 : <input type='date' id='re_selldate'><br>";
         text += "<button onclick='reserve()'>예약 신청</button></div>"
         $("#chat-box").append(text);
      }
      
      function reserve(){
         
         var info = new Object();
         //게시판 번호
         info.re_bd_num = 44;
         
         //re_cp_name이 딸기면 re_cp_num이 1 아니면 토마토인데 토마토의 경우 2
         var re_cp_name = document.getElementById('re_cp_name').innerHTML;
         info.re_cp_num = 1;
         if(re_cp_name!="딸기"){
            info.re_cp_num = 2;
         }
         
         //td 안에 있는 값 가져와서 숫자만 추출하기
         const regex = /[^0-9]/g;
         info.re_weight = Number(document.getElementById('re_weight').innerHTML.replace(regex, ""));
         info.re_price = Number(document.getElementById('re_price').innerHTML.replace(regex, ""));
         
         info.re_memo = document.getElementById('re_memo').innerHTML;
         info.re_place = $("#re_place").val();
         info.re_selldate = $("#re_selldate").val();
         socket.emit('RESERVE',info);
         
            var text = "<div class='bubble my-bubble'>"+"예약 신청을 보냈습니다."+"</div>"
            $("#chat-box").append(text);
            
            var data = new Object();
            data.message = "예약 신청을 보냈습니다.";
            socket.emit('SEND',data)
      }
      
      
	$(window).load(function(){
    	 var content = '${vo.bd_cont}';
         var cont_info = content.split('|');
         document.getElementById('re_cp_name').innerHTML = cont_info[0];
         document.getElementById('re_weight').innerHTML = cont_info[1];
         document.getElementById('re_price').innerHTML = cont_info[2];
         document.getElementById('re_memo').innerHTML = cont_info[3];
         document.getElementById('bd_cont').innerHTML = cont_info[4];
         
         var image_path = "C:\\Users\\user\\git\\doptori\\3rd_project\\src\\main\\webapp\\resources\\images\\" + "${vo.bd_pic}";
		$("#show_image").append("<img src='"+image_path+"'>")
		$("#show_sample_image").append("<img src='"+image_path+"' style='transform:scale(3);opacity:0.5'>")
	}); 

      
      
    </script>
    
    
</head>
  <body>
    <div class="container py-4">
        <jsp:include page="/WEB-INF/views/header.jsp"/>
       <!-- <h2 class="display-7 fw-bold">직거래 상세보기</h2> -->
        <div class="row mb-2 justify-content-md-center main">
            <div class="col-md-5 hei">
                <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                    <c:if test="${empty vo.bd_pic}">
                    	<img src="https://health.chosun.com/site/data/img_dir/2022/01/11/2022011100746_0.jpg">
                    <!-- <svg class="bd-placeholder-img" height="350" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg> -->
                    <!-- <div class="col p-4 d-flex flex-column position-static">
                        <strong class="d-inline-block mb-2 text-primary">World</strong>
                        <h3 class="mb-0">Featured post</h3>
                        <div class="mb-1 text-muted">Nov 12</div>
                        <p class="card-text mb-auto">This is a wider card with supporting text below as a natural lead-in to additional content.</p>
                        <a href="#" class="stretched-link">Continue reading</a>
                    </div> -->
                    </c:if>
                    <c:if test="${not empty vo.bd_pic }">
                    	<div id="show_image"></div>
                    </c:if>
                </div>
                <div class="d-md-flex justify-content-md-center">
                    <button class="btn btn-sm btn-outline-secondary me-md-2" type="button">판매중</button>
                    <button class="btn login" type="button" onclick="start_chat()">채팅하기</button>
                </div>
            </div>
            <div class="col-md-7">
                <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                    <div class="col p-4 d-flex flex-column position-static">
                        <table class="table" id="info">
                            <tr>
                                <th class="text-center" scope="col" width="25%">판매자</th>
                                <td scope="col">${vo.mb_nick}</td>
                            </tr>
                            <tr>
                                <th class="text-center" scope="col" width="25%">상품명</th>
                                <td scope="col" id="re_cp_name"></td>
                            </tr>
                            <tbody class="text-start">
                            <tr>
                                <th class="text-center" scope="row">중량</th>
                                <td id="re_weight"></td>
                            </tr>
                            <tr>
                                <th class="text-center" scope="row">가격</th>
                                <td id ="re_price"></td>
                            </tr>
                            <tr>
                                <th class="text-center" scope="row">상세정보</th>
                                <td id = "re_memo"></td>
                            </tr>
							<tr>
                                <th class="text-center" scope="row">글 내용</th>
                                <td id = "bd_cont"></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>


         <div class="row mb-2 justify-content-md-center mar">
            <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                 <c:if test="${empty vo.bd_pic}">
                 	<div style="width:100%;height:100px;overflow:hidden">
                    	<img src="https://health.chosun.com/site/data/img_dir/2022/01/11/2022011100746_0.jpg" style="transform:scale(3);opacity:0.5">
                    </div>
                 </c:if>
                 <c:if test="${not empty vo.bd_pic}">
                 	<div id="show_sample_image" style="width:100%;height:100px;overflow:hidden">
                    </div>
                 </c:if>
                <!-- <svg class="bd-placeholder-img" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg> -->
            </div>
        </div>

<!--         <section class="mb-5">
            <div class="card bg-light">
                <div class="card-body">
                    Comment form
                    <form class="d-flex for" role="search">
                        <textarea class="form-control me-2 tex" type="text" ></textarea>
                        <button class="btn login sub" type="button">등록</button>
                    </form>
                    Comment with nested comments
                    <div class="d-flex mb-4">
                        Parent comment
                        <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                        <div class="ms-3">
                            <div class="fw-bold">Commenter Name</div>
                            If you're going to lead a space frontier, it has to be government; it'll never be private enterprise. Because the space frontier is dangerous, and it's expensive, and it has unquantified risks.

                        </div>
                    </div>
                    Single comment
                    <div class="d-flex">
                        <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                        <div class="ms-3">
                            <div class="fw-bold">Commenter Name</div>
                            When I look at the universe and all the ways the universe wants to kill us, I find it hard to reconcile that with statements of beneficence.
                        </div>
                    </div>
                </div>
            </div>
        </section> -->
    </div>
      
  </body>
</html>