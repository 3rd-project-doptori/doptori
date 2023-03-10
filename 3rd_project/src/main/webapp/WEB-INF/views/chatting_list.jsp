<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>마이페이지_건의사항</title>

    <!-- ========== All CSS files linkup ========= -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="${cpath}/resources/css/lineicons.css" />
    <link rel="stylesheet" href="${cpath}/resources/css/main.css" />
    
    
    <link rel="stylesheet" href="${cpath}/resources/css/chatting_di.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    
    
  </head>
  <body>
    <!-- ======== sidebar-nav start =========== -->
     <aside class="sidebar-nav-wrapper">
      <div class="navbar-logo">
        <a href="${cpath }/Main.do">
          <img src="${cpath}/resources/images/header_logo.png" class="im">
        </a>
      </div>
      <nav class="sidebar-nav">
        <ul>
          <li class="nav-item">
            <a href="${cpath}/mypage.do">
              <span class="icon">
                <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path
                    d="M9.16667 19.25H12.8333C12.8333 20.2584 12.0083 21.0834 11 21.0834C9.99167 21.0834 9.16667 20.2584 9.16667 19.25ZM19.25 17.4167V18.3334H2.75V17.4167L4.58333 15.5834V10.0834C4.58333 7.24171 6.41667 4.76671 9.16667 3.94171V3.66671C9.16667 2.65837 9.99167 1.83337 11 1.83337C12.0083 1.83337 12.8333 2.65837 12.8333 3.66671V3.94171C15.5833 4.76671 17.4167 7.24171 17.4167 10.0834V15.5834L19.25 17.4167ZM15.5833 10.0834C15.5833 7.51671 13.5667 5.50004 11 5.50004C8.43333 5.50004 6.41667 7.51671 6.41667 10.0834V16.5H15.5833V10.0834Z"
                  />
                </svg>
              </span>
              <span class="text">정보수정</span>
            </a>
          </li>
          <li class="nav-item">
            <a href="${cpath}/reservation.do">
              <span class="icon">
                <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg" >
                  <path
                    d="M17.4166 7.33333C18.9383 7.33333 20.1666 8.56167 20.1666 10.0833V15.5833H16.4999V19.25H5.49992V15.5833H1.83325V10.0833C1.83325 8.56167 3.06159 7.33333 4.58325 7.33333H5.49992V2.75H16.4999V7.33333H17.4166ZM7.33325 4.58333V7.33333H14.6666V4.58333H7.33325ZM14.6666 17.4167V13.75H7.33325V17.4167H14.6666ZM16.4999 13.75H18.3333V10.0833C18.3333 9.57917 17.9208 9.16667 17.4166 9.16667H4.58325C4.07909 9.16667 3.66659 9.57917 3.66659 10.0833V13.75H5.49992V11.9167H16.4999V13.75ZM17.4166 10.5417C17.4166 11.0458 17.0041 11.4583 16.4999 11.4583C15.9958 11.4583 15.5833 11.0458 15.5833 10.5417C15.5833 10.0375 15.9958 9.625 16.4999 9.625C17.0041 9.625 17.4166 10.0375 17.4166 10.5417Z"
                  />
                </svg>
              </span>
              <span class="text">예약내역</span>
            </a>
          </li>
          <li class="nav-item">
            <a href="${cpath}/farm.do">
              <span class="icon">
                <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path
                    d="M4.58333 3.66675H17.4167C17.9029 3.66675 18.3692 3.8599 18.713 4.20372C19.0568 4.54754 19.25 5.01385 19.25 5.50008V16.5001C19.25 16.9863 19.0568 17.4526 18.713 17.7964C18.3692 18.1403 17.9029 18.3334 17.4167 18.3334H4.58333C4.0971 18.3334 3.63079 18.1403 3.28697 17.7964C2.94315 17.4526 2.75 16.9863 2.75 16.5001V5.50008C2.75 5.01385 2.94315 4.54754 3.28697 4.20372C3.63079 3.8599 4.0971 3.66675 4.58333 3.66675ZM4.58333 7.33341V11.0001H10.0833V7.33341H4.58333ZM11.9167 7.33341V11.0001H17.4167V7.33341H11.9167ZM4.58333 12.8334V16.5001H10.0833V12.8334H4.58333ZM11.9167 12.8334V16.5001H17.4167V12.8334H11.9167Z"
                  />
                </svg>
              </span>
              <span class="text">일지관리</span>
            </a>
          </li>
          <li class="nav-item">
            <a href="${cpath}/MyboardList.do">
              <span class="icon">
                <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path
                    d="M9.16667 19.25H12.8333C12.8333 20.2584 12.0083 21.0834 11 21.0834C9.99167 21.0834 9.16667 20.2584 9.16667 19.25ZM19.25 17.4167V18.3334H2.75V17.4167L4.58333 15.5834V10.0834C4.58333 7.24171 6.41667 4.76671 9.16667 3.94171V3.66671C9.16667 2.65837 9.99167 1.83337 11 1.83337C12.0083 1.83337 12.8333 2.65837 12.8333 3.66671V3.94171C15.5833 4.76671 17.4167 7.24171 17.4167 10.0834V15.5834L19.25 17.4167ZM15.5833 10.0834C15.5833 7.51671 13.5667 5.50004 11 5.50004C8.43333 5.50004 6.41667 7.51671 6.41667 10.0834V16.5H15.5833V10.0834Z"
                  />
                </svg>
              </span>
              <span class="text">내가 쓴 글</span>
            </a>
          </li>

          <li class="nav-item">
            <a href="${cpath}/chatting_list.do">
              <span class="icon">
                <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path
                    d="M9.16667 19.25H12.8333C12.8333 20.2584 12.0083 21.0834 11 21.0834C9.99167 21.0834 9.16667 20.2584 9.16667 19.25ZM19.25 17.4167V18.3334H2.75V17.4167L4.58333 15.5834V10.0834C4.58333 7.24171 6.41667 4.76671 9.16667 3.94171V3.66671C9.16667 2.65837 9.99167 1.83337 11 1.83337C12.0083 1.83337 12.8333 2.65837 12.8333 3.66671V3.94171C15.5833 4.76671 17.4167 7.24171 17.4167 10.0834V15.5834L19.25 17.4167ZM15.5833 10.0834C15.5833 7.51671 13.5667 5.50004 11 5.50004C8.43333 5.50004 6.41667 7.51671 6.41667 10.0834V16.5H15.5833V10.0834Z"
                  />
                </svg>
              </span>
              <span class="text">채팅내역</span>
            </a>
          </li>
        </ul>
      </nav>
     
    </aside>
    <div class="overlay"></div>
    <!-- ======== sidebar-nav end =========== -->

    <!-- ======== main-wrapper start =========== -->
    <main class="main-wrapper container py-4">
    

      <!-- ========== section start ========== -->
      <section class="section">
        <div class="container-fluid">
          <div class="row justify-content-center">
            <div class="col-lg-7">
              <div class="title-wrapper pt-30">
                <div class="row text-start">
                  <div class="col-md-3">
                    <div class="title mb-30">
                      <h2>채팅</h2>
                    </div>
                  </div>
                </div>
                <!-- end row -->
              </div>
              <div class="card-style settings-card-1 mb-30">
                <div class="profile-info">
                  <div id="Accordion_wrap">

                  <c:forEach items="${list}" var="vo" varStatus="status">
                    <div class="que">
                     <span onclick="start_chat('${vo.mb_num}','${vo.mb_nick}')">${vo.mb_nick}</span>
                     </div>
                    </c:forEach>
                  </div>
               
                </div>
              </div>
              <!-- end card -->
            </div>
            <!-- end col -->

            
            <!-- end col -->
          </div>
          <!-- end row -->
        </div>
        <!-- end container -->
      </section>
      <!-- ========== section end ========== -->


    </main>
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
    
    <!-- ========= All Javascript files linkup ======== -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="${cpath}/resources/js/main1.js"></script>
  
  
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
			$('#chat_btn').append("<button class='chat-open-dialog' onclick='go_chat()'> <span class='fa fa-question'></span></button><button class='chat-button-destroy' onclick='exit_chat()'><span class='fa fa-close'></span> </button>");
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
		
		function go_chat(){
			$(".chat-open-dialog").toggleClass("active");
			$('.chat-popup').toggleClass("active");
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
            socket.emit('READY');
		});
		
		socket.on('REFUSED',function(){
			alert('상대가 이미 다른 대화에 참여중입니다. 메세지 기록만 남습니다.');
			$('.chat-popup').toggleClass("active");
            socket.emit('READY');
		});
		
	       var my_num = Number('${loginMember.getMb_num()}');
	       var start_num = 0
	       
	      function start_chat(you,nick){
	    		$("#nick").html(nick);

	          if(start_num==0){
	            var your_num = you;
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

    </script>
    </body>
</html>
