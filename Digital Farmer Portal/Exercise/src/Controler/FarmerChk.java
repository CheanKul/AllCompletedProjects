package Controler;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pojo.Cart;
import com.pojo.Farmer;
import com.pojo.Product;

import FarmerPortal.CartInfo;
import FarmerPortal.FarmersInfo;
import FarmerPortal.GlobList;
@WebServlet("/FarmerChk")
public class FarmerChk extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Farmer f=new Farmer();
		String uname=request.getParameter("u");
		String pass=request.getParameter("p");
		f.setFarmerUsername(request.getParameter("u"));
		f.setFarmerPassword(request.getParameter("p"));
		response.setContentType("text/plain");
		Farmer fr=FarmersInfo.chkFarmer(f);

		if(fr==null)
		{
			response.getWriter().write("Invalid Username Or Password");
		}else
		{
			HttpSession ses=request.getSession();
			ses.setAttribute("frmrName", fr.getFarmerName());
			ses.setAttribute("frmrId", fr.getFarmerId());

			if((!GlobList.cart.isEmpty()) || CartInfo.countOfCarts(fr.getFarmerId())!=0)
			{
				for(Map.Entry<Product,Integer> mp:GlobList.cart.entrySet())
				{
					Cart c=new Cart();
					c.setProduct(mp.getKey());
					c.setFarmer(fr);
					c.setQuantity(mp.getValue());
					c.setTotal(mp.getKey().getPrice()*mp.getValue());
					CartInfo.addCart(c);
				}
				
				GlobList.cart.clear();
				
				for(Cart c:CartInfo.getCartsByFarmerId(fr.getFarmerId()))
				{
					GlobList.cart.put(c.getProduct(), c.getQuantity());
				}
				
			}
			response.getWriter().write(GlobList.link);

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
