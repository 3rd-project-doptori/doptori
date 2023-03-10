<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>마이페이지_예약내역</title>

    <!-- ========== All CSS files linkup ========= -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="${cpath}/resources/css/lineicons.css" />
    <link rel="stylesheet" href="${cpath}/resources/css/main.css" />
    <link rel="stylesheet" href="${cpath}/resources/css/notice_qa.css" />
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
	            <div class="tabs">
	            <button class="tab active" onclick="openTab(event, 'tab-1')">
	              <div><span>받은 예약</span></div>
	            </button>
	            <button class="tab" onclick="openTab(event, 'tab-2')">
	              <div><span>신청한 예약</span></div>
	            </button>
	          </div>
           <div class="content">
				
              
 			<div class="content__inner" id="tab-1">
              <div class="table-responsive">
                  <div class="container-fluid">
                    <div class="row justify-content-center">
              <div class="card-style settings-card-1 mb-30">
                <div class="profile-info">
                  <div id="Accordion_wrap">              
                  <!-- 내가 신청을 받은 예약 -->
                  <!-- 두 개 아코디언으로 분리되서 나오면 좋을 듯 합니다 to 예슬 -->
                  <c:forEach items="${list}" var="vo" varStatus="status">
                    <div class="que">
	                     <span>${vo.re_date}에 신청된 예약</span>
	                      <div class="arrow-wrap">
	                       <span class="arrow-top">↑</span>
	                       <span class="arrow-bottom">↓</span>
	                      </div>
	                    </div>
	                    <div class="anw">
	                    <br>
	                     구매자 : ${memberNames[status.index]}
	                     <br>
	                     판매 시간 : ${vo.re_selldate}
	                     <br>
	                     판매 장소 : ${vo.re_place}
	                     <br>
	                     <c:if test='${vo.re_cp_num eq 1}'>
	                     품목 : 딸기
	                     </c:if>
	                     <c:if test='${vo.re_cp_num eq 2}'>
	                     품목 : 토마토
	                     </c:if>
	                     
	                     <br>
	                     가격 : ${vo.re_price}
	                     <br>
	                     무게 : ${vo.re_weight}
	                     <br>
	                     <a href="${cpath}/market_detail.do/${vo.re_bd_num}">판매글</a> 
	                     <br>
	                     <c:if test='${vo.confirmed eq 1}'>
	                     승인됨
	                     </c:if>
						<c:if test='${vo.confirmed eq 0}'>
	                     승인되지 않음
	                     </c:if>
	                     <br>	                     
	                	<button type="button" onclick="re_confirm('${vo.re_num}')">승인하기</button>                
	                    </div>
                    </c:forEach>
                 </div>
               </div>
             </div>
             </div>
             </div>
             </div>
             </div>
          
                 
             <div class="content__inner" id="tab-2">
              <div class="table-responsive">
                  <div class="container-fluid">
                    <div class="row justify-content-center">
              <div class="card-style settings-card-1 mb-30">
                <div class="profile-info">
                <div id="Accordion_wrap">
                  <!-- 내가 신청한 예약 -->
                  <c:forEach items="${list4buyer}" var="bo" varStatus="statusb">
                    <div class="que">
	                     <span>${bo.re_date}에 신청한 예약</span>
	                      <div class="arrow-wrap">
	                       <span class="arrow-top">↑</span>
	                       <span class="arrow-bottom">↓</span>
	                      </div>
	                    </div>
	                    <div class="anw">
	                    <br>
	                     판매자 : ${memberNames4buyer[statusb.index]}
	                     <br>
	                     판매 시간 : ${bo.re_selldate}
	                     <br>
	                     판매 장소 : ${bo.re_place}
	                     <br>
	                     <c:if test='${bo.re_cp_num eq 1}'>
	                     품목 : 딸기
	                     </c:if>
	                     <c:if test='${bo.re_cp_num eq 2}'>
	                     품목 : 토마토
	                     </c:if>
	                     <br>
	                     가격 : ${bo.re_price}
	                     <br>
	                     무게 : ${bo.re_weight}
	                     <br>
	                     <a href="${cpath}/market_detail.do/${bo.re_bd_num}">판매글</a> 
	                     <br>
	                     <c:if test='${bo.confirmed eq 1}'>
	                     승인됨
	                     </c:if>
						<c:if test='${bo.confirmed eq 0}'>
	                     승인되지 않음
	                     </c:if>           
	                    </div>
	                    
	        
                    </c:forEach>
                    

                    
<!--
                    <div class="que">
                     <span>This is second question.</span>
                    </div>
                     <div class="anw">
                     <span>This is second answer.</span>
                    </div>
                    <div class="que">
                     <span>This is third question.</span>
                    </div>
                    <div class="anw">
                     <span>This is third answer.</span>
                    </div> -->
                    
                  </div>
                  
                  
                  
                  
                  
               
                </div>
              </div>
            </div>
            </div>
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
    <!-- ========= All Javascript files linkup ======== -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="${cpath}/resources/js/main1.js"></script>
    <script src="${cpath}/resources/js/notice_qa.js"></script>
        
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
    	function re_confirm(re_num){
    		
    		$.ajax({
    			url: '${cpath}/ConfirmReservation/'+re_num, 
    			type: 'get',
    			success : function(data) {
    				if(data=="confirm"){
    					alert('승인되었습니다');
    				}else{
    					alert('이미 승인한 판매글입니다')
    				}
    			},
    			error : function(){
    				alert('승인 요청 실패!');
    			}
    		});

    	}
    
    </script>
    
    
  </body>
</html>
