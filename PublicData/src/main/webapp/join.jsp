<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content = "text/html; charset=EUC-KR">
<title>Insert title here</title>
<script language = "JavaScript" src ="member.js"></script>
</head>
<body>
	<form action ="joinOk.jsp" method ="post" name= "reg_fm">
	  아이디 : <input type ="text" name ="id" size = "10"><br/>
	비밀번호 : <input type ="password" name ="pw" size = "10"><br/>
	비밀번호 확인: <input type ="password" name ="pw_check" size = "10"><br/>
	이름 : <input type = "text" name ="name" size ='20'><br/>
	메일 : <input type = "text" name ="email" size ='20'><br/>
	주소 : <input type = "text" name ="address" size ='20'><br/>
	<input type ="button" value ="회원가입" onclick = "infoConfirm()">
	<input type = "reset" value ="취소" onclick ="javascript:window.location='login.jsp'">
	</form>
</body>
</html>