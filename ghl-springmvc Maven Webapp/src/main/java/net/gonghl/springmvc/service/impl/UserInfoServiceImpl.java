package net.gonghl.springmvc.service.impl;

import javax.annotation.Resource;

import net.gonghl.springmvc.dao.BaseDao;
import net.gonghl.springmvc.model.UserInfo;
import net.gonghl.springmvc.service.UserInfoService;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userInfoService")
@Transactional
public class UserInfoServiceImpl extends BaseServiceImpl<UserInfo, Long> implements UserInfoService {
	/** 
     * 注入DAO 
     */  
    @Resource(name = "userInfoDao")  
    public void setDao(BaseDao<UserInfo, Long> baseDao) {  
        super.setBaseDao(baseDao); 
    }  
  
    /** 
     * 若CustomerService 定义了BaseService没有的方法，则可以在这里实现 
     */  
}
