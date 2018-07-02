package Controler;

import java.io.IOException;
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
@WebServlet("/FrmrLogout")
public class FrmrLogout extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession ses2=request.getSession();
		
		int id=(int)ses2.getAttribute("frmrId");
		CartInfo.deleteCartOfFamer(id);
		Farmer fr=FarmersInfo.getInfoById(id);
		if(!GlobList.cart.isEmpty())
		{
			for(Map.Entry<Product,Integer> mp:GlobList.cart.entrySet())
			{
				Cart c=new Cart();
				c.setProduct(mp.getKey());
				c.setFarmer(fr);
				c.setQuantity(mp.getValue());
				c.setTotal((mp.getKey().getPrice())*(mp.getValue()));
				CartInfo.addCart(c);
			}
		}

		
		GlobList.cart.clear();
		ses2.setAttribute("frmrName", null);
		ses2.setAttribute("frmrId", null);
		response.sendRedirect("Index.jsp");
	
	}

	
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
