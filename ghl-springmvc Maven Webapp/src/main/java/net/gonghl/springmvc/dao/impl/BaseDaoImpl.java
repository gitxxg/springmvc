package net.gonghl.springmvc.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.Collection;
import java.util.List;

import javax.annotation.Resource;

import net.gonghl.springmvc.dao.BaseDao;
import net.gonghl.springmvc.entity.Page;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

@SuppressWarnings("unchecked")
public abstract class BaseDaoImpl<T, ID extends Serializable> implements BaseDao<T, ID> {

	@Resource(name="sessionFactory")
	private SessionFactory sessionFactory;
	protected Class<T> entityClass;

	public BaseDaoImpl() {
		this.entityClass = (Class<T>) ((ParameterizedType) getClass()
				.getGenericSuperclass()).getActualTypeArguments()[0];
	}

	protected Class<T> getEntityClass() {
		if (entityClass == null) {
			this.entityClass = (Class<T>) ((ParameterizedType) getClass()
					.getGenericSuperclass()).getActualTypeArguments()[0];
		}
		return entityClass;
	}

	/**
	 * <保存实体> <完整保存实体>
	 * 
	 * @param t
	 *            实体参数
	 */
	@Override
	public Serializable save(T t) {
		return this.getSession().save(t);
	}

	/**
	 * <保存或者更新实体>
	 * 
	 * @param t
	 *            实体
	 */
	@Override
	public void saveOrUpdate(T t) {
		this.getSession().saveOrUpdate(t);
	}

	/**
	 * <load> <加载实体的load方法>
	 * 
	 * @param id
	 *            实体的id
	 * @return 查询出来的实体
	 */
	@Override
	public T load(ID id) {
		return (T) this.getSession().load(getEntityClass(), id);
	}

	/**
	 * <get> <查找的get方法>
	 * 
	 * @param id
	 *            实体的id
	 * @return 查询出来的实体
	 */
	@Override
	public T get(ID id) {
		return (T) this.getSession().get(getEntityClass(), id);
	}

	/**
	 * <contains>
	 * 
	 * @param t
	 *            实体
	 * @return 是否包含
	 */
	@Override
	public boolean contains(T t) {
		return this.getSession().contains(t);
	}

	/**
	 * <delete> <删除表中的t数据>
	 * 
	 * @param t
	 *            实体
	 */
	@Override
	public void delete(T t) {
		this.getSession().delete(t);
	}
	
	/**
	 * <refresh>
	 * 
	 * @param t
	 *            实体
	 */
	@Override
	public void refresh(T t) {
		this.getSession().refresh(t);
	}

	/**
	 * <update>
	 * 
	 * @param t
	 *            实体
	 */
	@Override
	public void update(T t) {
		this.getSession().update(t);
	}

	/**
	 * <根据ID删除数据>
	 * 
	 * @param Id
	 *            实体id
	 * @return 是否删除成功
	 */
	@Override
	public boolean deleteById(ID Id) {
		T t = get(Id);
		if (t == null) {
			return false;
		}
		delete(t);
		return true;
	}

	/**
	 * <删除所有>
	 * 
	 * @param entities
	 *            实体的Collection集合
	 */
	@Override
	public void deleteAll(Collection<T> entities) {
		for (Object entity : entities) {
			this.getSession().delete(entity);
		}
	}

