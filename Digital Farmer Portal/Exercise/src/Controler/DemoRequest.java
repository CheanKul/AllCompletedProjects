package Controler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pojo.Demo;

import FarmerPortal.DemoInfo;
import FarmerPortal.FarmersInfo;
import FarmerPortal.MachinaryInfo;
@WebServlet("/DemoRequest")
public class DemoRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession s=request.getSession();
		Demo d=new Demo();
		d.setFarmer(FarmersInfo.getInfoById(Integer.parseInt(s.getAttribute("frmrId").toString())));
		d.setMobile(request.getParameter("mob"));
		d.setAddress(request.getParameter("add"));
		d.setDate(request.getParameter("date"));
		d.setMachinary(MachinaryInfo.getMachinaryById(Integer.parseInt(request.getParameter("hid"))));
		
		DemoInfo.addDemoReq(d);
		
		response.sendRedirect("Mechinary.jsp");
		
	}


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
