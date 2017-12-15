package cn.hzhy.oa.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * 角色信息类
 * 
 * @author Administrator
 * 
 */
public class Role implements Serializable {
	private Integer roleId; // 角色ID
	private String roleName; // 角色名称
	private String roleDesc; // 角色描述
	private Integer status; // 状态
	
	//定义Set集合,关联多个员工信息
	private Set<Employee> employees=new HashSet<Employee>();
	
	//建立和权限之间的多对多关联
	private Set<Right> rights=new HashSet<Right>();
	
	public Role(){
	}
	
	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleDesc() {
		return roleDesc;
	}

	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Set<Employee> getEmployees() {
		return employees;
	}

	public void setEmployees(Set<Employee> employees) {
		this.employees = employees;
	}

	public Set<Right> getRights() {
		return rights;
	}

	public void setRights(Set<Right> rights) {
		this.rights = rights;
	}
	
}
