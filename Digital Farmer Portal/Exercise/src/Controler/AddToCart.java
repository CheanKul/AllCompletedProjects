package Controler;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.JAXBException;

import org.xml.sax.SAXException;

import com.pojo.Cart;
import com.pojo.Product;
import com.sun.xml.bind.v2.runtime.reflect.ListIterator;

import FarmerPortal.CartInfo;
import FarmerPortal.FarmersInfo;
import FarmerPortal.GlobList;
import FarmerPortal.ProductInfo;
@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		
		
		
		Product p=ProductInfo.getProductById(Integer.parseInt(request.getParameter("id")));
		
		int qty=1;		
		//System.out.println("Product Reference1 :- "+ProductInfo.getProductById(Integer.parseInt(request.getParameter("id"))));
		//System.out.println("Product Reference2 :- "+ProductInfo.getProductById(Integer.parseInt(request.getParameter("id"))));
		boolean flag=false;
		for(Map.Entry<Product,Integer> mp:GlobList.cart.entrySet())
		{
			if(mp.getKey().getProductId()==Integer.parseInt(request.getParameter("id"))) {
				flag=true;
			}
			System.out.println("key :-" + mp.getKey());
		}
		if(flag==false) {
			GlobList.cart.put(p, qty);
		}
		
		
		
		response.getWriter().write(p.getProductName()+" is Added To Cart");

	}






	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
