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
<style type="text/css">
.form-style-2{
	max-width: 500px;
	padding: 20px 12px 10px 20px;
	font: 13px Arial, Helvetica, sans-serif;
}
.form-style-2-heading{
	font-style: italic;
	border-bottom: 2px solid #ddd;
	margin-bottom: 20px;
	font-size: 15px;
	padding-bottom: 3px;
}
.form-style-2 label{
	display: block;
	margin: 0px 0px 15px 0px;
}
.form-style-2 label > span{
	width: 100px;
	font-weight: bold;
	float: left;
	padding-top: 8px;
	padding-right: 5px;
}
.form-style-2 span.required{
	color:red;
}
.form-style-2 .tel-number-field{
	width: 40px;
	text-align: center;
}
.form-style-2 input.input-field{
	width: 48%;
	
}

.form-style-2 input.input-field, 

 .form-style-2 .select-field{
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	border: 1px solid #C2C2C2;
	box-shadow: 1px 1px 4px #EBEBEB;
	-moz-box-shadow: 1px 1px 4px #EBEBEB;
	-webkit-box-shadow: 1px 1px 4px #EBEBEB;
	border-radius: 3px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	padding: 7px;
	outline: none;
}
.form-style-2 .input-field:focus, 
  
.form-style-2 .select-field:focus{
	border: 1px solid #0C0;
}

.form-style-2 input[type=submit],
.form-style-2 input[type=button]{
	border: none;
	padding: 8px 15px 8px 15px;
	background: #FF8500;
	color: #fff;
	box-shadow: 1px 1px 4px #DADADA;
	-moz-box-shadow: 1px 1px 4px #DADADA;
	-webkit-box-shadow: 1px 1px 4px #DADADA;
	border-radius: 3px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
}
.form-style-2 input[type=submit]:hover,
.form-style-2 input[type=button]:hover{
	background: #EA7B00;
	color: #fff;
}

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
   <a class="w3-left" href="mainPage" 
   style="margin-top:15px; margin-left:15px; margin-right:15">
   <img src="/Project/images/school1.png" ></a>
   
   <a class="w3-bar-item w3-button w3-hide-medium w3-hide-small w3-hover-white w3-padding-16" 
   href="mainPage" >메인</a>
   <a class="w3-bar-item w3-button w3-hide-medium w3-hover-white w3-padding-16" 
   href="schoolBoard" >게시판</a>
   <a class="w3-bar-item w3-button w3-hide-medium w3-hover-white w3-padding-16" 
   href="lounge" >라운지</a>
   
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
      <a href="logout" 
      class="w3-bar-item w3-button">로그아웃</a>

	<c:if test="${myId=='admin'}">
      		<a href="admin" 
      		class="w3-bar-item w3-button">[회원관리]</a>
	</c:if>
    </div>
 	</div>
 	
  </div>
  <div class="w3-sidebar w3-bar-block w3-white " style="z-index:3;width:260px;" >
  <div class="w3-padding-50 w3-large w3-text-grey" style="font-weight:bold; margin-top:20px ">
  <div class="w3-card w3-round w3-white" style="width:240px; margin-left:10px">
    <a href="#" class="w3-bar-item w3-button">아이디 찾기</a>
    <a href="#" class="w3-bar-item w3-button">비밀번호 찾기</a>
    <a href="#" class="w3-button w3-block w3-white w3-left-align">
      회원정보 <i class="fa fa-caret-down"></i>
    </a>
    <div class="w3-bar-block w3-padding-large w3-medium">
      <a href="#" class="w3-bar-item w3-button">학교정보 변경</a>
      <a href="#" class="w3-bar-item w3-button">비밀번호 변경</a>
      <a href="#" class="w3-bar-item w3-button">탈퇴하기</a>
    </div>
   
  </div>
</div>
 </div>

  
</div>






</body>
</html>