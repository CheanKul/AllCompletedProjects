package Controler;

import java.io.IOException;
import com.pojo.*;
import FarmerPortal.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/deleteFarmer")
public class deleteFarmer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Farmer f=new Farmer();
		f=FarmersInfo.getInfoById(Integer.parseInt(request.getParameter("id")));
		FarmersInfo.deleteFarmer(f);
		response.sendRedirect("Admin/ViewAllFarmer.jsp");
	}


	
	
	
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
