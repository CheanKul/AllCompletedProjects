package FarmerPortal;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.pojo.*;
public class ProductTypeInfo {

	//Add Product Type
	public static int addProductType(ProductType pt)
	{
		Transaction tr=null;
		Session session=Connect.sf.openSession();
		try {
			tr=session.beginTransaction();
			session.save(pt);
			tr.commit();

		} catch (HibernateException e) {
			if (tr!=null) tr.rollback();
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}

		return 1;
	}


	//Count Of Product Type
	public static int countOfProductType()
	{
		int rows=0;
		Session session=Connect.sf.openSession();
		try {

			Criteria c=session.createCriteria(ProductType.class).setProjection(Projections.rowCount());
			rows=(int) c.uniqueResult();	


		} catch (HibernateException e) {
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}
		return rows;
	}


	//Delete Product Type
	public static void deleteProductType(ProductType pt)
	{
		Transaction tr=null;
		Session session=Connect.sf.openSession();
		try {
			tr=session.beginTransaction();
			session.delete(pt);
			tr.commit();


		} catch (HibernateException e) {
			if (tr!=null) tr.rollback();
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}			

	}


	//Get One Product Type By Id
	public static ProductType getProductTyprById(int id)
	{
		ProductType f=null;
		Session session=Connect.sf.openSession();
		try {
			Criteria c=session.createCriteria(ProductType.class);
			c.add(Restrictions.eq("id", id));
			f=(ProductType) c.uniqueResult();

		} catch (HibernateException e) {
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}

		return f;
	}


	//Get One Product Type By Product Type
	public static ProductType getProductTypeByType(String type)
	{
		ProductType f=null;
		Session session=Connect.sf.openSession();
		try {
			Criteria c=session.createCriteria(ProductType.class);
			c.add(Restrictions.eq("productType", type));
			f=(ProductType) c.uniqueResult();

		} catch (HibernateException e) {
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}
		return f;
	}
	
	

	//Get All Product Type
	public static List<ProductType> getAllProductType()
	{
		List<ProductType> li=null;
		Session session=Connect.sf.openSession();
		try {
			Criteria c=session.createCriteria(ProductType.class);
			li=c.list();

		} catch (HibernateException e) {
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}return li;

	}


	//Get All Product Type For Navbar
	public static List<ProductType> getProductTypeNav()
	{

		List<ProductType> li=null;
		Session session=Connect.sf.openSession();
		try {
			Criteria c=session.createCriteria(ProductType.class);
			li=c.list();
			li.remove(6);
		} catch (HibernateException e) {
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}
		return li;
	}
}
