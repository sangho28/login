package com.javalex.publicdata;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

/**
 * Servlet implementation class JoinOk
 */
//@WebServlet("/JoinOk")
public class JoinOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private Connection connection;
	private Statement stmt;
	
	private String name, id, pw, phone, gender;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinOk() {
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
		
		name = request.getParameter("name");
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		phone = request.getParameter("phone");
		gender = request.getParameter("gender");
		
		String query = "insert into member values('" +name +"','"+id+"','"+pw+"','"+phone+"','"+gender+"')";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","HR","1234");
			stmt = connection.createStatement();
			int i = stmt.executeUpdate(query);
			if(i==1) {
				System.out.println("insert success");
				response.sendRedirect("joinResult.jsp");
			}else {
				System.out.println("insert fail");
				response.sendRedirect("join.html");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(stmt != null) stmt.close();
				if(connection != null) connection.close();
			}catch(Exception e) {}
		}
	}
}