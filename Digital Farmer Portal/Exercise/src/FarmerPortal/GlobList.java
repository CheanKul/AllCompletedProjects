package FarmerPortal;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

import com.pojo.Cart;
import com.pojo.Product;

public class GlobList {
	public static String link;
	public static Map<Product,Integer> cart=new HashMap<Product,Integer>();
	public static String getLink() {
		return link;
	}
	public static void setLink(String link) {
		GlobList.link = link;
	}
	public static Map<Product, Integer> getCart() {
		return cart;
	}
	public static void setCart(Map<Product, Integer> cart) {
		GlobList.cart = cart;
	}

		
	


}
