package FarmerPortal;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.pojo.*;
public class CategoryInfo {


	//Add New Category
	public static int addCategory(Category pt)
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

	//Count Of Category
	public static int countOfCategory()
	{
		int rows=0;
		Session session=Connect.sf.openSession();
		try {
			Criteria c=session.createCriteria(Category.class).setProjection(Projections.rowCount());
			rows=(int) c.uniqueResult();	


		} catch (HibernateException e) {

			e.printStackTrace(); 
		} finally {
			session.close(); 
		}

		return rows;
	}

	//Delete Category
	public static void deleteCategory(Category pt)
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

	//Get One Category By Id
	public static Category getCategoryById(int id)
	{
		Category f=null;
		Session session=Connect.sf.openSession();
		try {
			Criteria c=session.createCriteria(Category.class);
			c.add(Restrictions.eq("id", id));
			f=(Category) c.uniqueResult();
		} catch (HibernateException e) {
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}
		return f;
	}

	//Get One Category By Category
	public static Category getCategoryByType(String type)
	{
		Category f=null;
		Session session=Connect.sf.openSession();
		try {

			Criteria c=session.createCriteria(Category.class);
			c.add(Restrictions.eq("category", type));
			f=(Category) c.uniqueResult();
		} catch (HibernateException e) {
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}

		return f;
	}


	//Get All Category
	public static List<Category> getAllCategory()
	{
		List<Category> li=null;
		Session session=Connect.sf.openSession();
		try {
			Criteria c=session.createCriteria(Category.class);
			li=c.list();

		} catch (HibernateException e) {
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}
		return li;

	}

}