	/**
	 * <执行Hql语句>
	 * 
	 * @param hqlString
	 *            hql
	 * @param values
	 *            不定参数数组       
	 * @return
	 * 			  The number of entities updated or deleted.
	 */
	@Override
	public int executeUpdateByHql(String hqlString, Object... values) {
		Query query = this.getSession().createQuery(hqlString);
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
				query.setParameter(i, values[i]);
			}
		}
		return query.executeUpdate();
	}

	/**
	 * <执行Sql语句>
	 * 
	 * @param sqlString
	 *            sql
	 * @param values
	 *            不定参数数组
	 * @return
	 * 			  The number of entities updated or deleted.
	 */
	@Override
	public int executeUpdateByBySql(String sqlString, Object... values) {
		Query query = this.getSession().createSQLQuery(sqlString);
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
				query.setParameter(i, values[i]);
			}
		}
		return query.executeUpdate();
	}

	/**
	 * <根据HQL语句查找唯一实体>
	 * 
	 * @param hqlString
	 *            HQL语句
	 * @param values
	 *            不定参数的Object数组
	 * @return 查询实体
	 */
	@Override
	public T getByHql(String hqlString, Object... values) {
		Query query = this.getSession().createQuery(hqlString);
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
				query.setParameter(i, values[i]);
			}
		}
		return (T) query.uniqueResult();
	}

	/**
	 * <根据SQL语句查找唯一实体>
	 * 
	 * @param sqlString
	 *            SQL语句
	 * @param values
	 *            不定参数的Object数组
	 * @return 查询实体
	 */
	@Override
	public T getBySql(String sqlString, Object... values) {
		Query query = this.getSession().createSQLQuery(sqlString);
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
				query.setParameter(i, values[i]);
			}
		}
		return (T) query.uniqueResult();
	}

	/**
	 * <根据HQL语句，得到对应的list>
	 * 
	 * @param hqlString
	 *            HQL语句
	 * @param values
	 *            不定参数的Object数组
	 * @return 查询多个实体的List集合
	 */
	@Override
	public List<T> getListByHql(String hqlString, Object... values) {
		Query query = this.getSession().createQuery(hqlString);
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
				query.setParameter(i, values[i]);
			}
		}
		return query.list();
	}

	/**
	 * <根据SQL语句，得到对应的list>
	 * 
	 * @param sqlString
	 *            HQL语句
	 * @param values
	 *            不定参数的Object数组
	 * @return 查询多个实体的List集合
	 */
	@Override
	public List<T> getListBySql(String sqlString, Object... values) {
		Query query = this.getSession().createSQLQuery(sqlString);
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
				query.setParameter(i, values[i]);
			}
		}
		return query.list();
	}


	/**
	 * <根据HQL得到记录数>
	 * 
	 * @param hql
	 *            HQL语句
	 * @param values
	 *            不定参数的Object数组
	 * @return 记录总数
	 */
	@Override
	public Long countByHql(String hql, Object... values) {
		Query query = this.getSession().createQuery(hql);
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
				query.setParameter(i, values[i]);
			}
		}
		return (Long) query.uniqueResult();
	}


	/**
	 * 
	 * @param sql
	 * @param values
	 * @return
	 */
	@Override
	public Long countBySql(String sql, Object... values) {
		Query query = this.getSession().createSQLQuery(sql);
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
				query.setParameter(i, values[i]);
			}
		}
		return (Long) query.uniqueResult();
	}
	
	@Override
	public Page<T> findPageByHql(final String hql, final Object[] values, final int pageNo, final int pageSize) {
		Query query = this.getSession().createQuery(hql);
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
				query.setParameter(i, values[i]);
			}
		}
		int currentPage = pageNo > 1 ? pageNo : 1;
		List<T> list = query.setFirstResult((currentPage - 1) * pageSize).setMaxResults(pageSize).list();
		String countHql = "select count(*) " + hql.substring(hql.toLowerCase().indexOf("from"));
		Long totalRecord = (Long)countByHql(countHql, values);
		Page<T> page = new Page<T>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		page.settotalRecord(totalRecord);
		page.setPageRows(list);
		return page;
	}
	
	@Override
	public Page<T> findPageByHql(final String hql, final int pageNo, final int pageSize) {
		return findPageByHql(hql, null, pageNo, pageSize);
/*		Query query = this.getSession().createQuery(hql);
		int currentPage = pageNo > 1 ? pageNo : 1;
		List<T> list = query.setFirstResult((currentPage - 1) * pageSize).setMaxResults(pageSize).list();
		String countHql = "select count(*) " + hql.substring(hql.toLowerCase().indexOf("from"));
		Long totalRecord = (Long)this.getSession().createQuery(countHql).uniqueResult();
		Page<T> page = new Page<T>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		page.settotalRecord(totalRecord);
		page.setPageRows(list);
		return page;*/
	}

	
	@Override
	public Page<T> findPageBySql(final String sql, final Object[] values, final int pageNo, final int pageSize) {
		Query query = this.getSession().createSQLQuery(sql);
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
				query.setParameter(i, values[i]);
			}
		}
		int currentPage = pageNo > 1 ? pageNo : 1;
		List<T> list = query.setFirstResult((currentPage - 1) * pageSize).setMaxResults(pageSize).list();
		String countHql = "select count(*) " + sql.substring(sql.toLowerCase().indexOf("from"));
		Long totalRecord = (Long)countBySql(countHql, values);
		Page<T> page = new Page<T>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		page.settotalRecord(totalRecord);
		page.setPageRows(list);
		return page;
	}
	
	@Override
	public Page<T> findPageBySql(final String sql, final int pageNo, final int pageSize) {
		return findPageBySql(sql, null, pageNo, pageSize);
/*		Query query = this.getSession().createSQLQuery(sql);
		int currentPage = pageNo > 1 ? pageNo : 1;
		List<T> list = query.setFirstResult((currentPage - 1) * pageSize).setMaxResults(pageSize).list();
		String countHql = "select count(*) " + sql.substring(sql.toLowerCase().indexOf("from"));
		Long totalRecord = (Long)this.getSession().createSQLQuery(countHql).uniqueResult();
		Page<T> page = new Page<T>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		page.settotalRecord(totalRecord);
		page.setPageRows(list);
		return page;*/
	}
	
	/**
	 * @return the sessionFactory
	 */
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	/**
	 * @param sessionFactory
	 *            the sessionFactory to set
	 */
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	/**
	 * 
	 * @return session
	 */
	public Session getSession() {
		// 需要开启事物，才能得到CurrentSession
		return sessionFactory.getCurrentSession();
	}

}