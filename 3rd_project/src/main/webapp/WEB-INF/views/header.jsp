<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
      <!-- CSS only -->
   <!--  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> -->
    <link rel="stylesheet" href="${cpath}/resources/css/lineicons.css">
    <link rel="stylesheet" href="${cpath}/resources/css/header.css">
    <link rel="stylesheet" href="${cpath}/resources/header/LineIcons.eot">
    <link rel="stylesheet" href="${cpath}/resources/header/LineIcons.svg">
    <link rel="stylesheet" href="${cpath}/resources/header/LineIcons.ttf">
    <link rel="stylesheet" href="${cpath}/resources/header/LineIcons.woff">
    <link rel="stylesheet" href="${cpath}/resources/header/LineIcons.woff2">
    
    <link rel="stylesheet" href="${cpath}/resources/css/chatting_di.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


        <!-- Favicons -->
<!--     <link rel="apple-touch-icon" href="/docs/5.2/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
    <link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
    <link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
    <link rel="manifest" href="/docs/5.2/assets/img/favicons/manifest.json">
    <link rel="mask-icon" href="/docs/5.2/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
    <link rel="icon" href="/docs/5.2/assets/img/favicons/favicon.ico">
    <meta name="theme-color" content="#712cf9"> -->
    <style>
    	@font-face {
		  font-family: 'lineicons';
		  src: url("${cpath}/resources/header/LineIcons.eot");
		  src: url('${cpath}/resources/header/LineIcons.eot') format('embedded-opentype'),
		       url('${cpath}/resources/header/LineIcons.woff2') format('woff2'),
		       url('${cpath}/resources/header/LineIcons.woff') format('woff'),
		       url('${cpath}/resources/header/LineIcons.ttf') format('truetype'),
		       url('${cpath}/resources/header/LineIcons.svg') format('svg');
		}
    </style>
      <header class="pb-3 mb-5 border-bottom">
        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
              <a class="navbar-brand im" href="${cpath}/Main.do">
              	<img src="${cpath}/resources/images/header_logo.png" class="im">
              </a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                  <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="${cpath }/Main.do">Home</a>
                  </li>
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                      영농일지
                    </a>
                    <ul class="dropdown-menu">
                      <c:if test="${loginMember == null}">
                		<li><a class="dropdown-item" href="#" onClick="alert('로그인을 해주세요.')">영농일지</a></li>
                		<li><a class="dropdown-item" href="#" onClick="alert('로그인을 해주세요.')">일지 목록</a></li>
                      	<li><a class="dropdown-item" href="#" onClick="alert('로그인을 해주세요.')">일지 관리</a></li>
					</c:if>
					<c:if test="${loginMember != null}">
						<li><a class="dropdown-item" href="<c:url value='/calendar2.do/${loginMember.getMb_num()}'/>">영농일지</a></li>
						<li><a class="dropdown-item" href="<c:url value='/FarmDiaryList.do'/>">일지 목록</a></li>
                      	<li><a class="dropdown-item" href="<c:url value='/FarmDiaryManageList2.do'/>">일지 관리</a></li>
					</c:if>
                    </ul>
                  </li>
                  <c:if test="${loginMember == null}">
                  <li class="nav-item">
                    <a class="nav-link" href="#" onClick="alert('로그인을 해주세요.')">병해충분석</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#" onClick="alert('로그인을 해주세요.')">농작물분석</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#" onClick="alert('로그인을 해주세요.')">직거래</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#" onClick="alert('로그인을 해주세요.')">게시판</a>
                   
                  </li>
                  </c:if>
					<c:if test="${loginMember != null}">
					<li class="nav-item">
                    <a class="nav-link" href="<c:url value='/analysis2.do'/>">병해충분석</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/analysis.do'/>">농작물분석</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/market.do'/>">직거래</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/QnA_List2.do'/>">게시판</a>
                  </li>
                   </c:if>
                </ul>
	                <c:choose>
	                
			    		<c:when test="${empty loginMember}">
							<button class="btn login" type="button" onclick="signin()">LOGIN</button>  
						</c:when>
						
						<c:otherwise>
							 <div class="nav-item dropdown">
			                  <button class="dropdown-toggle bg-transparent border-0 bu" type="button" id="profile" data-bs-toggle="dropdown" aria-expanded="false">
			                      <div class="info">
			                        <div class="image">
			                        	<c:choose>
			                        		<c:when test="${empty loginMember.mb_pic}">
					                          <img src="${cpath}/resources/images/default2.png" alt="" style="width: 2.5rem;"/>
			                        		</c:when>
				                        	<c:otherwise>
				                        	  <img src="${cpath}/resources/images/${loginMember.mb_pic}" alt="" style="width: 3rem;"/>
				                        	</c:otherwise>
			                        	</c:choose>
			                        </div>
			                      </div>
			                  </button>
			                  
			                  <!-- 비동기식 관리자 회원목록 보기 -->
			                  <c:if test="${loginMember.mb_id=='admin'}">
			                    <button id="MemberList" class="btn btn-outline-secondary" >회원목록</button>
			                   </c:if>
			                    
			                    
			                  <ul class="dropdown-menu dm2" aria-labelledby="static">
			                    <%-- <li class="dropdown-item">
			                      <a href="${cpath}/mypage.do"><i class="lni lni-user"></i> View Profile</a>
			                    </li>
			                    <li class="dropdown-item">
			                      <a href="${cpath }/notice.do"><i class="lni lni-alarm"></i> Notifications</a>
			                    </li>
			                    <li class="dropdown-item">
			                      <a href="#0"> <i class="lni lni-inbox"></i> Messages </a>
			                    </li>
			                    <li class="dropdown-item">
			                      <a href="#0"> <i class="lni lni-cog"></i> Settings </a>
			                    </li> --%>
			                    <li class="dropdown-item">
			                      <a href="${cpath}/mypage.do"> <i class="lni lni-user"></i> 마이페이지 </a>
			                    </li>
			                    <li class="dropdown-item">
			                      <a href="${cpath}/Logout.do"> <i class="lni lni-exit"></i> 로그아웃 </a>
			                    </li>
			                  </ul>
			                </div>
						</c:otherwise>
						
			         </c:choose>
              </div>
            </div>
          </nav>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    </header>
    
    
    <script src="https://cdn.socket.io/4.5.4/socket.io.min.js" integrity="sha384-/KNQL8Nu5gCHLqwqfQjA689Hhoqgi2S84SNUxC3roTe4EhJ9AfLkp8QiQcU8AMzI" crossorigin="anonymous"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
	    var socket = io.connect('http://localhost:5000',{
	        cors: { origin: '*' }
	    });
	    
	    var my_num = Number('${loginMember.getMb_num()}');
	    
	    //본인 회원번호 소켓에 저장
	    socket.emit("REGIST",my_num);
	    
		socket.on('INVITE',function(who){
			$('#chat_btn').append("<button class='chat-open-dialog' onclick='go_chat("+'"'+who.my_name+'"'+")'> <span class='fa fa-question'></span></button><button class='chat-button-destroy' onclick='exit_chat()'><span class='fa fa-close'></span> </button>");
			socket.emit("JOIN_ROOM",who);
			socket.emit('READY');
		});
	    
	    socket.on('RECEIVE',function(data){
	        if(data.mb_num!=my_num){
	            console.log(data.message)
	            var text = "<div class='bubble friend-bubble'>"+data.message+"</div>"
	            $("#chat-box").append(text);
	        }
	    });

		socket.on('CHAT_LOG',function(data_list){
			$("#chat-box").html('');
		        var text = "";
		        for(var i=0; i<data_list.length;i++){
		            if(data_list[i].ch_mb_num==my_num){
		            	text += "<div class='bubble my-bubble'>"+data_list[i].ch_cont+"</div>";
		            }else{
		            	text += "<div class='bubble friend-bubble'>"+data_list[i].ch_cont+"</div>";
		            }            
		        }
		        $("#chat-box").append(text);
		
		});
		
		function go_chat(your_name){
			$(".chat-open-dialog").toggleClass("active");
			$('.chat-popup').toggleClass("active");
			$("#nick").html(your_name);
			$('.chat-button-destroy').toggleClass("active");
		}
		
		function exit_chat(){
			$('.chat-button-destroy').removeClass("active")
			$('.chat-popup').removeClass("active");
			$('.chat-open-dialog').removeClass("active");
		}
				
    	function send_message(){
	        var my_message = $(".message").val();
	        if (my_message!='') {
	            var text = "<div class='bubble my-bubble'>"+my_message+"</div>"
	            $("#chat-box").append(text);
	            $(".message").val('');
	            var data = new Object();
	            data.message = my_message;
	            socket.emit('SEND',data)
	        } else {
	            alert('메시지를 입력하세요...');
	        }
	    }
		
		function close_chat(){
			$('.chat-popup').removeClass("active");
		}
		
		socket.on('ACCEPTED',function(){
			$('.chat-popup').toggleClass("active");
            if(try_num==0){
            	$(".footer").append("<button id='reserve_btn' onclick='set_reserve()'>예약</button>");
            	try_num =1;
            }
            socket.emit('READY');
		});
		
		
		socket.on('REFUSED',function(){
			alert('상대가 이미 다른 대화에 참여중입니다. 메세지 기록만 남습니다.');
			$('.chat-popup').toggleClass("active");
            if(try_num==0){
            	$(".footer").append("<button id='reserve_btn' onclick='set_reserve()'>예약</button>");
            	try_num =1;
            }
            socket.emit('READY');
		});


    </script>

    <div id='chat_btn'></div>
    <div class="chat-popup">
        <div class="chat-windows">
          <div class="chat-window-one">
              <div class="chat_container">
                  <div class="header">
                    <button class="back-btn" onclick="close_chat()">
                      <img src="${cpath}/resources/images/left-arrow.png" width="30" height="30">
             		
                    </button>
                    <div id="nick"></div>
                  </div>
              
                  <div id="chat-box">
              
                  </div>
              
                  <div class="footer">
                    <textarea id="input" class="message"  placeholder="메시지를 입력하세요..."  autofocus="true"></textarea>
                    <button id="send" onclick="send_message()">
                      <img src="${cpath}/resources/images/send.png" width="24" height="24">  
                    </button>
                  </div>
                </div>
          </div>
        </div>
    </div>
