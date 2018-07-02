package Controler;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.pojo.Machinary;

import FarmerPortal.CategoryInfo;
import FarmerPortal.MachinaryInfo;
@MultipartConfig(maxFileSize=1024*1024*1024)
@WebServlet("/AddMachinary")
public class AddMachinary extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Machinary me=new Machinary();
		me.setMachineName(request.getParameter("mName"));
		me.setEngineHp(Integer.parseInt(request.getParameter("mHP")));
		me.setEngineRpm(request.getParameter("mRPM"));
		me.setGears(request.getParameter("mGears"));
		me.setSpeed(request.getParameter("mSpeed"));
		me.setFrontTyre(request.getParameter("mFT"));
		me.setRearTyre(request.getParameter("mRT"));
		me.setLiftCapacity(request.getParameter("mLift"));
		me.setFuelCapacity(request.getParameter("mFuel"));
		me.setCategory(CategoryInfo.getCategoryByType(request.getParameter("cType")));
		
		Part file=request.getPart("mImage");
		InputStream fileName=null;
		fileName=file.getInputStream();
		byte []bytes=new byte[fileName.available()];
		fileName.read(bytes);
		me.setImage(bytes);
		
		MachinaryInfo.addMachinary(me);
		
		response.sendRedirect("Admin/AddMachinary.jsp");
		
	}


	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
