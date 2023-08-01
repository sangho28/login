package park;

import jakarta.servlet.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


/**
 * Servlet implementation class Sangho
 */
//@WebServlet("/SH")
public class Sangho extends HttpServlet implements Servlet{
	public static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sangho() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("멀봐");
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		response.setContentType("text/html; charset-euc-kr");
		PrintWriter writer = response.getWriter();
		
		writer.println("<html>");
		writer.println("<head>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("ㅎㅎㅎㅎ");
		writer.println("</body>");
		writer.println("</html>");
		
		writer.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		System.out.println("doPost");
		
		response.setContentType("text/html; charset-euc-kr");
		PrintWriter writer = response.getWriter();
		
		writer.println("<html>");
		writer.println("<head>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("post방식이다");
		writer.println("</body>");
		writer.println("</html>");
		
		writer.close();
		
		
	}

}
