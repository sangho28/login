<%@page import="com.javalex.publicdata.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.javalex.publicdata.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
		MemberDAO memberDAO = new MemberDAO();
		ArrayList<MemberDTO> dtos =memberDAO.memberSelect();
		
		for(int i=0;i<dtos.size();i++) {
			MemberDTO dto = dtos.get(i);
			String name =dto.getName();
			String id = dto.getId();
			String pw = dto.getPw();
			String phone = dto.getPhone();
			String gender = dto.getGender();
			
			out.println("�̸� :" +name +",���̵� :" +id+ ", ��й�ȣ :" +pw + ",����ó:"+phone+",����:"+gender +"<br/>");
			
		}
		 
	%>

</body>
</html>