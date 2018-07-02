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
import com.pojo.Product;

import FarmerPortal.GlobList;
@WebServlet("/UpdateQty")
public class UpdateQty extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



		int id=Integer.parseInt(request.getParameter("id"));
		int qty=Integer.parseInt(request.getParameter("qty"));


		for(Map.Entry<Product,Integer> mp:GlobList.cart.entrySet())
		{
			if(mp.getKey().getProductId()==id)
			{
				mp.setValue(qty);
			}
		}

		
		response.getWriter().write("proId= "+id +" qty= "+qty);
	}








	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
