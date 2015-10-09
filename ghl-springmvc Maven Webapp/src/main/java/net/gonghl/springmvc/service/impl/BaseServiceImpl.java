package net.gonghl.springmvc.service.impl;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import net.gonghl.springmvc.dao.BaseDao;
import net.gonghl.springmvc.entity.Page;
import net.gonghl.springmvc.service.BaseService;

import org.springframework.transaction.annotation.Transactional;

@Transactional
public class BaseServiceImpl<T, ID extends Serializable> implements  BaseService<T, ID> {

	private BaseDao<T, ID> baseDao;
	
	@Override
	public Serializable save(T t) {
		// TODO Auto-generated method stub
		return baseDao.save(t);
	}

	@Override
	public void saveOrUpdate(T t) {
		// TODO Auto-generated method stub
		baseDao.saveOrUpdate(t);
	}

	@Override
	public T load(ID id) {
		// TODO Auto-generated method stub
		return baseDao.load(id);
	}

	@Override
	public T get(ID id) {
		// TODO Auto-generated method stub
		return baseDao.get(id);
	}

	@Override
	public boolean contains(T t) {
		// TODO Auto-generated method stub
		return baseDao.contains(t);
	}

	@Override
	public void delete(T t) {
		// TODO Auto-generated method stub
		baseDao.delete(t);
	}

	@Override
	public boolean deleteById(ID Id) {
		// TODO Auto-generated method stub
		return baseDao.deleteById(Id);
	}

	@Override
	public void deleteAll(Collection<T> entities) {
		// TODO Auto-generated method stub
		baseDao.deleteAll(entities);
	}

	@Override
	public int executeUpdateByHql(String hqlString, Object... values) {
		// TODO Auto-generated method stub
		return baseDao.executeUpdateByHql(hqlString, values);
	}

	@Override
	public int executeUpdateByBySql(String sqlString, Object... values) {
		// TODO Auto-generated method stub
		return baseDao.executeUpdateByBySql(sqlString, values);
	}

	@Override
	public T getByHql(String hqlString, Object... values) {
		// TODO Auto-generated method stub
		return baseDao.getByHql(hqlString, values);
	}

	@Override
	public T getBySql(String sqlString, Object... values) {
		// TODO Auto-generated method stub
		return baseDao.getBySql(sqlString, values);
	}

	@Override
	public List<T> getListByHql(String hqlString, Object... values) {
		// TODO Auto-generated method stub
		return baseDao.getListByHql(hqlString, values);
		
	}

	@Override
	public List<T> getListBySql(String sqlString, Object... values) {
		// TODO Auto-generated method stub
		return baseDao.getListBySql(sqlString, values);
	}

	@Override
	public void refresh(T t) {
		// TODO Auto-generated method stub
		baseDao.refresh(t);
	}

	@Override
	public void update(T t) {
		// TODO Auto-generated method stub
		baseDao.update(t);
	}

	@Override
	public Long countByHql(String hql, Object... values) {
		// TODO Auto-generated method stub
		return baseDao.countByHql(hql, values);
	}

	@Override
	public Long countBySql(String sql, Object... values) {
		// TODO Auto-generated method stub
		return baseDao.countBySql(sql, values);
	}

	@Override
	public Page<T> findPageByHql(String hql, Object[] values, int pageNo,
			int pageSize) {
		// TODO Auto-generated method stub
		return baseDao.findPageByHql(hql, values, pageNo, pageSize);
	}

	@Override
	public Page<T> findPageByHql(String hql, int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return baseDao.findPageByHql(hql, pageNo, pageSize);
	}

	@Override
	public Page<T> findPageBySql(String Sql, Object[] values, int pageNo,
			int pageSize) {
		// TODO Auto-generated method stub
		return baseDao.findPageBySql(Sql, values, pageNo, pageSize);
	}

	@Override
	public Page<T> findPageBySql(String Sql, int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return baseDao.findPageBySql(Sql, pageNo, pageSize);
	}

	public BaseDao<T, ID> getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao<T, ID> baseDao) {
		this.baseDao = baseDao;
	}

}
