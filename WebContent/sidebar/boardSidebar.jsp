<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<style>
.w3-theme {color:#fff !important;background-color:#4CAF50 !important}
.w3-btn {background-color:#4CAF50;margin-bottom:4px}
.w3-code{border-left:4px solid #4CAF50}
.myMenu {margin-bottom:150px}


</style>
<body class="w3-theme-l5">
<div class="w3-top" >
  <div class="w3-row w3-white w3-padding">
    <div class="w3-half" style="margin:4px 0 6px 0">
    <a href='https://www.w3schools.com'>
    <img src='/Project/images/w3schools.png' alt='W3Schools.com'></a>
    </div>
    <div class="w3-half w3-margin-top w3-wide w3-hide-medium w3-hide-small">
    <div class="w3-right">THE WORLD'S LARGEST WEB DEVELOPER SITE</div></div>
  </div>
 
 
  <div class="w3-bar w3-blue-grey w3-large" style="z-index:4;">
   <a class="w3-left" href="<%=request.getContextPath()%>/mainPage/main.jsp" 
   style="margin-top:15px; margin-left:15px; margin-right:15">
   <img src="/Project/images/school1.png" ></a>
   
   <a class="w3-bar-item w3-button w3-hide-medium w3-hide-small w3-hover-white w3-padding-16" 
   href="<%=request.getContextPath()%>/mainPage/main.jsp" >메인</a>
   <a class="w3-bar-item w3-button w3-hide-medium w3-hover-white w3-padding-16" 
   href="<%=request.getContextPath()%>/board/schoolmateList.jsp" >게시판</a>
   <a class="w3-bar-item w3-button w3-hide-medium w3-hover-white w3-padding-16" 
   href="<%=request.getContextPath()%>/header/lounge.jsp" >라운지</a>
   
   <!-- 알림창 -->
    <div class="w3-dropdown-hover w3-hide-small">
  <button class="w3-button w3-hide-medium w3-hover-white w3-padding-16" title="Notifications">
  <i class="fa fa-bell" style="font-size:24px"></i>
  <span class="w3-badge w3-right w3-small w3-green">3</span>
  </button>    
   
    <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px">
      <a href="#" class="w3-bar-item w3-button">One new friend request</a>
      <a href="#" class="w3-bar-item w3-button">John Doe posted on your wall</a>
      <a href="#" class="w3-bar-item w3-button">Jane likes your post</a>
    </div>
  </div>
   <!-- 알림창 -->
  
  <!--해더 오른쪽 위 설정  -->
  	<div class="w3-dropdown-hover w3-hide-medium w3-right">
     <button class="w3-button w3-hide-medium w3-hover-white w3-padding-16 ">
     <i class="fa fa-bars" style="font-size:26.7px"></i>
     </button>     
     
    <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px;right:1px">
      <a href="updateLoginForm" 
      class="w3-bar-item w3-button">회원정보</a>
      <a href="<%=request.getContextPath()%>/start/logoutPro.jsp" 
      class="w3-bar-item w3-button">로그아웃</a>

	<c:if test="${myId=='admin'}">
      		<a href="<%=request.getContextPath()%>/mainPage/admin.jsp" 
      		class="w3-bar-item w3-button">[회원관리]</a>
	</c:if>
    </div>
 	</div>
 	
  </div>
  <div class="w3-sidebar w3-bar-block w3-white " style="z-index:3;width:260px;" >
  <div class="w3-padding-50 w3-large w3-text-grey" style="font-weight:bold; margin-top:20px ">
  <div class="w3-card w3-round w3-white" style="width:240px; margin-left:10px">
  
    <h4>학생 명단</h4>
  <a class="w3-bar-item w3-button" href="/Project/board/schoolmateList.jsp?index=1">${schemt }</a>
  <a class="w3-bar-item w3-button" href="/Project/board/schoolmateList.jsp?index=2">${schmid }</a>
  <a class="w3-bar-item w3-button" href="/Project/board/schoolmateList.jsp?index=3">${schhigh }</a>
  
  </div>
</div>
 </div>

  
</div>






</body>
</html>
  
   