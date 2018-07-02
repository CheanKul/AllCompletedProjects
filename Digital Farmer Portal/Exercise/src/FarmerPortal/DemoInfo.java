package FarmerPortal;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;

import com.pojo.Demo;
import com.pojo.Farmer;
import com.pojo.Machinary;

public class DemoInfo {

	// Add Demo Request
	public static int addDemoReq(Demo d)
	{
		Transaction tr=null;
		Session session=Connect.sf.openSession();
		try {
			tr=session.beginTransaction();

			session.save(d);
			tr.commit();     
		} catch (HibernateException e) {
			if (tr!=null) tr.rollback();
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}
		return 1;
	}
	
	
	//Get All Demos
	public static List<Demo> getAllDemo()
	{
		List<Demo> li=null;
		Session session=Connect.sf.openSession();
		try {
			Criteria c=session.createCriteria(Demo.class);
			li=c.list();
			
		} catch (HibernateException e) {
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}
		return li;
	}
	
	//Get Count Demos
		public static int getDemoCnt()
		{
			int rows=0;
			Session session=Connect.sf.openSession();
			try {
				Criteria c=session.createCriteria(Demo.class).setProjection(Projections.rowCount());
				rows=(int) c.uniqueResult();

				
			} catch (HibernateException e) {
				e.printStackTrace(); 
			} finally {
				session.close(); 
			}
			return rows;
		}
		
		
	
	
}
