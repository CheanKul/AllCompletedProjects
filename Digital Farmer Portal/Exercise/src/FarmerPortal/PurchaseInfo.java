package FarmerPortal;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.pojo.Farmer;
import com.pojo.Purchase;


public class PurchaseInfo {

	//Add Purchase
	public static int addPurchase(Purchase pr)
	{

		Transaction tr=null;
		Session session=Connect.sf.openSession();
		try {
			tr=session.beginTransaction();
			session.saveOrUpdate(pr);
			pr.getPurchaseId();
			tr.commit();  
		} catch (HibernateException e) {
			if (tr!=null) tr.rollback();
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}

		return 1;
	}


	//Count Of Purchases
	public static int countOfPurchases()
	{
		int rows=0;
		Session session=Connect.sf.openSession();
		try {
			Criteria c=session.createCriteria(Purchase.class).setProjection(Projections.rowCount());
			rows=(int) c.uniqueResult();

		} catch (HibernateException e) {
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}

		return rows;
	}


	//View All Purchases
	public static List<Purchase> getAllPurchasesByFarmer(Farmer fr)
	{
		List<Purchase> li=null;
		Session session=Connect.sf.openSession();
		try {
			Criteria c=session.createCriteria(Purchase.class).add(Restrictions.eq("farmer", fr));
			li=c.list();
		} catch (HibernateException e) {
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}
		return li;
	}


	//Info Of One Purchase By ID
	public static Purchase getPurchaseById(int id)
	{
		Purchase p=null;
		Session session=Connect.sf.openSession();
		try {
			Criteria c=session.createCriteria(Purchase.class);
			c.add(Restrictions.eq("purchaseId", id));
			p=(Purchase)c.uniqueResult();     
		} catch (HibernateException e) {
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}
		return p;
	}


	//Delete Purchase
	public static void deletePurchase(Purchase p)
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
	
	//View All Purchases
	public static List<Purchase> getAllPurchases()
	{
		List<Purchase> li=null;
		Session session=Connect.sf.openSession();
		try {
			Criteria c=session.createCriteria(Purchase.class);
			li=c.list();
		} catch (HibernateException e) {
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}
		return li;
	}

	
	
}
