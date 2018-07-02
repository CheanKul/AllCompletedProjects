package FarmerPortal;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.pojo.Machinary;
import com.pojo.Product;

public class MachinaryInfo {

	//Add New Machinary
	public static int addMachinary(Machinary me)
	{

		Transaction tr=null;
		Session session=Connect.sf.openSession();
		try {
			tr=session.beginTransaction();
			session.save(me);
			tr.commit();

		} catch (HibernateException e) {
			if (tr!=null) tr.rollback();
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}
		return 1;
	}

	
	//Count Of Machinary
	public static int countOfMachinary()
	{
		int rows=0;
		Session session=Connect.sf.openSession();
		try {
			Criteria c=session.createCriteria(Machinary.class).setProjection(Projections.rowCount());
			rows=(int) c.uniqueResult();

		} catch (HibernateException e) {
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}

		return rows;
	}

	
	//View All Machinary
	public static List<Machinary> getAllMachinary()
	{
		List<Machinary> li1=null;
		Session session=Connect.sf.openSession();
		try {
			Criteria c=session.createCriteria(Machinary.class);
			li1=c.list();
			


		} catch (HibernateException e) {
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}
		return li1;

	}


	//Machinery Info Till 20HP
	public static List<Machinary> mechine20HP()
	{
		List<Machinary> li=null;
		Session session=Connect.sf.openSession();
		try {
			Criteria c=session.createCriteria(Machinary.class).add(Restrictions.le("engineHp", 20));
			li=c.list();

		} catch (HibernateException e) {
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}
		return li;

	}

	
	//Machinery Info Between 21HP to 30HP
	public static List<Machinary> mechine21to30HP()
	{
		List<Machinary> li=null;
		Session session=Connect.sf.openSession();
		try {
			Criteria c=session.createCriteria(Machinary.class).add(Restrictions.gt("engineHp", 20)).add(Restrictions.le("engineHp", 30));
			li=c.list();

		} catch (HibernateException e) {
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}
		return li;
	}


	//Machinery Info Between 31HP to 40HP
	public static List<Machinary> mechine31to40HP()
	{
		List<Machinary> li=null;
		Session session=Connect.sf.openSession();
		try {
			Criteria c=session.createCriteria(Machinary.class).add(Restrictions.gt("engineHp", 30)).add(Restrictions.le("engineHp", 40));
			li=c.list();


		} catch (HibernateException e) {
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}
		return li;
	}


	//Machinery Info Between 41HP to 50HP
	public static List<Machinary> mechine40()
	{
		List<Machinary> li=null;
		Session session=Connect.sf.openSession();
		try {
			Criteria c=session.createCriteria(Machinary.class).add(Restrictions.gt("engineHp", 40));
			li=c.list();

		} catch (HibernateException e) {
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}
		return li;
	}


	//Info Of One Product By ID
	public static Machinary getMachinaryById(int id)
	{
		Machinary p=null;
		Session session=Connect.sf.openSession();
		try {
			Criteria c=session.createCriteria(Machinary.class);
			c.add(Restrictions.eq("machineId", id));
			p=(Machinary)c.uniqueResult();

		} catch (HibernateException e) {
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}
		return p;
	}

	
	//Delete Product
	public static void deleteMachinary(Machinary p)
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

