package cn.hzhy.mybatisdemo.dao;

import cn.hzhy.mybatisdemo.entity.Employee;

public interface EmployeeDao {
	/**
	 * 获取员工总数
	 * @return 员工总数量
	 */
	public int countAll();
	
	/**
	 * 根据ID查询员工信息
	 * @param empId 员工ID
	 * @return Employee对象
	 */
	public Employee getById(int empId);
	
}
