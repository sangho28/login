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
	  ���̵� : <input type ="text" name ="id" size = "10"><br/>
	��й�ȣ : <input type ="password" name ="pw" size = "10"><br/>
	��й�ȣ Ȯ��: <input type ="password" name ="pw_check" size = "10"><br/>
	�̸� : <input type = "text" name ="name" size ='20'><br/>
	���� : <input type = "text" name ="email" size ='20'><br/>
	�ּ� : <input type = "text" name ="address" size ='20'><br/>
	<input type ="button" value ="ȸ������" onclick = "infoConfirm()">
	<input type = "reset" value ="���" onclick ="javascript:window.location='login.jsp'">
	</form>
</body>
</html>