package FarmerPortal;
import com.pojo.*;
import org.hibernate.Transaction;
import java.sql.*;
import java.util.*;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
public class FarmersInfo {

	// Insert All Values In Farmer Table and returns number of rows affected
	public static int insertFarmer(Farmer frmr)
	{
		Transaction tr=null;
		Session session=Connect.sf.openSession();
		try {

			tr=session.beginTransaction();

			session.saveOrUpdate(frmr);
			tr.commit();
		} catch (HibernateException e) {
			if (tr!=null) tr.rollback();
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}
		return 1;
	}


	//Count Of Farmers
	public static int countOfFarmer()
	{
		int rows=0;
		Session session=Connect.sf.openSession();
		try {
			Criteria c=session.createCriteria(Farmer.class).setProjection(Projections.rowCount());
			rows=(int) c.uniqueResult();


		} catch (HibernateException e) {
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}

		return rows;
	}


	//View All Farmers
	public static List<Farmer> getAllFarmer()
	{
		List<Farmer> li=null;
		Session session=Connect.sf.openSession();
		try {
			Criteria c=session.createCriteria(Farmer.class);
			li=c.list();

		} catch (HibernateException e) {
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}		
		return li;

	}

	//Info Of One Farmer By ID
	public static Farmer getInfoById(int id)
	{
		Farmer f=null;
		Session session=Connect.sf.openSession();
		try {
			Criteria c=session.createCriteria(Farmer.class);
			c.add(Restrictions.eq("farmerId", id));
			f=(Farmer) c.uniqueResult();

		} catch (HibernateException e) {
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}
		return f;
	}


	//Delete Farmer
	public static void deleteFarmer(Farmer f)
	{
		Transaction tr=null;
		Session session=Connect.sf.openSession();
		try {
			tr=session.beginTransaction();

			session.delete(f);
			tr.commit();


		} catch (HibernateException e) {
			if (tr!=null) tr.rollback();
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}


	}

	//Farmer Login
	public static Farmer chkFarmer(Farmer frmr)
	{
		Farmer f=null;
		Session session=Connect.sf.openSession();
		try {
			Criteria c=session.createCriteria(Farmer.class).add(Restrictions.eq("farmerUsername", frmr.getFarmerUsername())).add(Restrictions.eq("farmerPassword", frmr.getFarmerPassword()));
			if(c.uniqueResult() != null)
			{
				f=(Farmer) c.uniqueResult();
			}
			else
			{
				return null;
			}
			System.out.println(f.getFarmerName());
		} catch (HibernateException e) {
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}
		System.out.println("HIIIIIIIII");
		return f;
	}
}






