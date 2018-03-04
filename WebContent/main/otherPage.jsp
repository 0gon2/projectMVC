<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>

<!-- 사이드 바 -->
<div class="w3-sidebar w3-bar-block w3-collapse" 
style="z-index:3;width:260px" id="mySidebar">
	<p></p>
  <!-- 프로필 -->
     <div class="w3-card w3-round w3-white" style="width:240px; margin-left:10px">
        <div class="w3-container">
         <h4 class="w3-center">Other Profile</h4>
         <p class="w3-center"><img src="<%=request.getContextPath()%>/images/defaultprofile.jpg" 
         class="w3-circle" style="height:106px;width:106px" ></p>
         <hr>
         <p><i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i> ${name }</p>
         <p><i class="fa fa-home fa-fw w3-margin-right w3-text-theme"></i>
         <a href="schoolBoard">${aditemt}</a>, 
         <a href="schoolBoard?index=2">${aditmid}</a>,
         <a href="schoolBoard?index=3">${adithigh}</a></p>
         <p><i class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i> June 15, 1994 </p>
        </div>
      </div>
      <div>
  			사진첩 같은거
      </div>
        <div class="w3-card w3-round w3-light-white w3-center">
        <div class="w3-container">
          <p>동창을 찾습니다</p>
          <img src="/w3images/forest.jpg" alt="Forest" style="width:100%;">
          <p><strong>Holiday</strong></p>
          <p>Friday 15:00</p>
          <p><button class="w3-button w3-block w3-theme-l4">Info</button></p>
        </div>
      </div>
</div>

<!-- 몸통부분  -->
<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" 
style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- Main content: shift it to the right by 270 pixels when the sidebar is visible -->
<div class="w3-main w3-container" style="margin-left:270px;margin-top:117px;">
 <!-- The Grid -->
 <p>
  <div class="w3-row">
    <!-- Middle Column -->
    <div class="w3-col m7">
    <!-- 게시글 입력란 -->
      <div class="w3-row-padding">
        <div class="w3-col m12">
          <div class="w3-card w3-round w3-white">
            <div class="w3-container w3-padding">
              <h6 class="w3-opacity">Social Media template by w3.css</h6>
              <p contenteditable="true" class="w3-border w3-padding">Status: Feeling Blue</p>
              <button type="button" class="w3-button w3-theme"><i class="fa fa-pencil"></i>  Post</button> 
            </div>
          </div>
        </div>
      </div>
      
      <div class="w3-container w3-card w3-light-grey w3-round w3-margin">
      <br>
        <img src="/w3images/avatar2.png" alt="Avatar" 
        class="w3-left w3-circle w3-margin-right" style="width:60px">
        <span class="w3-right w3-opacity">1 min</span>
        <h4>John Doe</h4><br>
        <hr class="w3-clear">
        <p> 내용 </p>
          <div class="w3-row-padding" style="margin:0 -16px">
            <div class="w3-half">
              <img src="/w3images/lights.jpg" 
              style="width:100%" alt="Northern Lights" 
              class="w3-margin-bottom">
            </div>
            <div class="w3-half">
              <img src="/w3images/nature.jpg" 
              style="width:100%" alt="Nature" class="w3-margin-bottom">
          </div>
        </div>
        <button type="button" class="w3-button w3-theme-d1 w3-margin-bottom">
        <i class="fa fa-thumbs-up"></i>  Like</button> 
        <button type="button" class="w3-button w3-theme-d2 w3-margin-bottom">
        <i class="fa fa-comment"></i>  Comment</button> 
      </div>
    <!-- End Middle Column -->
    </div>
    
    <!-- Right Column -->
    <div class="w3-col m2">
      <div class="w3-card w3-round w3-white w3-center">
        <div class="w3-container">
          <p>오늘의 명언같은거ㅋㅋ</p>
          <img src="/w3images/forest.jpg" alt="Forest" style="width:100%;">
          <p><strong>Holiday</strong></p>
          <p>Friday 15:00</p>
          <p><button class="w3-button w3-block w3-theme-l4">Info</button>
          </p>
        </div>
      </div>
      <br>
      
      
      <!--친구추가하기   -->
      
      <div class="w3-card w3-round w3-white w3-center">
	        <div class="w3-container">
	          <p>친구추가하기</p>
	          <img src="/w3images/avatar6.png" alt="Avatar" style="width:50%"><br>
	          <span>Jane Doe</span>
	          <div class="w3-row w3-opacity">
	            <div class="w3-half">
	            <c:if test="${statement==1}">
	            	<form action="mainPage">
	            		<input type="hidden" value="${pageId}" name="pageId">
	            		<input type="hidden" value="1" name="addReq">
	            		<input type="submit" value="친구추가">
	            	</form>
	            </c:if>
	            <c:if test="${statement==2}">
	            	요청대기중
	            </c:if>
	             <c:if test="${statement==3}">
	            	<form action="mainPage">
	            		<input type="hidden" value="${pageId}" name="pageId">
	            		<input type="hidden" value="1" name="acceptReq">
	            		<input type="submit" value="수락하기">
	            	</form>
	            </c:if>
	             <c:if test="${statement==4}">
	            	친구관계
	            </c:if>
	            
	            </div>
	          </div>
	        </div>
	      </div>
      
      
      <br>
      
      <div class="w3-card w3-round w3-white w3-padding-16 w3-center">
        <p>ADS</p>
      </div>
      <br>
      
      <div class="w3-card w3-round w3-white w3-padding-32 w3-center">
        <p><i class="fa fa-bug w3-xxlarge"></i></p>
      </div>
      
    <!-- End Right Column -->
    </div>
    
  <!-- End Grid -->
  </div>
<footer class="w3-panel w3-padding-32 w3-card-4 w3-light-grey w3-center w3-opacity">
  <p><nav>
  <a href="/forum/default.asp" target="_blank">FORUM</a> |
  <a href="/about/default.asp" target="_top">ABOUT</a>
  </nav></p>
</footer>

<!-- END MAIN -->
</div>

<script>
// Script to open and close the sidebar
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}
function w3_show_nav(name) {
    document.getElementById("menuTut").style.display = "none";
    document.getElementById("menuRef").style.display = "none";
    document.getElementById(name).style.display = "block";
    w3-open();
}
</script>
<script src="https://www.w3schools.com/lib/w3codecolor.js"></script>
<script>
w3CodeColor();
</script>
</body>
</html>