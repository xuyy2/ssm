package cn.hzhy.students.service.impl;


import java.util.List;

import cn.hzhy.students.dao.EmployeeDao;
import cn.hzhy.students.entity.Employee;
import cn.hzhy.students.entity.Student;
import cn.hzhy.students.service.EmployeeService;

public class EmployeeServiceImpl  implements EmployeeService {
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

	@Override
	public List<Student> list() {
		return employeeDao.getStudent();
	}

	@Override
	public void deleteStudent(Student student) {
		this.employeeDao.deleteStudentById(student.getSid());
	}

}
