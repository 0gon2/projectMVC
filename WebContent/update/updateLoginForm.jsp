<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div class="w3-main w3-container" style="margin-left:260px;margin-top:140px;">
	<div class="w3-panel w3-padding-large w3-card-4" style="margin-left:20px;width:40%">
    
  	<h4 class="w3-opacity"><i class="fa fa-male"></i>&nbsp;학교정보 변경</h4>
 	 <div class="w3-col m7" style="width:400px" >
		  <div class="form-style-2">
		<div class="form-style-2-heading w3-opacity">개인정보 보호를 위해 비밀번호를 입력해주세요.</div>
		<form action="updateLoginPro" name="myform" method="post">
		<label for="field1"><span>ID <span class="required">*</span></span>${myId } </label>
		<label for="field2"><span>Password <span class="required">*</span></span><input type="password" class="input-field" name="password" /></label>
		<label><span>&nbsp;</span></label><input type="submit" value="확인" />
		</form>
		</div>
		      
 	  </div>
	</div>
</div>
</body>
</html>