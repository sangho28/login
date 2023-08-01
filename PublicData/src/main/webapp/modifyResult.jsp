<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%= session.getAttribute("name") %>님의 정보 수정 처리 완 <br/>
<a href = "logout2.jsp">로그아웃</a>&nbsp;&nbsp;<a href = "modify.jsp">정보수정</a>
</body>
</html>