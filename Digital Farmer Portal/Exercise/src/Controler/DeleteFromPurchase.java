package Controler;

import java.io.IOException;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pojo.Product;
import com.pojo.Purchase;

import FarmerPortal.GlobList;
import FarmerPortal.ProductInfo;
import FarmerPortal.PurchaseInfo;

@WebServlet("/DeleteFromPurchase")
public class DeleteFromPurchase extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		System.out.println(request.getParameter("id"));
		Purchase p=PurchaseInfo.getPurchaseById(Integer.parseInt(request.getParameter("id")));
		
		Product pro=p.getProduct();
		pro.setStockQty(pro.getStockQty()+p.getQty());
		ProductInfo.updateProduct(pro);
		PurchaseInfo.deletePurchase(p);

		response.getWriter().write(p.getProduct().getProductName()+" Is Deleted From Cart");
	
	}


	
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
