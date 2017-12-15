package cn.hzhy.oa.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.hzhy.oa.dao.EmployeeDao;
import cn.hzhy.oa.entity.Employee;
import cn.hzhy.oa.util.EmployeeProperties;

/**
 * 通过Hibernate模板类实现 员工信息持久化操
 * @author Administrator
 *
 */
public class EmployeeDaoImpl extends HibernateDaoSupport implements EmployeeDao {

	
	public List<Employee> getByName(String empName) {
		return this.getHibernateTemplate().findByNamedParam("from Employee where empName like :empName", "empName", empName);
	}

	@Override
	public List<Employee> getEmployeeByPage(final int pageSize,final int pageNo,final EmployeeProperties condition) {
		return this.getHibernateTemplate().executeFind(new HibernateCallback() {
			@Override
			//hibernate 回调接口中定义的方法 用于获取session对象 实现动态复杂条件下的查询
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				StringBuilder hql=new StringBuilder();
				//定义一个基本的HQL查询语句
				hql.append("from Employee where 1=1");
				if(condition!=null){
					//判断用户名条件
					if(condition.getEmpName()!=null&&!"".equals(condition.getEmpName())){
						hql.append(" and empName like :empName");
					}
					//判断注册起始和结束时间
					if(condition.getStart()!=null&&!"".equals(condition.getStart())){
						if(condition.getEnd()!=null&&!"".equals(condition.getEnd())){
							hql.append(" and birthday between :start and :end" );
						}else{
							hql.append(" and birthday>=:start");
						}
					}else if(condition.getEnd()!=null&&!"".equals(condition.getEnd())){
						hql.append(" and birthday<=:end" );
					}
					//判断角色条件		
					if(condition.getRoleId()!=null
							&&!"".equals(condition.getRoleId())
							&&condition.getRoleId()!=0){
						hql.append(" and role.roleId=:roleId");
					}
					//判断状态条件
					if(condition.getStatus()!=null
							&&!"".equals(condition.getStatus())
							&&condition.getStatus()!=-1){
						hql.append(" and status=:status");
					}
				}
				hql.append(" order by birthday desc");
				
				try {
					Query query = session.createQuery(hql.toString());
					//给命名参数设置值
					if(condition!=null){
						query.setProperties(condition);
					}
					//设定分页参数
					query.setFirstResult(pageSize*(pageNo-1));
					query.setMaxResults(pageSize);			
					//执行查询
					return query.list();	
				} catch (HibernateException e) {
					e.printStackTrace();
				} 
				return null;
			}	
		});
	}

	@Override
	public List<Employee> getEmployeeList(final EmployeeProperties condition) {
		return this.getHibernateTemplate().executeFind(new HibernateCallback() {
			@Override
			//hibernate 回调接口中定义的方法 用于获取session对象 实现动态复杂条件下的查询
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				StringBuilder hql=new StringBuilder();
				//定义一个基本的HQL查询语句
				hql.append("from Employee where 1=1");
				if(condition!=null){
					//判断用户名条件
					if(condition.getEmpName()!=null&&!"".equals(condition.getEmpName())){
						hql.append(" and empName like :empName");
					}
					//判断注册起始和结束时间
					if(condition.getStart()!=null&&!"".equals(condition.getStart())){
						if(condition.getEnd()!=null&&!"".equals(condition.getEnd())){
							hql.append(" and birthday between :start and :end" );
						}else{
							hql.append(" and birthday>=:start");
						}
					}else if(condition.getEnd()!=null&&!"".equals(condition.getEnd())){
						hql.append(" and birthday<=:end" );
					}
					//判断角色条件		
					if(condition.getRoleId()!=null
							&&!"".equals(condition.getRoleId())
							&&condition.getRoleId()!=0){
						hql.append(" and role.roleId=:roleId");
					}
					//判断状态条件
					if(condition.getStatus()!=null
							&&!"".equals(condition.getStatus())
							&&condition.getStatus()!=-1){
						hql.append(" and status=:status");
					}
				}
				hql.append(" order by birthday desc");
				
				try {
					Query query = session.createQuery(hql.toString());
					//给命名参数设置值
					if(condition!=null){
						query.setProperties(condition);
					}
					//执行查询
					return query.list();	
				} catch (HibernateException e) {
					e.printStackTrace();
				}
				return null; 
			}	
		});
	}

}
