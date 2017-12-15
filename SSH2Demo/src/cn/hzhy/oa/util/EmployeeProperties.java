package cn.hzhy.oa.util;

import java.util.Date;

/**
 * 用于封装员工信息查询条件的实体类
 * 
 * @author Administrator
 * 
 */
public class EmployeeProperties {
	private String empName; // 用户名
	private Date start; // 出生起始时间
	private Date end; // 出生结束时间
	private Integer roleId; // 角色ID
	private Integer status; // 状态

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public Date getStart() {
		return start;
	}

	public void setStart(Date start) {
		this.start = start;
	}

	public Date getEnd() {
		return end;
	}

	public void setEnd(Date end) {
		this.end = end;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
}
