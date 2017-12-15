package cn.hzhy.oa.service;

import java.util.List;

import cn.hzhy.oa.entity.Employee;
import cn.hzhy.oa.util.EmployeeProperties;
import cn.hzhy.oa.util.PageUtil;

public interface EmployeeService {
	/**
	 * 登录
	 * @param employee
	 * @return
	 */
	public Employee login(Employee employee);
	
	/**
	 * 分页查询
	 * @param pageSize 
	 * @param currPageNo
	 * @param condition
	 * @return
	 */
	public PageUtil getEmpListByPage(int pageSize, int currPageNo,EmployeeProperties condition);
}
