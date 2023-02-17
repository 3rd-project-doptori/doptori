<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
    <meta name="generator" content="Hugo 0.104.2">
    <title>병해충분석/생육과정분석</title>

    <script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="${cpath}/resources/css/analysis.css">


    
  </head>
  <body>
    
    <main>
        <div class="container py-4">
        <jsp:include page="/WEB-INF/views/header.jsp"/>
            <h2 class="display-7 fw-bold">농작물분석</h2>
            <div class="row align-items-md-stretch">
                <div class="col-md-6">
                    <div class="h-100 p-5 border rounded-3">
                	<h2 class="h2">병해충분석하기</h2>
                        <div class="d-flex justify-content-center top">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                                <label class="form-check-label" for="inlineRadio1">설향</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                                <label class="form-check-label" for="inlineRadio2">금실</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option2">
                                <label class="form-check-label" for="inlineRadio3">토마토</label>
                            </div>
                        </div>
                        <div class="dropzone rounded-3">
							
                        </div>
                        
                        <!-- 포스팅 - 이미지/동영상 dropzone 영역 -->
                        <ul class="list-unstyled mb-0" id="dropzone-preview">
                            <li class="mt-2" id="dropzone-preview-list">
                                <!-- This is used as the file preview template -->
                                <div class="border rounded-3">
                                <div class="d-flex align-items-center p-2">
                                    <div class="flex-shrink-0 me-3">
                                    <div class="width-8 h-auto rounded-3">
                                        <img data-dz-thumbnail="data-dz-thumbnail" class="w-full h-auto rounded-3 block" src="#" alt="Dropzone-Image" style="width: 120px;"/>
                                    </div>
                                    </div>
                                    <div class="flex-grow-1">
                                    <div class="pt-1">
                                        <h6 class="font-semibold mb-1" data-dz-name="data-dz-name">&nbsp;</h6>
                                        <p class="text-sm text-muted fw-normal" data-dz-size="data-dz-size"></p>
                                        <strong class="error text-danger" data-dz-errormessage="data-dz-errormessage"></strong>
                                    </div>
                                    </div>
                                    <div class="shrink-0 ms-3">
                                    <button data-dz-remove="data-dz-remove" class="btn btn-sm">
                                        <img src="resources/images/imgupload2.png" alt="" class="img-fluid">
                                    </button>
                                    </div>
                                </div>
                                </div>
                            </li>
                        </ul>
                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                            <button class="btn btn-outline-secondary but" type="button">등록</button>
                        </div>
                    </div>
                

                </div>
                <div class="col-md-6">
                    <div class="h-100 p-5 bg-light border rounded-3">
                        <h2>결과보기</h2>
                        <p>Or, keep it light and add a border for some added definition to the boundaries of your content. Be sure to look under the hood at the source HTML here as we've adjusted the alignment and sizing of both column's content for equal-height.</p>
                        <button class="btn btn-outline-secondary" type="button">Example button</button>
                    </div>
                </div>
            </div>
                
        </div>
    </main>


    <script src="${cpath}/resources/js/analysis.js"></script>
  </body>
</html>
