package cn.hzhy.oa.service.impl;

import java.util.List;

import cn.hzhy.oa.dao.EmployeeDao;
import cn.hzhy.oa.entity.Employee;
import cn.hzhy.oa.service.EmployeeService;
import cn.hzhy.oa.util.EmployeeProperties;
import cn.hzhy.oa.util.PageUtil;

public class EmployeeServiceImpl implements EmployeeService {
	private EmployeeDao employeeDao;
	
	public void setEmployeeDao(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}

	@Override
	public Employee login(Employee employee) {
		List<Employee> empList= employeeDao.getByName(employee.getEmpName());
		Employee result=null;
		if(empList!=null&&empList.size()!=0){
			result=empList.get(0);
			if(result.getPassword().equals(employee.getPassword())){
				return result;
			}
		}
		return null;
	}

	public PageUtil<Employee> getEmpListByPage(int pageSize, int currPageNo,
			EmployeeProperties condition) {
		PageUtil<Employee> pageUtil=new PageUtil<Employee>();
		List<Employee> empList=employeeDao.getEmployeeByPage(pageSize, currPageNo, condition);
		pageUtil.setCurrPageNo(currPageNo);
		pageUtil.setTotalPages(this.getTotalPages(pageSize, condition));
		pageUtil.setList(empList);
		return pageUtil;
	}

	public int getTotalPages(int pageSize, EmployeeProperties condition) {
		//获取总的记录数
		int totalRecords=employeeDao.getEmployeeList(condition).size();
		return totalRecords%pageSize==0?totalRecords/pageSize:totalRecords/pageSize+1;
	}

}
