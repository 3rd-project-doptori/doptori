<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Settings | PlainAdmin Demo</title>

    <!-- ========== All CSS files linkup ========= -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="${cpath}/resources/css/lineicons.css" />
    <link rel="stylesheet" href="${cpath}/resources/css/main.css" />
    <style type="text/css">
    	.select_img img	{margin: 20px 0; }
    </style>
    <script type="text/javascript">
	//회원탈퇴
	function memberDeleteView(){
		location.href = "${cpath}/memberDeleteView.do"
	}
	//수정
	function userUpdate() {
		location.href = "${cpath}/userUpdate.do"
	}
  </script>
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
                      <h2>정보수정</h2>
                    </div>
                  </div>
                </div>
                <!-- end row -->
              </div>
              <div class="card-style settings-card-1 mb-30">
                <div class="profile-info">
                
                
                <form class="form-horizontal" id="updateMember"  onsubmit="return confirm('수정하시겠습니까?');" action="${cpath}/userUpdate.do" method="post" enctype="multipart/form-data">
					
                  	<!-- 프로필 사진 -->
					<div class="input-style-1">
						<label>프로필 사진 : <img src="${cpath}/resources/images/${loginMember.mb_pic}" alt="" style="width: 7.5rem;"/></label>
						<div class="col-sm-10">
							<input type="file" name="uploadFile" onchange="previewImage(this)"/>
							<img id="preview" style="width: 10rem;">
						</div>
					</div>
					
					<!-- 아이디 -->
					<div class="input-style-1">
						<label>아이디 : </label>
						<div class="col-sm-10">
							<input type="text" name="mb_id" value="${loginMember.mb_id}" readonly="readonly">
						</div>
					</div>

					<!-- 비밀번호 -->
					<div class="input-style-1">
						<label>비밀번호 : </label>
						<div class="col-sm-10">
							<input type="password" placeholder="비밀번호를 입력하세요."  value="${loginMember.mb_pw}"/>
						</div>
					</div>
					<!-- 비밀번호 확인-->
					<div class="input-style-1">
						<label>비밀번호 확인 : </label>
						<div class="col-sm-10">
							<input type="password" placeholder="비밀번호를 입력하세요."
							name="mb_pw" value="${loginMember.mb_pw}"></input>
						</div>
					</div>
					
					<!-- 닉네임 -->
					<div class="input-style-1">
						<label>닉네임 : </label>
						<div class="col-sm-10">
							<input type="text" name="mb_nick" placeholder="닉네임을 입력하세요."
								value="${loginMember.mb_nick}">
						</div>
					</div>

					<!-- 회원구분-->
					<div class="input-style-1">
					     <label class="control-label col-sm-2" for="mb_type">회원구분 : </label>
							<c:if test="${loginMember.mb_id=='admin'}">
							<div class="form-check-inline">
					                   <input name="mb_type" type="radio" class="" value="0">
					        		ㅤ관리자
					        </div>
					        </c:if>
					        <div class="form-check-inline">
					             	     <input name="mb_type" type="radio" class="" value="2">
					       			ㅤ일반인
					        </div>
					        <div class="form-check-inline">
					              	    <input name="mb_type" type="radio" class="" value="1" checked>
					       			ㅤ영농인
					       </div>
					</div>


					<!-- 작성 완료 / 취소 -->
					<div class="form-group">
					<div class="col-12 d-flex justify-content-center">
						<button type="submit" class="btn btn-sm btn-outline-secondary me-md-2">수정</button>
						<a class="btn btn-sm btn-outline-secondary me-md-2" href="javascript:history.go(-1)">취소</a>
						<button class="btn btn-sm btn-outline-secondary" onclick="memberDeleteView()">회원탈퇴</button>
					</div>
					</div>
				</form>
				</div>	

				
					
				    <!-- 
                    <div class="anw">
                     <span>This is first answer.</span>
                    </div>
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
                    </div>
                  </div> -->
                  
                   
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
    <script>
	  function previewImage(input) {
	    var file = input.files[0];
	    var img = document.getElementById("preview");
	    if (file.type.match('image.*')) {
	      var reader = new FileReader();
	      reader.onload = (function(img) {
	        return function(e) {
	          img.src = e.target.result;
	        };
	      })(img);
	      reader.readAsDataURL(file);
	    }
	  }
	</script>
    <!-- ========= All Javascript files linkup ======== -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="${cpath}/resources/js/moment.min.js"></script>
    <script src="${cpath}/resources/js/jvectormap.min.js"></script>
    <script src="${cpath}/resources/js/world-merc.js"></script>
    <script src="${cpath}/resources/js/polyfill.js"></script>
  </body>
</html>
