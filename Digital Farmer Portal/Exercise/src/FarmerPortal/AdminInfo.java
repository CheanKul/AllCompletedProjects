package FarmerPortal;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.pojo.*;
public class AdminInfo 
{
	public AdminInfo() {

	}
	public static String chkAdmin(Admin admin)
	{
		Admin a=null;
		Session session=Connect.sf.openSession();
		try {
			System.out.println("HIIIIIIIII");
			Criteria c=session.createCriteria(Admin.class).add(Restrictions.eq("adminUsername", admin.getAdminUsername())).add(Restrictions.eq("adminPassword", admin.getAdminPassword()));
			if(c.uniqueResult() != null)
			{
				a=(Admin) c.uniqueResult();
				
			}
			else
			{
				return null;
			}
	         
	      } catch (HibernateException e) {
	         
	         e.printStackTrace(); 
	      } finally {
	         session.close(); 
	      }
		return a.getAdminName();
		
	}
}



