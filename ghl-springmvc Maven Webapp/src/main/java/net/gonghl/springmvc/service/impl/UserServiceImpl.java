package net.gonghl.springmvc.service.impl;

import java.io.Serializable;

import javax.annotation.Resource;

import net.gonghl.springmvc.dao.UserDao;
import net.gonghl.springmvc.entity.User;
import net.gonghl.springmvc.service.UserService;

import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Resource(name="userDao")
	private UserDao userDao;
	
    @Override
    public void test() {
        System.out.println("Hello World!");
    }

	@Override
	public User find(Serializable id) {
		// TODO Auto-generated method stub
		return userDao.find(id);
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

}