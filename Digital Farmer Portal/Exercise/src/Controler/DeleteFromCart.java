package Controler;

import java.io.IOException;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pojo.Cart;
import com.pojo.Product;

import FarmerPortal.CartInfo;
import FarmerPortal.GlobList;
import FarmerPortal.ProductInfo;
@WebServlet("/DeleteFromCart")
public class DeleteFromCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		Product p=ProductInfo.getProductById(Integer.parseInt(request.getParameter("id")));
		System.out.println("p.getId() :- "+p.getProductId());
		boolean flag=false;
		for(Entry<Product, Integer> mp:GlobList.cart.entrySet())
		{
			System.out.println("mp.getKey() :-" +mp.getKey().getProductId() +" p.getId() :-"+ p.getProductId());
			if(p.getProductId() == mp.getKey().getProductId())
			{
				System.out.println("2mp.getKey() :-" +mp.getKey().getProductId() +" p.getId() :-"+ p.getProductId());
				GlobList.cart.remove(mp.getKey());
			}
		}
			

		response.getWriter().write(p.getProductName()+" Is Deleted From Cart");
	}






	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);

	}

}
