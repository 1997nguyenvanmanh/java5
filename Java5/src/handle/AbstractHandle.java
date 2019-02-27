package handle;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;

import util.hibernateConfiguration;

public abstract class AbstractHandle<E> implements Serializable {

	public final Class<E> entityClass;

	public AbstractHandle(Class<E> entityClass) {
		this.entityClass = entityClass;
	}

	public E insert(E entity) {
		Session ss = hibernateConfiguration.getInstance().openSession();
		try {
			ss.beginTransaction();
			ss.save(entity);
			ss.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			if (ss.getTransaction().isActive()) {
				ss.getTransaction().rollback();
				e.printStackTrace();
			}
		}
		return null;
	}

	public E update(E entity) {
		Session ss = hibernateConfiguration.getInstance().openSession();
		try {
			ss.beginTransaction();
			ss.update(entity);
			ss.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			if (ss.getTransaction().isActive()) {
				ss.getTransaction().rollback();
				e.printStackTrace();
			}
		}
		return null;
	}

	public boolean delete(E entity) {
		Session ss = hibernateConfiguration.getInstance().openSession();
		try {
			ss.beginTransaction();
			ss.delete(entity);
			ss.getTransaction().commit();
			return true;
		} catch (Exception e) {
			if (ss.getTransaction().isActive()) {
				ss.getTransaction().rollback();
				e.printStackTrace();
			}
		}
		return false;
	}

	public E findById(Integer id) {
		System.out.println("findById("+id+")");
		Session ss = hibernateConfiguration.getInstance().openSession();
		try {
			return (E) ss.get(entityClass, id);
		} catch (Exception e) {
			if (ss.getTransaction().isActive()) {
				ss.getTransaction().rollback();
				e.printStackTrace();
			}
		}
		return null;
	}
	public List<E> findAll() {
		Session ss = hibernateConfiguration.getInstance().openSession();
		try {
			return (List<E>)ss.createCriteria(entityClass).list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
