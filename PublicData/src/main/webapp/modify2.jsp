<%@page import="com.javalec.ex.MemberDto"%>
<%@page import="com.javalec.ex.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<%
	String id =(String)session.getAttribute("id");
	MemberDao dao = MemberDao.getInstance();
	MemberDto dto = dao.getMember(id);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script language="JavaScript" src ="member.js"></script>
</head>
<body>
	<form action ="joinOk.jsp" method ="post" name= "reg_fm">
	  ���̵� :<%=dto.getId() %><br/>
	��й�ȣ : <input type ="password" name ="pw" size = "10"><br/>
	��й�ȣ Ȯ��: <input type ="password" name ="pw_check" size = "10"><br/>
	�̸� : <%=dto.getName() %><br/>
	���� : <input type = "text" name ="email" size ='20' value ="<%=dto.geteMail() %>"><br/>
	�ּ� : <input type = "text" name ="address" size ='20'value ="<%=dto.getAddress() %>"><br/>
	<input type ="button" value ="����" onclick = "updateInfoConfirm()">
	<input type = "reset" value ="���" onclick ="javascript:window.location='login.jsp'">
	</form>
</body>
</html>