package FarmerPortal;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.pojo.Cart;
import com.pojo.Farmer;

public class CartInfo {

	//Add To Cart
	public static int addCart(Cart pr)
	{
		Transaction tr=null;
		Session session=Connect.sf.openSession();
		try {
			tr=session.beginTransaction();
			Criteria c=session.createCriteria(Cart.class).add(Restrictions.eq("farmer", pr.getFarmer())).add(Restrictions.eq("product", pr.getProduct()));
			Cart ca=(Cart)c.uniqueResult();
			if(ca==null)
			{
				session.saveOrUpdate(pr);
			}else
			{
				ca.setQuantity(pr.getQuantity());
				ca.setTotal(pr.getTotal());
				session.saveOrUpdate(ca);
			}
			pr.getId();
			tr.commit();

		} catch (HibernateException e) {
			if (tr!=null) tr.rollback();
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}		
		return 1;
	}



	//Count Of Carts
	public static int countOfCarts(int fid)
	{
		int rows=0;
		Session session=Connect.sf.openSession();
		try {
			Farmer f=FarmersInfo.getInfoById(fid);
			Criteria c=session.createCriteria(Cart.class).add(Restrictions.eq("farmer", f)).setProjection(Projections.rowCount());
			rows=(int) c.uniqueResult();

		} catch (HibernateException e) {
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}

		return rows;
	}

	//View All Carts
	public static List<Cart> getCartsByFarmerId(int fid)
	{
		List<Cart> li=null;
		Session session=Connect.sf.openSession();

		try {
			Farmer f=FarmersInfo.getInfoById(fid);
			Criteria c=session.createCriteria(Cart.class).add(Restrictions.eq("farmer", f));
			li=c.list();	         
		} catch (HibernateException e) {
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}
		return li;

	}


	//View Carts by Cart Id
	public static Cart getCartsById(int cid)
	{
		Cart li=null;
		Session session=Connect.sf.openSession();
		try {
			Criteria c=session.createCriteria(Cart.class).add(Restrictions.eq("id", cid));
			li=(Cart)c.uniqueResult();	         
		} catch (HibernateException e) {
			e.printStackTrace(); 
		} finally {
//			session.close(); 
		}
		return li;

	}

	//Delete From Cart
	public static void deleteCartOfFamer(int f)
	{
		Transaction tr=null;
		Session session=Connect.sf.openSession();

		try {
			tr=session.beginTransaction();

			List<Cart> li=getCartsByFarmerId(f);
			for(Cart c:li)
			{
				session.delete(c);
			}
			tr.commit();
		} catch (HibernateException e) {
			if (tr!=null) tr.rollback();
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}
	}
}
