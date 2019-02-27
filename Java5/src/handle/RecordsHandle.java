package handle;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import bean.Pager;
import bean.RecordPager;
import entity.Records;
import entity.Staffs;

public class RecordsHandle extends AbstractHandle {

	public RecordsHandle() {
		super(Records.class);
	}

	public List<Records> pagerRecords(RecordPager pager) {
		List<Records> list = new ArrayList<>();
		Session ss = null;
		try {
			ss = util.hibernateConfiguration.getInstance().openSession();
			Criteria cr = ss.createCriteria(Records.class);
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
						Restrictions.like("reason", pager.getKeyword(), MatchMode.ANYWHERE)));
			}
			if (pager.getStaffId() != null && pager.getStaffId() != 0) {
				cr.add(Restrictions.eq("staffId.id", pager.getStaffId()));
			}
			if (pager.getDepartId() != null && pager.getDepartId() != 0) {
				cr.add(Restrictions.eq("departId.id", pager.getDepartId()));
			}
			pager.setTotalResult(((List<Staffs>) cr.list()).size());
			cr.setMaxResults(pager.getDisplayPerPage());
			cr.setFirstResult(pager.getFirstResult());
			list = (List<Records>) cr.list();
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

	public List pagerReportByStaffs(RecordPager pager) {
		List list = null;
		Session ss = null;
		try {
			ss = util.hibernateConfiguration.getInstance().openSession();
			if (ss != null) {
				Query que = ss.createQuery("SELECT staffId.id," + "SUM(case when type=1 then 1 else 0 end),"
						+ " SUM(case when type=0 then 1 else 0 end)" + " FROM Records " + "GROUP BY staffId.id "
						+ "order by (SUM(case when type=1 then 1 else 0 end)-SUM(case when type=0 then 1 else 0 end)) desc");
				pager.setTotalResult((que.list()).size());
				que.setMaxResults(pager.getDisplayPerPage());
				que.setFirstResult(pager.getFirstResult());
				list = que.list();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List top10() {
		List list = null;
		Session ss = null;
		try {
			ss = util.hibernateConfiguration.getInstance().openSession();
			if (ss != null) {
				Query que = ss.createQuery("SELECT staffId.id, " + "SUM(case when type=1 then 1 else 0 end),"
						+ " SUM(case when type=0 then 1 else 0 end)" + " FROM Records "
						+ "GROUP BY staffId.id HAVING (SUM(case when type=1 then 1 else 0 end)- SUM(case when type=0 then 1 else 0 end))>0"
						+ "order by (SUM(case when type=1 then 1 else 0 end)-SUM(case when type=0 then 1 else 0 end)) desc");
				que.setMaxResults(10);
				list = que.list();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List pagerReportByDeparts() {
		List list = null;
		Session ss = null;
		try {
			ss = util.hibernateConfiguration.getInstance().openSession();
			if (ss != null) {
				Query que = ss.createQuery("SELECT staffId.departId.id, staffId.departId.name , "
						+ "SUM(case when type=1 then 1 else 0 end)," + " SUM(case when type=0 then 1 else 0 end) "
						+ "FROM Records " + "GROUP BY staffId.departId.id, staffId.departId.name "
						+ "order by (SUM(case when type=1 then 1 else 0 end)-SUM(case when type=0 then 1 else 0 end)) desc");
				list = que.list();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
