package cn.hzhy.students.web.action;

import java.util.List;
import java.util.Map;

import cn.hzhy.students.entity.Employee;
import cn.hzhy.students.entity.Student;
import cn.hzhy.students.service.EmployeeService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class EmployeeAction extends ActionSupport {
	private String message;	
	private Employee employee;
	private Student student;

	private EmployeeService employeeService;
	
	public EmployeeAction() {
	}

	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	public Student getStudent() {
		return student;
	}
	
	public void setStudent(Student student) {
		this.student = student;
	}
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
	/**
	 * 登录
	 * @return
	 */
	public String login(){
		System.out.println("进入login...");
		ActionContext ac=ActionContext.getContext();
		Employee result= employeeService.login(employee);
		List<Student> studentList=employeeService.list();
		if(result!=null){
			Map<String,Object> session= ac.getSession();
			//将登录用户信息保存在session中，便于以后权限访问控制
			session.put("loginedEmp", result);
			
			if(studentList!=null){
				//将登录用户信息保存在session中，便于以后权限访问控制
				session.put("studentList", studentList);
			}
			
			if(result.getPassword().equals(employee.getPassword())){
				return "admin";
			}
			
		}
		this.message="用户名和密码错误";
		Map<String,Object> request= (Map<String, Object>) ac.get("request");
		request.put("errLogin", this.message);
		return LOGIN;
	}
	
	public String delete(){
		System.out.println("进入delete...");
		ActionContext ac=ActionContext.getContext();
		Map<String,Object> session= ac.getSession();
		//获取 要删除的学生信息
		
		employeeService.deleteStudent(student);
		
		List<Student> studentList=employeeService.list();
			if(studentList!=null){ 
				//将登录用户信息保存在session中，便于以后权限访问控制
				session.put("studentList", studentList);
			}
			
			
		this.message="删除失败";
		Map<String,Object> request= (Map<String, Object>) ac.get("request");
		request.put("errLogin", this.message);
		return "delete";
	}
	
}
