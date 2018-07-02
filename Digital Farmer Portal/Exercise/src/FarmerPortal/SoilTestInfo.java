package FarmerPortal;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.pojo.SoilTest;

public class SoilTestInfo {

	//Add SoilTest
	public static int addSoilTest(SoilTest pr)
	{

		Transaction tr=null;
		Session session=Connect.sf.openSession();
		try {
			tr=session.beginTransaction();
			session.save(pr);
			tr.commit();
		} catch (HibernateException e) {
			if (tr!=null) tr.rollback();
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}

		return 1;
	}


	//Count Of SoilTests
	public static int countOfSoilTests()
	{
		int rows=0;
		Session session=Connect.sf.openSession();
		try {
			Criteria c=session.createCriteria(SoilTest.class).setProjection(Projections.rowCount());
			rows=(int) c.uniqueResult();

		} catch (HibernateException e) {
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}

		return rows;
	}


	//View All SoilTests
	public static List<SoilTest> getAllSoilTests()
	{
		List<SoilTest> li=null;

		Session session=Connect.sf.openSession();
		try {
			Criteria c=session.createCriteria(SoilTest.class);
			li=c.list();

		} catch (HibernateException e) {
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}

		return li;

	}


	//Info Of One SoilTest By ID
	public static SoilTest getSoilTestById(int id)
	{

		SoilTest p=null;
		Session session=Connect.sf.openSession();
		try {

			Criteria c=session.createCriteria(SoilTest.class);
			c.add(Restrictions.eq("testId", id));
			p=(SoilTest)c.uniqueResult();

		} catch (HibernateException e) {
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}return p;
	}


	//Delete SoilTest
	public static void deleteSoilTest(SoilTest p)
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
}
