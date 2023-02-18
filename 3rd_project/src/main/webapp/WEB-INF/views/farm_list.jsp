<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>영농일지</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <link rel="stylesheet" href="${cpath}/resources/css/farm_management.css">
    </head>
    <body>
        <div class="container py-4">
        <jsp:include page="/WEB-INF/views/header.jsp"/>
        <main>
            <div class="row bg-light">
                <form class="row p-3 gx-3 justify-content-center">
                <label class="col-auto lab">품목</label>
                <div class="col-5">
                    <select class="form-select" id="autoSizingSelect">
                    <option selected>주소</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                    </select>
                </div>
                <div class="col-auto">
                    <button type="submit" class="btn btn-primary">검색</button>
                </div>
                </form>
            </div>
            <div class="table-responsive">
                <div class="d-grid gap-2 d-md-flex justify-content-md-end mar">
                    <button type="button" class="btn btn-outline-secondary btn-sm">다운로드</button>
                </div>
                <table class="table recruit">  

                    <colgroup>  
                        <col width="10%">
                        <col>
                    </colgroup>  
      
            
                    <tbody>  
            
                      <tr class="item">  
                        <td>1</td>
                        <td>아야어</td>  
                      </tr>  
          
                      <tr class="hide">  
                        <td></td>
                        <td>  
        
                          <table class="table">
                            <colgroup>
                              <col width=18%>
                              <col>
                            </colgroup>
                            <thead>
                            <tr>
                              <th scope="col">주소</th>
                              <th>
                                  주소
                              </th>
                            </tr>
                            </thead>
                            <tbody>
                              <tr>
                                <th scope="row">필지면적</th>
                                <td>
                                  필지면적
                                </td>
                              </tr>
                              <tr>
                              <th scope="row">실재배면적</th>
                              <td>
                                실재배면적
                              </td>
                              </tr>
                              <tr>
                                <th scope="row">유휴면적</th>
                                <td>유휴면적</td>
                              </tr>
                              <tr>
                                <th scope="row">토양점검 여부</th>
                                <td>공개/비공개</td>
                              </tr>
                            </tbody>
                          </table>
                          <div class="d-flex justify-content-end">
                            <button type="button" class="btn btn-secondary btn-sm">수정</button>
                            <button type="button" class="btn btn-outline-secondary btn-sm">삭제</button>
                          </div>
        
                        </td>  
                    </tbody>  
            
                </table>  
            </div>
            </main>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="${cpath}/resources/js/farm_management.js"></script>
    </body>
</html>