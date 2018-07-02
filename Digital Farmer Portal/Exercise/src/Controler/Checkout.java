package Controler;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.text.ParseException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ibm.icu.text.SimpleDateFormat;
import com.pojo.Product;
import com.pojo.Purchase;

import FarmerPortal.CartInfo;
import FarmerPortal.FarmersInfo;
import FarmerPortal.GlobList;
import FarmerPortal.ProductInfo;
import FarmerPortal.PurchaseInfo;
@WebServlet("/Checkout")
public class Checkout extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		HttpSession s=request.getSession();

		for(Map.Entry<Product,Integer> mp:GlobList.cart.entrySet())
		{
			Purchase p=new Purchase();
			p.setFarmer(FarmersInfo.getInfoById(Integer.parseInt(s.getAttribute("frmrId").toString())));
			p.setProduct(mp.getKey());
			p.setQty(mp.getValue());
			p.setTotal(mp.getKey().getPrice() * mp.getValue());
			p.setAddress(request.getParameter("add"));


			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
			String strDate = formatter.format(date);

			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			java.util.Date date1;
			java.sql.Date sqlDate=null;
			try {
				date1 = sdf.parse(strDate);
				System.out.println(date);
				//sqlDate = new Date(date.getTime());
				sqlDate=new java.sql.Date(date.getTime());
				System.out.println(sqlDate);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			p.setPurchaseDate(sqlDate);

			p.setMobile(request.getParameter("mob"));

			PurchaseInfo.addPurchase(p);
			

		}


		
		for(Map.Entry<Product,Integer> mp:GlobList.cart.entrySet())
		{
			Product pro=mp.getKey();
			pro.setStockQty(pro.getStockQty()-mp.getValue());
			ProductInfo.updateProduct(pro);
		}

		
		CartInfo.deleteCartOfFamer(FarmersInfo.getInfoById(Integer.parseInt(s.getAttribute("frmrId").toString())).getFarmerId());
		GlobList.cart.clear();		
		response.sendRedirect("FarmerProfile.jsp");


	}






	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
