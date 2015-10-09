package net.gonghl.springmvc.dao.impl;

import net.gonghl.springmvc.dao.UserInfoDao;
import net.gonghl.springmvc.model.UserInfo;

import org.springframework.stereotype.Repository;

@Repository("userInfoDao")
public class UserInfoDaoImpl extends BaseDaoImpl<UserInfo, Long> implements UserInfoDao {

}
