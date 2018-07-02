package Controler;

import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.pojo.*;

import FarmerPortal.ProductInfo;
import FarmerPortal.ProductTypeInfo;
@MultipartConfig(maxFileSize=1024*1024*1024)
@WebServlet("/AddProduct")
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Product p=new Product();
		p.setProductName(request.getParameter("pName"));
		p.setProductDescription(request.getParameter("pDescription"));
		p.setPrice(Integer.parseInt(request.getParameter("pPrice")));
		p.setProductType(ProductTypeInfo.getProductTypeByType(request.getParameter("pType")));
		p.setStockQty(Integer.parseInt(request.getParameter("pStock")));



		Part file=request.getPart("pImage");
		InputStream fileName=null;
		fileName=file.getInputStream();
		byte []bytes=new byte[fileName.available()];
		fileName.read(bytes);
		p.setProductImg(bytes);


		ProductInfo.addProduct(p);

		response.sendRedirect("Admin/AddProduct.jsp");

	}







	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
