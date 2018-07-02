package FarmerPortal;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.collection.PersistentSet;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.pojo.*;
public class ProductInfo {

	//Add Product
	public static int addProduct(Product pr)
	{

		Transaction tr=null;
		Session session=Connect.sf.openSession();
		try {
			tr=session.beginTransaction();
			session.save(pr);
			pr.getProductId();
			tr.commit();  
		} catch (HibernateException e) {
			if (tr!=null) tr.rollback();
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}

		return 1;
	}


	//Count Of Products
	public static int countOfProducts()
	{
		int rows=0;
		Session session=Connect.sf.openSession();
		try {
			Criteria c=session.createCriteria(Product.class).setProjection(Projections.rowCount());
			rows=(int) c.uniqueResult();

		} catch (HibernateException e) {
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}

		return rows;
	}


	//View All Products
	public static List<Product> getAllProducts()
	{
		List<Product> li=null;
		Session session=Connect.sf.openSession();
		try {
			Criteria c=session.createCriteria(Product.class);
			li=c.list();

		} catch (HibernateException e) {
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}
		return li;

	}



	//Delete Product
	public static void deleteProduct(Product p)
	{
		Transaction tr=null;
		Session session=Connect.sf.openSession();
		try {
			tr=session.beginTransaction();
			session.delete(p);
			tr.commit();
		} catch (HibernateException e) {
			if (tr!=null) tr.rollback();
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}

	}


	//Add Product Stock
	public static void updateProduct(Product pr)
	{
		Transaction tr=null;
		Session session=Connect.sf.openSession();
		try {
			tr=session.beginTransaction();
			session.update(pr);
			pr.getProductId();
			tr.commit();  
		} catch (HibernateException e) {
			if (tr!=null) tr.rollback();
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}

	}


	//Display Product By Product Type
	public static List<Product> getProductsByProductType(int id)
	{
		List<Product> li=null;
		Session session=Connect.sf.openSession();
		try {
			ProductType p=ProductTypeInfo.getProductTyprById(id);
			Criteria c=session.createCriteria(Product.class).add(Restrictions.eq("productType",p));
			li=c.list();

		} catch (HibernateException e) {
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}


		return li;

	}


	//Info Of One Product By ID
	public static Product getProductById(int id)
	{
		Product p=null;
		Session session=Connect.sf.openSession();
		try {
			Criteria c=session.createCriteria(Product.class).add(Restrictions.eq("productId", id));
			p=(Product)c.uniqueResult();
			System.out.println("Inside ProductInfo	 :-"+p);

		} catch (HibernateException e) {
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}
		return p;
	}
}

