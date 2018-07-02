package Controler;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.pojo.Product;

import FarmerPortal.ProductInfo;
import FarmerPortal.ProductTypeInfo;
@MultipartConfig(maxFileSize=1024*1024*1024)
@WebServlet("/UpdateProduct")
public class UpdateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	
	}


	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Product p=new Product();
		p.setProductId(Integer.parseInt( request.getParameter("id")));
		p.setProductName(request.getParameter("title"));
		p.setProductDescription(request.getParameter("des"));
		p.setPrice(Integer.parseInt(request.getParameter("price")));
		p.setStockQty(Integer.parseInt(request.getParameter("stock")));
		p.setProductType(ProductTypeInfo.getProductTypeByType(request.getParameter("productType")));
		
		
		if(Integer.parseInt(request.getParameter("img"))==1)
		{
		Part file=request.getPart("pImage");
		InputStream fileName=null;
		fileName=file.getInputStream();
		byte[] bytes=new byte[fileName.available()];
		fileName.read(bytes);
		p.setProductImg(bytes);
		}
		else
		{
			Product p1=ProductInfo.getProductById(Integer.parseInt(request.getParameter("id")));
			p.setProductImg(p1.getProductImg());
		}
		ProductInfo.updateProduct(p);
		
		response.sendRedirect("Admin/AddProduct.jsp");
	
	}

}
