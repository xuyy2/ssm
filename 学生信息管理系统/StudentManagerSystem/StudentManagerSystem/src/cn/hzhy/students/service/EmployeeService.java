/**
 * 
 */
package cn.hzhy.students.service;

import java.util.List;

import cn.hzhy.students.entity.Employee;
import cn.hzhy.students.entity.Student;

/**
 * 
 * @author Administrator
 *
 */
public interface EmployeeService {
	/**
	 * 登录
	 * @param employee
	 * @return
	 */
	public Employee login(Employee employee);
	
	/**
	 * 查询所有学生
	 * @return
	 */
	public List<Student> list();
	
	/**
	 * 删除学生信息
	 */
	public void deleteStudent(Student student);
	
	
}
