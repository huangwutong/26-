package com.xh369.actions;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.cfg.Configuration;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.Transaction;

public class HibernateSessionFactory {

    private static String CONFIG_FILE_LOCATION = "/hibernate.cfg.xml";
    private static final ThreadLocal threadLocal = new ThreadLocal();
    private static final ThreadLocal threadLocalTrans = new ThreadLocal();
    private static Configuration configuration = null;
    private static SessionFactory sessionFactory;
    private static String configFile = CONFIG_FILE_LOCATION;

    static {
        try {
            configuration = new Configuration();
            configuration.configure(configFile);
            sessionFactory = configuration.buildSessionFactory();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private HibernateSessionFactory() {
    }

    //��session(����ȡsession)
    public static Session getSession() throws HibernateException {

        Session session = (Session) threadLocal.get();
        if (session == null || !session.isOpen()) {
            if (sessionFactory == null) {
                rebuildSessionFactory();
            }
            session = (sessionFactory != null) ? sessionFactory.openSession() : null;
            threadLocal.set(session);
        }
        return session;
    }

    //�ٴδ���sessionFactory����
    public static void rebuildSessionFactory() {

        try {
            sessionFactory = configuration.buildSessionFactory();
        } catch (Exception e) {
            System.err.println("%%%% Error Creating SessionFactory %%%%");
            e.printStackTrace();
        }
    }

    //�ر�session
    public static void closeSession() throws HibernateException {

        Session session = (Session) threadLocal.get();
        threadLocal.set(null);
        if (session != null) {
            session.close();
        }
    }

    //��������
    public static void beginTransaction(){

        Transaction trans = (Transaction) threadLocalTrans.get();
        try {
            if(trans == null){
                trans = getSession().beginTransaction();
                threadLocalTrans.set(trans);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    //�ύ����
    public static void commitTransaction(){

        Transaction trans = (Transaction) threadLocalTrans.get();
        try {
            if (trans != null && !trans.wasCommitted() && !trans.wasRolledBack()) {
                trans.commit();
            }
            threadLocalTrans.set(null);
        } catch (HibernateException e) {
            e.printStackTrace();
        }
    }

    //�ع�����
    public static void rollbackTransaction(){

        Transaction trans = (Transaction) threadLocalTrans.get();
        try {
            threadLocalTrans.set(null);
            if (trans != null && !trans.wasCommitted() && !trans.wasRolledBack()) {
                trans.rollback();
            }
        } catch (HibernateException e) {
            e.printStackTrace();
        }
    }


    //��ȡsessionFactory����
    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    //����Hibernate����
    public static void setConfigFile(String configFile) {

        HibernateSessionFactory.configFile = configFile;
        sessionFactory = null;
    }

    //��ȡHibernate����
    public static Configuration getConfiguration() {
        return configuration;
    }
}
