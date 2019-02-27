package handle;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import entity.Departs;
import entity.Users;
import util.hibernateConfiguration;

public class UsersHandle extends AbstractHandle{
	public UsersHandle() {
		super(Users.class);
	}
	public Users checkLogin(String username, String password) {
		Users result = null;
		Session ss = null;
		try {
			ss = util.hibernateConfiguration.getInstance().openSession();
			Criteria cr = ss.createCriteria(Users.class);
			cr.add(Restrictions.eq("username", username));
			cr.add(Restrictions.eq("password", password));
			result = (Users) cr.uniqueResult();
		} catch (HibernateException e) {
			throw e;
		}
		return result;
	}
}
