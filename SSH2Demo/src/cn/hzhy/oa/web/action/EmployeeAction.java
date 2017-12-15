package cn.hzhy.oa.web.action;

import java.util.Map;

import cn.hzhy.oa.entity.Employee;
import cn.hzhy.oa.service.EmployeeService;
import cn.hzhy.oa.util.EmployeeProperties;
import cn.hzhy.oa.util.PageUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * EmployeeAction类，处理和员工信息相关的所有请求
 * @author Administrator
 *
 */
public class EmployeeAction extends ActionSupport {
	private String message;	
	private Employee employee;
	private EmployeeService employeeService;	
	private EmployeeProperties condition;
	private PageUtil<Employee> pageUtil=new PageUtil<Employee>();
	private Integer pageSize;
	//private Integer currPageNo;
	
	public PageUtil<Employee> getPageUtil() {
		return pageUtil;
	}

	public void setPageUtil(PageUtil<Employee> pageUtil) {
		this.pageUtil = pageUtil;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

//	public Integer getCurrPageNo() {
//		return currPageNo;
//	}
//
//	public void setCurrPageNo(Integer currPageNo) {
//		this.currPageNo = currPageNo;
//	}

	
	public EmployeeProperties getCondition() {
		return condition;
	}

	public void setCondition(EmployeeProperties condition) {
		this.condition = condition;
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

	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	/**
	 * 登录
	 * @return
	 */
	public String login(){
		//System.out.println("login()......");
		ActionContext ac=ActionContext.getContext();
		Employee result= employeeService.login(employee);
		if(result!=null){
			Map<String,Object> session= ac.getSession();
			//将登录用户信息保存在session中，便于以后权限访问控制
			session.put("loginedEmp", result);
			if(result.getRole().getRoleName().equals("管理员")){
				return "admin";
			}else if(result.getRole().getRoleName().equals("总经理")){
				return "manager";
			}else if(result.getRole().getRoleName().equals("部门经理")){
				return "deptManager";
			}else if(result.getRole().getRoleName().equals("财务经理")){
				return "cashier";
			}else if(result.getRole().getRoleName().equals("员工")){
				return "employee";
			}
		}
		this.message="用户名和密码错误";
		Map<String,Object> request= (Map<String, Object>) ac.get("request");
		request.put("errLogin", this.message);
		return LOGIN;
	}
	
	/**
	 * 分页查询
	 * @return
	 */
	public String list(){
		if(condition!=null&&condition.getEmpName()!=null&&!"".equals(condition.getEmpName())){
		  condition.setEmpName("%"+condition.getEmpName()+"%");
		}
		pageUtil=employeeService.getEmpListByPage(pageSize,pageUtil.getCurrPageNo(),condition);
		if(condition!=null&&condition.getEmpName()!=null&&!"".equals(condition.getEmpName())){
		  condition.setEmpName(condition.getEmpName().replace("%", ""));
		}
		
		return SUCCESS;
	}
}
