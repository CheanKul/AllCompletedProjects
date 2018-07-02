package Controler;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.mysql.jdbc.ResultSet;
import com.pojo.*;


import FarmerPortal.AdminInfo;


@WebServlet("/AdminCheck")

public class AdminCheck extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
			
			Admin a=new Admin();
			a.setAdminUsername(request.getParameter("username"));
			a.setAdminPassword(request.getParameter("pwd"));
			
			String nm=AdminInfo.chkAdmin(a);
			
			if(nm!=null)
			{
				HttpSession session=request.getSession();
				session.setAttribute("name", nm);
				response.sendRedirect("Admin/AdminHome.jsp");
			}
			else
			{				
				response.sendRedirect("Admin/AdminLogin.jsp");
			}		
		} 
		catch (Exception e) 
		{			
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
