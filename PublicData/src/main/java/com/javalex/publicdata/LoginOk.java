package com.javalex.publicdata;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * Servlet implementation class LoginOk
 */
//@WebServlet("/LoginOk")
public class LoginOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private Connection connection;
	private Statement stmt;
	private ResultSet resultSet;
	
	private String name, id, pw, phone, gender;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginOk() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionDo(request,response);
	}
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		
		pw = request.getParameter("pw");
		id = request.getParameter("id");

		
		String query = "select * from member where id = '"+ id + "'and pw ='"+pw+"'";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","HR","1234");
			stmt = connection.createStatement();
			resultSet= stmt.executeQuery(query);
			
			while(resultSet.next()) {
				name = resultSet.getString("name");
				id = resultSet.getString("id");
				pw = resultSet.getString("pw");
				phone = resultSet.getString("phone");
				gender = resultSet.getString("gender");
			}
			
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("name", name);
			httpSession.setAttribute("id", id);
			httpSession.setAttribute("pw", pw);
			
			response.sendRedirect("loginResult.jsp");
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(resultSet != null) resultSet.close();
				if(stmt != null) stmt.close();
				if(connection != null) connection.close();
			}catch(Exception e) {}
		}
	}
}
