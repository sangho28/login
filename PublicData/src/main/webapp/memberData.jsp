<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import ="java.sql.Connection" %>
    
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
<!DOCTYPE html>
<html>
<head>
<meta http-equiv = "Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	try{
		
		Class.forName(driver);
		connection = DriverManager.getConnection(url, uid, upw);
		statement = connection.createStatement();
		resultSet = statement.executeQuery(query);
		out.println("�Ӿ�"+"<br/>");
		while(resultSet.next()) {
			String JOB_ID = resultSet.getString("JOB_ID");
			
			out.println("�Ӿ�"+JOB_ID+"<br/>");
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
</body>
</html>