package net.gonghl.springmvc.dao;

import java.io.Serializable;

import net.gonghl.springmvc.entity.User;

public interface UserDao {
	public User find(Serializable id);
}
