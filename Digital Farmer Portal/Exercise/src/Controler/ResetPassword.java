package Controler;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pojo.Farmer;

import FarmerPortal.FarmersInfo;
@WebServlet("/ResetPassword")
public class ResetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession s=request.getSession();
		Farmer f=FarmersInfo.getInfoById(Integer.parseInt(s.getAttribute("frmrId").toString()));
		
		String current=request.getParameter("current");
		String new1=request.getParameter("new1");
		String new2=request.getParameter("new2");
		
		System.out.println("Current :- "+current +"\nNew1"+new1+"\nNew2"+new2);
		
		
		if(current.equalsIgnoreCase(new1))
		{
			response.getWriter().write("Current And New Password Should Be Different..");
		}
		else if(!new1.equals(new2))
		{
			response.getWriter().write("Password Does Not Match..");
		}
		else 
		{
			f.setFarmerPassword(new1);
			FarmersInfo.insertFarmer(f);
			response.getWriter().write("Success");
		}
		
		
	
	}



	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
