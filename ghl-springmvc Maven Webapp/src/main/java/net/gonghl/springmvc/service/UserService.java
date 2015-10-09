package net.gonghl.springmvc.service;

import java.io.Serializable;

import net.gonghl.springmvc.entity.User;

/**
 * 
 * @author ghl
 *
 */
public interface UserService {
	public void test();
	public User find(Serializable id);
}