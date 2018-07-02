package Controler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pojo.Farmer;

import FarmerPortal.FarmersInfo;
@WebServlet("/UpdateFarmer")
public class UpdateFarmer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession s=request.getSession();
		int id=Integer.parseInt(s.getAttribute("frmrId").toString());
		Farmer f=FarmersInfo.getInfoById(id);
		f.setFarmerName(request.getParameter("name"));
		f.setFarmerEmail(request.getParameter("email"));
		f.setAddress(request.getParameter("place"));
		f.setGender(request.getParameter("gender"));
		f.setState(request.getParameter("state"));
		f.setCity(request.getParameter("city"));
		f.setBlock(request.getParameter("block"));
		f.setZip(request.getParameter("zip"));
	
		FarmersInfo.insertFarmer(f);
		response.sendRedirect("FarmerProfile.jsp");
	
	}


	
	
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
