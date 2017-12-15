package cn.hzhy.oa.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 员工信息类
 * 
 * @author Administrator
 * 
 */
public class Employee implements Serializable {
	private Integer empId;
	private String empName;
	private String password;
	private Integer sex;
	private Date birthday;
	private Integer status;
	
	//private Integer roleId;
	private Role role;	//员工关联的角色对象，并且是多对一的关联关系	

	public Integer getEmpId() {
		return empId;
	}

	public void setEmpId(Integer empId) {
		this.empId = empId;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public Integer getStatus() {
		return status;
	}
	
	public void setStatus(Integer status) {
		this.status = status;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}
	
//	public Integer getRoleId() {
//		return roleId;
//	}
//
//	public void setRoleId(Integer roleId) {
//		this.roleId = roleId;
//	}	
}
