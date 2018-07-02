package FarmerPortal;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.pojo.Contact;

public class ContactInfo {


	//Add Contact
	public static int addContact(Contact pr)
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


	//Count Of Contacts
	public static int countOfContacts()
	{
		int rows=0;
		Session session=Connect.sf.openSession();
		try {
			Criteria c=session.createCriteria(Contact.class).setProjection(Projections.rowCount());
			rows=(int) c.uniqueResult();

		} catch (HibernateException e) {
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}


		return rows;
	}


	//View All Contacts
	public static List<Contact> getAllContacts()
	{
		List<Contact> li=null;
		Session session=Connect.sf.openSession();
		try {
			Criteria c=session.createCriteria(Contact.class);
			li=c.list();

		} catch (HibernateException e) {
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}

		return li;

	}


	//Info Of One Contact By ID
	public static Contact getContactById(int id)
	{
		Contact p=null;
		Session session=Connect.sf.openSession();
		try {
			Criteria c=session.createCriteria(Contact.class);
			c.add(Restrictions.eq("ContactId", id));
			p=(Contact)c.uniqueResult();

		} catch (HibernateException e) {
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}
		return p;
	}


	//Delete Contact
	public static void deleteContact(Contact p)
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
