package cn.hzhy.students.dao;

import java.util.List;

import cn.hzhy.students.entity.Employee;
import cn.hzhy.students.entity.Student;

/**
 * 员工信息持久化接口
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
	 * 查询学生信息
	 * @return
	 */
	public List<Student> getStudent();
	
	/**
	 * 删除学生信息
	 */
	public void deleteStudentById(Integer sid);

}
