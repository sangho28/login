<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
 <%!
 	Connection connection;
 	Statement statement;
 	ResultSet resultSet;
 	
 	String driver = "oracle.jdbc.driver.OracleDriver";
 	String url = "jdbc:oracle:thin:@localhost:1521:xe";
 	String uid = "HR";
 	String upw = "1234";
 	String query = "select * From JOBS";
 %>  
	<%
	try{
		
		Class.forName(driver);
		connection = DriverManager.getConnection(url, uid, upw);
		statement = connection.createStatement();
		resultSet = statement.executeQuery(query);
		out.println("머야"+"<br/>");
		while(resultSet.next()) {
			String JOB_ID = resultSet.getString("JOB_ID");	
			out.println("머야"+JOB_ID+"<br/>");
		}
		}catch(Exception e) {
		}finally {
			try {
				if(resultSet != null) resultSet.close();
				if(statement != null) resultSet.close();
				if(connection != null) resultSet.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
%>
<table border = "1">
		<tr>
			<th> 번호 </th>
			<th> 사진 </th>
		</tr>
	<% for (int i =0; i<10; i++) { %>
			<tr>
			<td> i </td>
			<td> 그림 </td>
		</tr>
	<%} %>
	
</table>
</body>
</html>