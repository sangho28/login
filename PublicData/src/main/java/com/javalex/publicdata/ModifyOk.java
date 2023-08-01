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
 * Servlet implementation class ModifyOk
 */
//@WebServlet("/ModifyOk")
public class ModifyOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private Connection connection;
	private Statement stmt;
	ResultSet resultSet;
	HttpSession httpSession;
	
	private String name, id, pw, phone, gender;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyOk() {
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
		actionDo(request, response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		httpSession = request.getSession();
		
		name = request.getParameter("name");
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		phone = request.getParameter("phone");
		gender = request.getParameter("gender");
		
		if(pwConfirm()) {
		String query = "update member set name='" +name +"',phone ='"+phone+"',gender ='"+gender+"' where pw ='"+pw+"'" ;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","HR","1234");
			stmt = connection.createStatement();
			int i = stmt.executeUpdate(query);
			System.out.println(i);
			if(i==1) {
				System.out.println("update success");
				httpSession.setAttribute("name", name);
				response.sendRedirect("modifyResult.jsp");
			}else {
				System.out.println("update fail");
				response.sendRedirect("modify.jsp");
			}		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(stmt != null) stmt.close();
				if(connection != null) connection.close();
			}catch(Exception e) {}
		}
		}else {
			System.out.println("NG");
		}
	}
	
	private boolean pwConfirm() {
		boolean rs = false;
		
		String sessionPw = (String)httpSession.getAttribute("pw");
		
		if(sessionPw.equals(pw)) {
			rs = true;
		}else {
			rs = false;
		}
		return rs;
	}
	
}
	
	


