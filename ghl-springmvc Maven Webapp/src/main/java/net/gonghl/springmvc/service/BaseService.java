package net.gonghl.springmvc.service;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import net.gonghl.springmvc.entity.Page;

public interface BaseService<T, ID extends Serializable> {
	/**
	 * <保存实体> <完整保存实体>
	 * 
	 * @param t
	 *            实体参数
	 * @return
	 */
	public Serializable save(T t);

	/**
	 * <保存或者更新实体>
	 * 
	 * @param t
	 *            实体
	 */
	public void saveOrUpdate(T t);

	/**
	 * <load> <加载实体的load方法>
	 * 
	 * @param id
	 *            实体的id
	 * @return 查询出来的实体
	 */
	public T load(ID id);

	/**
	 * <get> <查找的get方法>
	 * 
	 * @param id
	 *            实体的id
	 * @return 查询出来的实体
	 */
	public T get(ID id);

	/**
	 * <contains>
	 * 
	 * @param t
	 *            实体
	 * @return 是否包含
	 */
	public boolean contains(T t);

	/**
	 * <delete> <删除表中的t数据>
	 * 
	 * @param t
	 *            实体
	 */
	public void delete(T t);

	/**
	 * <根据ID删除数据>
	 * 
	 * @param Id
	 *            实体id
	 * @return 是否删除成功
	 */
	public boolean deleteById(ID Id);

	/**
	 * <删除所有>
	 * 
	 * @param entities
	 *            实体的Collection集合
	 */
	public void deleteAll(Collection<T> entities);

	/**
	 * <执行Hql语句>
	 * 
	 * @param hqlString
	 *            hql
	 * @param values
	 *            不定参数数组
	 */
	public int executeUpdateByHql(String hqlString, Object... values);

	/**
	 * <执行Sql语句>
	 * 
	 * @param sqlString
	 *            sql
	 * @param values
	 *            不定参数数组
	 */
	public int executeUpdateByBySql(String sqlString, Object... values);

	/**
	 * <根据HQL语句查找唯一实体>
	 * 
	 * @param hqlString
	 *            HQL语句
	 * @param values
	 *            不定参数的Object数组
	 * @return 查询实体
	 */
	public T getByHql(String hqlString, Object... values);

	/**
	 * <根据SQL语句查找唯一实体>
	 * 
	 * @param sqlString
	 *            SQL语句
	 * @param values
	 *            不定参数的Object数组
	 * @return 查询实体
	 */
	public T getBySql(String sqlString, Object... values);

	/**
	 * <根据HQL语句，得到对应的list>
	 * 
	 * @param hqlString
	 *            HQL语句
	 * @param values
	 *            不定参数的Object数组
	 * @return 查询多个实体的List集合
	 */
	public List<T> getListByHql(String hqlString, Object... values);

	/**
	 * <根据SQL语句，得到对应的list>
	 * 
	 * @param sqlString
	 *            HQL语句
	 * @param values
	 *            不定参数的Object数组
	 * @return 查询多个实体的List集合
	 */
	public List<T> getListBySql(String sqlString, Object... values);

	/**
	 * <refresh>
	 * 
	 * @param t
	 *            实体
	 */
	public void refresh(T t);

	/**
	 * <update>
	 * 
	 * @param t
	 *            实体
	 */
	public void update(T t);

	/**
	 * <根据HQL得到记录数>
	 * 
	 * @param hql
	 *            HQL语句
	 * @param values
	 *            不定参数的Object数组
	 * @return 记录总数
	 */
	public Long countByHql(String hql, Object... values);

	/**
	 * 
	 * @param sql
	 * @param values
	 * @return
	 */
	public Long countBySql(String sql, Object... values);

	/**
	 * 
	 * @param hql
	 * @param values
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Page<T> findPageByHql(final String hql, final Object[] values,
			final int pageNo, final int pageSize);

	/**
	 * 
	 * @param hql
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Page<T> findPageByHql(final String hql, final int pageNo,
			final int pageSize);

	/**
	 * 
	 * @param Sql
	 * @param values
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Page<T> findPageBySql(final String Sql, final Object[] values,
			final int pageNo, final int pageSize);

	/**
	 * 
	 * @param Sql
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Page<T> findPageBySql(final String Sql, final int pageNo,
			final int pageSize);

}
