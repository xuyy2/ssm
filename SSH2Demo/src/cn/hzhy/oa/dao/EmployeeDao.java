package cn.hzhy.oa.dao;

import java.util.List;

import cn.hzhy.oa.entity.Employee;
import cn.hzhy.oa.util.EmployeeProperties;

/**
 * 员工信息持久化操作接口
 * @author Administrator
 *
 */
public interface EmployeeDao {
	/**
	 * 根据用户名查询员工信息
	 * @param userName
	 * @return
	 */
	public List<Employee> getByName(String empName);
	
	/**
	 * 分页查询员工信息
	 * @param conditions 查询信息
	 * @param pageSize 	  每页查询几条信息
	 * @param pageNo     当前页码
	 * @return
	 */
	public List<Employee> getEmployeeByPage(int pageSize,int pageNo,EmployeeProperties condition);
	
	/**
	 * 查询员工信息
	 * @param conditon
	 * @return
	 */
	public List<Employee> getEmployeeList(EmployeeProperties condition);

}
