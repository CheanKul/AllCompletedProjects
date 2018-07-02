package Controler;
import com.pojo.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import FarmerPortal.FarmersInfo;

@WebServlet("/FarmerRegister")
public class FarmerRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
	FarmersInfo fi=new FarmersInfo();
	public FarmerRegister() throws ClassNotFoundException, SQLException {


	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			Farmer fr=new Farmer();
			fr.setFarmerName(request.getParameter("name"));
			fr.setFarmerMobile(request.getParameter("mobno"));
			fr.setFarmerUsername(request.getParameter("username"));
			fr.setFarmerPassword(request.getParameter("password"));
			fr.setFarmerEmail(request.getParameter("email"));
			fr.setGender(request.getParameter("gender"));
			fr.setAddress(request.getParameter("addr"));
			fr.setState(request.getParameter("state"));
			fr.setCity(request.getParameter("city"));
			fr.setBlock(request.getParameter("block"));
			fr.setZip(request.getParameter("zip"));
			PrintWriter out=response.getWriter();
			int i=FarmersInfo.insertFarmer(fr);
			if(i==0)
			{
				out.println("Somethings Wrong...:-(");
			}
			else
			{
				out.println("Farmer Added...:-)");
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
