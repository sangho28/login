package com.javalex.publicdata;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {

//		private String url = "jdbc:oracle:thin:@localhost:1521:xe";
//		private String uid= "HR";
//		private String upw = "1234";
		private DataSource dataSource;	
	
	public MemberDAO() {
		// TODO Auto-generated constructor stub
//		try {
//			Class.forName("oracle.jdbc.driver.OracleDriver");
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
		
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<MemberDTO> memberSelect() {
		
		ArrayList<MemberDTO> dtos = new ArrayList<MemberDTO>();
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
//			con = DriverManager.getConnection(url,uid,upw);
			con = dataSource.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery("select * from member");
			
			while(rs.next()) {
				String name = rs.getString("name");
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String phone = rs.getString("phone");
				String gender = rs.getString("gender");
				
				MemberDTO dto = new MemberDTO(name,id,pw,phone,gender);
				dtos.add(dto);
			}
						
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(con != null) con.close();
				if(stmt != null) stmt.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return dtos;
	}

}
