package Controler;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.converters.SqlDateConverter;

import com.ibm.icu.text.SimpleDateFormat;
import com.pojo.Farmer;
import com.pojo.SoilTest;

import FarmerPortal.FarmersInfo;
import FarmerPortal.SoilTestInfo;
@WebServlet("/AddSoilTest")
public class AddSoilTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
		HttpSession s=request.getSession();
		SoilTest so=new SoilTest();
		so.setFarmer(FarmersInfo.getInfoById(Integer.parseInt(s.getAttribute("frmrId").toString())));
		so.setMobile(request.getParameter("mob"));
		
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		java.util.Date date;
		java.sql.Date sqlDate=null;
		try {
			date = sdf.parse(request.getParameter("date"));
			sqlDate = new Date(date.getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		so.setTestDate(sqlDate);
		
		so.setAddress(request.getParameter("add"));
		SoilTestInfo.addSoilTest(so);
		
		Farmer fr=FarmersInfo.getInfoById(Integer.parseInt(s.getAttribute("frmrId").toString()));
		fr.setSoilType(request.getParameter("soilType"));
		fr.setTotalLand(Integer.parseInt(request.getParameter("totalLand")));
		fr.setCrops(request.getParameter("crops"));
		FarmersInfo.insertFarmer(fr);
		
		response.sendRedirect("FarmerProfile.jsp");
	
	
	}


	
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
