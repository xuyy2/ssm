package cn.hzhy.students.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.hzhy.students.dao.EmployeeDao;
import cn.hzhy.students.entity.Employee;
import cn.hzhy.students.entity.Student;

public class EmployeeDaoImpl extends HibernateDaoSupport implements EmployeeDao {

	@Override
	public List<Employee> getByName(String empName) {
		return this.getHibernateTemplate().findByNamedParam("from Employee where empName like:empName", "empName", empName);
	}

	@Override
	public List<Student> getStudent() {
		return this.getHibernateTemplate().find("from Student");
	}

	@Override
	public void deleteStudentById(Integer sid) {
		 this.getHibernateTemplate().delete(sid);
		
	}

}
