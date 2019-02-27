package util;

import javax.transaction.Transaction;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.transaction.TransactionStatus;

public class hibernateConfiguration {
	private static final hibernateConfiguration INSTANCE = new hibernateConfiguration();

    private static SessionFactory sessionFactory = hibernateConfiguration.INSTANCE.buildSessionFactory();

    private hibernateConfiguration() {
    }

    public static hibernateConfiguration getInstance() {
        return INSTANCE;
    }

    public void rollbackTransaction(Transaction tran) {
        if (tran != null) {
            try {
                tran.rollback();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }

   

    private SessionFactory buildSessionFactory() {
        try {
            if (sessionFactory == null) {
                Configuration configuration = new Configuration().configure();
                sessionFactory = configuration.buildSessionFactory();
            }
        } catch (Throwable ex) {
            System.err.println("Failed to create sessionFactory object." + ex);
            ex.printStackTrace();
        }
        return sessionFactory;
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public Session openSession() {
        Session session=null;
        try {
            session=sessionFactory.openSession();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return session;
    }

    public void shutdown() {
        if (sessionFactory != null) {
            sessionFactory.close();
            sessionFactory = null;
        }
    }

    public void open() {
        if (sessionFactory == null) {
            sessionFactory = hibernateConfiguration.INSTANCE.buildSessionFactory();
        }
    }

    public void flushSession(Session session) {
        if (session != null) {
            session.flush();
            session.clear();
        }
    }

    public void closeSession(Session session) {
        try {
            if (session != null && !session.isDirty()) {
                session.close();
            }
        } catch (Exception e) {

        }
    }
}
