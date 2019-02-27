package handle;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import bean.Pager;
import bean.StaffPager;
import entity.Departs;
import entity.Staffs;
import util.hibernateConfiguration;

public class StaffsHandle extends AbstractHandle {
	public StaffsHandle() {
		super(Staffs.class);
	}

	public List<Staffs> page(StaffPager pager) {
		List<Staffs> list = new ArrayList<>();
		Session ss = null;
		try {
			ss = util.hibernateConfiguration.getInstance().openSession();
			Criteria cr = ss.createCriteria(Staffs.class);
			if (pager.getOrderColumn() != null && !pager.getOrderColumn().trim().equals("")) {
				cr.addOrder(pager.getAsc() ? Order.asc(pager.getOrderColumn()) : Order.desc(pager.getOrderColumn()));
			}
			if (pager.getKeyword() != null && !pager.getKeyword().trim().equals("")) {
				Integer id = null;
				try {
					id = Integer.parseInt(pager.getKeyword());
				} catch (Exception e) {
					e.printStackTrace();
				}
				cr.add(Restrictions.or(Restrictions.eq("id", id),
						Restrictions.like("name", pager.getKeyword(), MatchMode.ANYWHERE),
						Restrictions.eq("email", pager.getKeyword()), Restrictions.eq("phone", pager.getKeyword())));
			}
			if (pager.getDepartId() != null && pager.getDepartId() != 0) {
				cr.add(Restrictions.eq("departId.id", pager.getDepartId()));
			}
			pager.setTotalResult(((List<Staffs>) cr.list()).size());
			cr.setMaxResults(pager.getDisplayPerPage());
			cr.setFirstResult(pager.getFirstResult());
			list = (List<Staffs>) cr.list();
		} catch (Exception e) {
			throw e;
		}
		return list;
	}
	public static Staffs findByID(Integer id) {
		Session ss = hibernateConfiguration.getInstance().openSession();
		try {
			return (Staffs)ss.createCriteria(Staffs.class).add(Restrictions.eq("id", id)).uniqueResult();
		} catch (Exception e) {
			if (ss.getTransaction().isActive()) {
				ss.getTransaction().rollback();
				e.printStackTrace();
			}
		}
		return null;
	}
}
