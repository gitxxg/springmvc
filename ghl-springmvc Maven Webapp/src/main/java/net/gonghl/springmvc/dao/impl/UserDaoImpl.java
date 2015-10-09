package net.gonghl.springmvc.dao.impl;

import java.io.Serializable;

import javax.annotation.Resource;

import net.gonghl.springmvc.dao.UserDao;
import net.gonghl.springmvc.entity.User;

import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

@Repository("userDao")
public class UserDaoImpl implements UserDao {
	Logger log = Logger.getLogger(UserDaoImpl.class);
	
	@Resource(name="sessionFactory")
	private SessionFactory sessionFactory;
	
	@Override
	public User find(Serializable id) {
		// TODO Auto-generated method stub
		if (sessionFactory == null) {
			log.info("sessionFactory == null");
		}
		return (User) sessionFactory.openSession().get(User.class, id);
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

}
