<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
     <%!
 

 	String name,id,pw,phone,gender;
 %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
 
 	<%
	Connection connection;
 	Statement statement;
 	ResultSet resultSet = null;
 		id =(String)session.getAttribute("id");
 	String query = "select * from member where id ='" + id+"'";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","HR","1234");
	statement = connection.createStatement();
	resultSet= statement.executeQuery(query);
	
 	
	while(resultSet.next()) {
		name = resultSet.getString("name");
		id = resultSet.getString("id");
		pw = resultSet.getString("pw");
		phone = resultSet.getString("phone");
		gender = resultSet.getString("gender");
	}
 
%>	
	<form action = "ModifyOk" method ="post">
	�̸� : <input type ="text" name ="name" size ="10" value =<%=name %>><br/>
	���̵� :<%=id %>
	��й�ȣ : <input type ="text" name ="pw" size = "10"><br/>
	��ȭ��ȣ : <input type ="text" name ="phone" size = "10" value=<%=phone %>><br/>
	<% 
		try { if(gender.equals("man")) {
	%>
 	�������� : <input type ="radio" name = "gender" value ="man" checked ="checked">�� &nbsp;<input type ="radio" name = "gender" value ="woman">��
 	<% 
 	}else{
 	%>
 	�������� : <input type ="radio" name = "gender" value ="woman"checked ="checked">��<input type ="radio" name = "gender" value ="man">�� <br/>
 	<% } 
	}catch(Exception e){}  %>
 		<input type = "submit" value ="��������">
 	<input type ="reset" value ="���">
	</form>
</body>
</html>