<%@page import="com.doptori.entity.Farm"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>영농일지_세부사항</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" type="text/css" href="${cpath}/resources/assets/css/bootstrap.min.css" >
    <!-- Icon -->
    <link rel="stylesheet" type="text/css" href="${cpath}/resources/assets/fonts/line-icons.css">
    <!-- Main Style -->
    <link rel="stylesheet" type="text/css" href="${cpath}/resources/assets/css/main.css">
    <!-- Responsive Style -->
    <link rel="stylesheet" type="text/css" href="${cpath}/resources/assets/css/responsive.css">

  </head>
  <body>
	<div class="btn-group" role="group" aria-label="Basic example">
  <button type="button" class="btn btn-primary" onclick = gocal()>켈린더</button>

  <button type="button" class="btn btn-primary" onclick = godiary()>영농일지</button>
	</div>
    <!-- Schedule Section Start -->
    <section id="schedules" class="schedule section-padding">
      <div class="container">
        <div class="row">
          <div class="col-12 mb-5 text-center">
            <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item">
            <a class="nav-link" href="<c:url value='/MakeFarm.do'/>">농장만들기</a>
            </li>
              <c:forEach items="${FarmList2}" var="fl" varStatus="status">
              <li class="nav-item">
                <a class="nav-link" id="${fl.fm_num}" data-toggle="tab" role="tab" aria-controls="monday" onclick="DiaryList(${fl.fm_num})">
                  <div class="item-text">
						<h4>${fl.fm_name}</h4>
						<h5>${fl.fm_dong}</h5>
                  </div>
                </a>
              </li>
				</c:forEach>
              <!-- <li class="nav-item">
                <a class="nav-link" id="wednesday-tab" data-toggle="tab" href="#wednesday" role="tab" aria-controls="wednesday">
                  <div class="item-text">
                    <h4>Day 03</h4>
                    <h5>16 February 2020</h5>
                  </div>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="thursday-tab" data-toggle="tab" href="#thursday" role="tab" aria-controls="thursday">
                  <div class="item-text">
                    <h4>Day 04</h4>
                    <h5>17 February 2020</h5>
                  </div>
                </a>
              </li> -->
            </ul>
          </div>
          <div class="col-12">
            <div class="schedule-area row wow fadeInDown" data-wow-delay="0.3s">
              <div class="schedule-tab-content col-12 clearfix">
                <div class="tab-content" id="myTabContent">
                  <div class="tab-pane fade show active" id="monday" role="tabpanel" aria-labelledby="monday-tab">
                    <div id="accordion">
                    <div class="panel-body" id="wform" style="display:none">
                    test
                    </div>
                      <div class="panel-body" id="list" style="display:block">
                      <div class="card">
                        <div id="headingOne">
                          <div class="schedule-slot-time">
                            2023.02.03
                          </div>
                          <div class="collapsed card-header" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                            <div class="images-box">
                              <img class="img-fluid" src="assets/img/speaker/speakers-1.jpg" alt="">
                            </div>                     
                            <h4>Web Design Principles and Best Practices</h4>
                          </div>
                        </div>
                        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                          <div class="card-body">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet minima dolores rerum maiores qui at commodi quas, reprehenderit eius consectetur quae magni molestias veniam, provident illum facere iure libero asperiores! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam earum nihil ex ipsa magni eligendi fugiat assumenda suscipit, accusantium, necessitatibus reiciendis odit sed, vero amet blanditiis?</p>
                            <div class="location">
                              <span>Location:</span> Hall 1 , Building A, Golden Street, Southafrica
                            </div>
                          </div>
                        </div>
                      </div>
                      </div>
                        
                      <!-- <div class="card">
                        <div id="headingTwo">
                          <div class="schedule-slot-time">
                            <span> 10.30 - 11.30 AM</span>
                            Workshop
                          </div>
                          <div class="collapsed card-header" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            <div class="images-box">
                              <img class="img-fluid" src="assets/img/speaker/speakers-2.jpg" alt="">
                            </div>
                            <h4>15 Free Productive Design Tools</h4>
                            <h5 class="name">David Warner</h5>
                          </div>
                        </div>
                        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                          <div class="card-body">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet minima dolores rerum maiores qui at commodi quas, reprehenderit eius consectetur quae magni molestias veniam, provident illum facere iure libero asperiores! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam earum nihil ex ipsa magni eligendi fugiat assumenda suscipit, accusantium, necessitatibus reiciendis odit sed, vero amet blanditiis?</p>
                            <div class="location">
                              <span>Location:</span> Hall 1 , Building A, Golden Street, Southafrica
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="card">
                        <div id="headingThree">
                          <div class="schedule-slot-time">
                            <span> 11.30 - 12.30 AM</span>
                            Workshop
                          </div>
                          <div class="collapsed card-header" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                            <div class="images-box">
                              <img class="img-fluid" src="assets/img/speaker/speakers-3.jpg" alt="">
                            </div>
                            <h4>Getting Started With SketchApp</h4>
                            <h5 class="name">David Warner</h5>
                          </div>
                        </div>
                        <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
                          <div class="card-body">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet minima dolores rerum maiores qui at commodi quas, reprehenderit eius consectetur quae magni molestias veniam, provident illum facere iure libero asperiores! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam earum nihil ex ipsa magni eligendi fugiat assumenda suscipit, accusantium, necessitatibus reiciendis odit sed, vero amet blanditiis?</p>
                            <div class="location">
                              <span>Location:</span> Hall 1 , Building A, Golden Street, Southafrica
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="tab-pane fade" id="tuesday" role="tabpanel" aria-labelledby="tuesday-tab">
                    <div id="accordion2">
                      <div class="card">
                        <div id="headingOne1">
                          <div class="schedule-slot-time">
                            <span> 1.30 - 2.30 AM</span>
                            Workshop
                          </div>
                          <div class="collapsed card-header" data-toggle="collapse" data-target="#collapseTwo2" aria-expanded="false" aria-controls="collapseTwo2">
                            <div class="images-box">
                              <img class="img-fluid" src="assets/img/speaker/speakers-2.jpg" alt="">
                            </div>
                            <h4>Web Design Principles and Best Practices</h4>
                            <h5 class="name">David Warner</h5>
                          </div>
                        </div>
                        <div id="collapseOne1" class="collapse show" aria-labelledby="headingOne1" data-parent="#accordion2">
                          <div class="card-body">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet minima dolores rerum maiores qui at commodi quas, reprehenderit eius consectetur quae magni molestias veniam, provident illum facere iure libero asperiores! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam earum nihil ex ipsa magni eligendi fugiat assumenda suscipit, accusantium, necessitatibus reiciendis odit sed, vero amet blanditiis?</p>
                            <div class="location">
                              <span>Location:</span> Hall 1 , Building A, Golden Street, Southafrica
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="card">
                        <div id="headingTwo2">
                          <div class="schedule-slot-time">
                            <span> 9.30 - 10.30 AM</span>
                            Workshop
                          </div>
                          <div class="collapsed card-header" data-toggle="collapse" data-target="#collapseOne1" aria-expanded="false" aria-controls="collapseOne1">
                            <div class="images-box">
                              <img class="img-fluid" src="assets/img/speaker/speakers-1.jpg" alt="">
                            </div>
                            <h4>Web Design Principles and Best Practices</h4>
                            <h5 class="name">David Warner</h5>
                          </div>
                        </div>
                        <div id="collapseTwo2" class="collapse" aria-labelledby="headingTwo2" data-parent="#accordion2">
                          <div class="card-body">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet minima dolores rerum maiores qui at commodi quas, reprehenderit eius consectetur quae magni molestias veniam, provident illum facere iure libero asperiores! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam earum nihil ex ipsa magni eligendi fugiat assumenda suscipit, accusantium, necessitatibus reiciendis odit sed, vero amet blanditiis?</p>
                            <div class="location">
                              <span>Location:</span> Hall 1 , Building A, Golden Street, Southafrica
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="tab-pane fade" id="wednesday" role="tabpanel" aria-labelledby="wednesday-tab">
                    <div id="accordion3">
                      <div class="card">
                        <div id="headingOne3">
                          <div class="schedule-slot-time">
                            <span> 10.30 - 11.30 AM</span>
                            Workshop
                          </div>
                          <div class="collapsed card-header" data-toggle="collapse" data-target="#collapseOne3" aria-expanded="false" aria-controls="collapseOne3">
                            <div class="images-box">
                              <img class="img-fluid" src="assets/img/speaker/speakers-1.jpg" alt="">
                            </div>
                            <h4>Web Design Principles and Best Practices</h4>
                            <h5 class="name">David Warner</h5>
                          </div>
                        </div>
                        <div id="collapseOne3" class="collapse show" aria-labelledby="headingOne3" data-parent="#accordion3">
                          <div class="card-body">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet minima dolores rerum maiores qui at commodi quas, reprehenderit eius consectetur quae magni molestias veniam, provident illum facere iure libero asperiores! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam earum nihil ex ipsa magni eligendi fugiat assumenda suscipit, accusantium, necessitatibus reiciendis odit sed, vero amet blanditiis?</p>
                            <div class="location">
                              <span>Location:</span> Hall 1 , Building A, Golden Street, Southafrica
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="card">
                        <div id="headingTwo3">
                          <div class="schedule-slot-time">
                            <span> 11.30 - 12.30 AM</span>
                            Workshop
                          </div>
                          <div class="collapsed card-header" data-toggle="collapse" data-target="#collapseTwo3" aria-expanded="false" aria-controls="collapseTwo3">
                            <div class="images-box">
                              <img class="img-fluid" src="assets/img/speaker/speakers-2.jpg" alt="">
                            </div>
                            <h4>Web Design Principles and Best Practices</h4>
                            <h5 class="name">David Warner</h5>
                          </div>
                        </div>
                        <div id="collapseTwo3" class="collapse" aria-labelledby="headingTwo3" data-parent="#accordion3">
                          <div class="card-body">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet minima dolores rerum maiores qui at commodi quas, reprehenderit eius consectetur quae magni molestias veniam, provident illum facere iure libero asperiores! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam earum nihil ex ipsa magni eligendi fugiat assumenda suscipit, accusantium, necessitatibus reiciendis odit sed, vero amet blanditiis?</p>
                            <div class="location">
                              <span>Location:</span> Hall 1 , Building A, Golden Street, Southafrica
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="card">
                        <div id="headingThree3">
                          <div class="schedule-slot-time">
                            <span> 1.30 - 2.30 AM</span>
                            Workshop
                          </div>
                          <div class="collapsed card-header" data-toggle="collapse" data-target="#collapseThree3" aria-expanded="false" aria-controls="collapseThree3">
                            <div class="images-box">
                              <img class="img-fluid" src="assets/img/speaker/speakers-3.jpg" alt="">
                            </div>
                            <h4>Web Design Principles and Best Practices</h4>
                            <h5 class="name">David Warner</h5>
                          </div>
                        </div>
                        <div id="collapseThree3" class="collapse" aria-labelledby="headingThree3" data-parent="#accordion3">
                          <div class="card-body">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet minima dolores rerum maiores qui at commodi quas, reprehenderit eius consectetur quae magni molestias veniam, provident illum facere iure libero asperiores! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam earum nihil ex ipsa magni eligendi fugiat assumenda suscipit, accusantium, necessitatibus reiciendis odit sed, vero amet blanditiis?</p>
                            <div class="location">
                              <span>Location:</span> Hall 1 , Building A, Golden Street, Southafrica
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="tab-pane fade" id="thursday" role="tabpanel" aria-labelledby="thursday-tab">
                    <div id="accordion4">
                      <div class="card">
                        <div id="headingOne">
                          <div class="schedule-slot-time">
                            <span> 9.30 - 10.30 AM</span>
                            Workshop
                          </div>
                          <div class="collapsed card-header" data-toggle="collapse" data-target="#collapseOne4" aria-expanded="false" aria-controls="collapseOne4">
                            <div class="images-box">
                              <img class="img-fluid" src="assets/img/speaker/speakers-2.jpg" alt="">
                            </div>
                            <h4>Web Design Principles and Best Practices</h4>
                            <h5 class="name">David Warner</h5>
                          </div>
                        </div>
                        <div id="collapseOne4" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion4">
                          <div class="card-body">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet minima dolores rerum maiores qui at commodi quas, reprehenderit eius consectetur quae magni molestias veniam, provident illum facere iure libero asperiores! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam earum nihil ex ipsa magni eligendi fugiat assumenda suscipit, accusantium, necessitatibus reiciendis odit sed, vero amet blanditiis?</p>
                            <div class="location">
                              <span>Location:</span> Hall 1 , Building A, Golden Street, Southafrica
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="card">
                        <div id="headingTwo">
                          <div class="schedule-slot-time">
                            <span> 10.30 - 11.30 AM</span>
                            Workshop
                          </div>
                          <div class="collapsed card-header" data-toggle="collapse" data-target="#collapseTwo4" aria-expanded="false" aria-controls="collapseTwo4">
                            <div class="images-box">
                              <img class="img-fluid" src="assets/img/speaker/speakers-1.jpg" alt="">
                            </div>
                            <h4>Web Design Principles and Best Practices</h4>
                            <h5 class="name">David Warner</h5>
                          </div>
                        </div>
                        <div id="collapseTwo4" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion4">
                          <div class="card-body">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet minima dolores rerum maiores qui at commodi quas, reprehenderit eius consectetur quae magni molestias veniam, provident illum facere iure libero asperiores! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam earum nihil ex ipsa magni eligendi fugiat assumenda suscipit, accusantium, necessitatibus reiciendis odit sed, vero amet blanditiis?</p>
                            <div class="location">
                              <span>Location:</span> Hall 1 , Building A, Golden Street, Southafrica
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="card">
                        <div id="headingThree4">
                          <div class="schedule-slot-time">
                            <span> 11.30 - 12.30 AM</span>
                            Workshop
                          </div>
                          <div class="collapsed card-header" data-toggle="collapse" data-target="#collapseThree4" aria-expanded="false" aria-controls="collapseThree4">
                            <div class="images-box">
                              <img class="img-fluid" src="assets/img/speaker/speakers-3.jpg" alt="">
                            </div>
                            <h4>Web Design Principles and Best Practices</h4>
                            <h5 class="name">David Warner</h5>
                          </div>
                        </div>
                        <div id="collapseThree4" class="collapse" aria-labelledby="headingThree" data-parent="#accordion4">
                          <div class="card-body">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet minima dolores rerum maiores qui at commodi quas, reprehenderit eius consectetur quae magni molestias veniam, provident illum facere iure libero asperiores! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam earum nihil ex ipsa magni eligendi fugiat assumenda suscipit, accusantium, necessitatibus reiciendis odit sed, vero amet blanditiis?</p>
                            <div class="location">
                              <span>Location:</span> Hall 1 , Building A, Golden Street, Southafrica
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="tab-pane fade" id="friday" role="tabpanel" aria-labelledby="friday-tab">
                    <div id="accordion">
                      <div class="card">
                        <div id="headingOne">
                          <div class="schedule-slot-time">
                            <span> 9.30 - 10.30 AM</span>
                            Workshop
                          </div>
                          <div class="collapsed card-header" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            <div class="images-box">
                              <img class="img-fluid" src="assets/img/speaker/speakers-2.jpg" alt="">
                            </div>
                            <h4>Web Design Principles and Best Practices</h4>
                            <h5 class="name">David Warner</h5>
                          </div>
                        </div>
                        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                          <div class="card-body">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet minima dolores rerum maiores qui at commodi quas, reprehenderit eius consectetur quae magni molestias veniam, provident illum facere iure libero asperiores! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam earum nihil ex ipsa magni eligendi fugiat assumenda suscipit, accusantium, necessitatibus reiciendis odit sed, vero amet blanditiis?</p>
                            <div class="location">
                              <span>Location:</span> Hall 1 , Building A, Golden Street, Southafrica
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="card">
                        <div id="headingTwo">
                          <div class="schedule-slot-time">
                            <span> 10.30 - 11.30 AM</span>
                            Workshop
                          </div>
                          <div class="collapsed card-header" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                            <div class="images-box">
                              <img class="img-fluid" src="assets/img/speaker/speakers-1.jpg" alt="">
                            </div>
                            <h4>Web Design Principles and Best Practices</h4>
                            <h5 class="name">David Warner</h5>
                          </div>
                        </div>
                        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                          <div class="card-body">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet minima dolores rerum maiores qui at commodi quas, reprehenderit eius consectetur quae magni molestias veniam, provident illum facere iure libero asperiores! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam earum nihil ex ipsa magni eligendi fugiat assumenda suscipit, accusantium, necessitatibus reiciendis odit sed, vero amet blanditiis?</p>
                            <div class="location">
                              <span>Location:</span> Hall 1 , Building A, Golden Street, Southafrica
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="card">
                        <div id="headingThree">
                          <div class="schedule-slot-time">
                            <span> 11.30 - 12.30 AM</span>
                            Workshop
                          </div>
                          <div class="collapsed card-header" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                            <div class="images-box">
                              <img class="img-fluid" src="assets/img/speaker/speakers-3.jpg" alt="">
                            </div>
                            <h4>Web Design Principles and Best Practices</h4>
                            <h5 class="name">David Warner</h5>
                          </div>
                        </div>
                        <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
                          <div class="card-body">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet minima dolores rerum maiores qui at commodi quas, reprehenderit eius consectetur quae magni molestias veniam, provident illum facere iure libero asperiores! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam earum nihil ex ipsa magni eligendi fugiat assumenda suscipit, accusantium, necessitatibus reiciendis odit sed, vero amet blanditiis?</p>
                            <div class="location">
                              <span>Location:</span> Hall 1 , Building A, Golden Street, Southafrica
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section> -->
    <!-- Schedule Section End -->


    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script type="text/javascript">

	$(document).ready(function(){
			// boardList라고 하는 함수가 실행!
			// 자바스크립트의 호이스팅
			FarmList2();	
		});
	
	function DiaryList(fm_num){
  		$.ajax({
  			url: "${cpath}/DiaryList.do/" + fm_num,
  			type: "get",
  			// 보내줄 데이터가 없어서 data:___ 적을게 없음
  			dataType: "json", // 서버가 클라이언트에게 돌려주는 데이터 형식
  			success: callBack, // ajax에서 함수를 부르는 경우 뒤에 ()적지 않는다!!
  			error: function(){
  				alert("error");
  			}
  			
  		});// ajax 끝!!
  		
  	}// DiaryList 함수 끝!!
  	
  	function callBack(data){
  		// alert("데이터 통신 확인");
  		console.log(data);
  		var bList = "";
  		$.each(data, (index, obj)=>{
  		bList += "<div class='card'>";
  		bList += "<div id='heading" + obj.di_num + "'>";
  		bList += "<div class='schedule-slot-time'>";
  		bList += "<p>" + obj.di_date + "</p>";
  		bList += "</div>";
  		bList += "<div class='collapsed card-header' data-toggle='collapse' data-target='#collapse" + obj.di_num + "' aria-expanded='False' aria-controls='collapse" + obj.di_num + "'>";
  		bList += "<div class='images-box'>";
  		bList += "<img class='img-fluid' src='${cpath}/resources/assets/img/speaker/speakers-1.jpg' alt=''>";
  		bList += "</div>";
  		bList += "<h4>" + obj.di_note + "</h4>";
  		bList += "</div>";
  		bList += "</div>";
  		bList += "<div id='collapse" + obj.di_num + "' class='collapse' aria-labelledby='heading" + obj.di_num + "' data-parent='#accordion'>";
  		bList += "<div class='card-body'>";
  		bList += "<p>";
  		var conts = obj.di_cont;
  		cont = conts.split("/");
  		bList += "재배관리 : " + "<br>";
  		bList += cont[0] + "<br><br>";
  		bList += "농약/비료/유기농자재관리 : " + "<br>";
  		bList += cont[1] + "<br><br>";
  		bList += "수확관리 : " + "<br>";
  		bList += cont[2] + "<br><br>";
  		bList += "출하관리 : " + "<br>";
  		bList += cont[3] + "<br>";
  		bList += "</p>";
  		bList += "</div>";
  		bList += "<div class='location'>";
  		bList += "<span>Location:</span> Hall 1 , Building A, Golden Street, Southafrica";
  		bList += "</div>";
  		bList += "</div>";
  		bList += "</div>";
  		bList += "</div>";
  		});// each 끝!!
  		$("#list").html(bList);
  		
  	}// callBack 함수 끝!!
  	
  	function gocal(){
  		location.href="<c:url value='/calendar.do/${loginMember.getMb_num()}'/>"  		
  	}
  	
  	function godiary(){
  		location.href = "${cpath}/FarmList2.do"
  	}
	</script>
	
    <script src="${cpath}/resources/assets/js/jquery-min.js"></script>
    <script src="${cpath}/resources/assets/js/popper.min.js"></script>
    <script src="${cpath}/resources/assets/js/bootstrap.min.js"></script>
    <script src="${cpath}/resources/assets/js/jquery.countdown.min.js"></script>
    <script src="${cpath}/resources/assets/js/jquery.counterup.min.js"></script>
  </body>
</html>
