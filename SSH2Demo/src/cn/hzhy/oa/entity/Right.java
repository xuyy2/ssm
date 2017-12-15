package cn.hzhy.oa.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * 权限类
 * @author Administrator
 *
 */
public class Right implements Serializable{
	private Integer rightId;	//权限ID
	private String rightName;	//权限名称
	private String rightDesc;	//权限描述
	private String rightUrl;	//权限URL地址：请求Servlet/Action路径名称
	private Integer rightType;	//权限类别
	private Integer status;		//状态
	//父权限，多对一的关联
	private Right parent;
	//子权限，一对多的关联
	private Set<Right> children=new HashSet<Right>();
	//建立和角色之间的多对多关联
	private Set<Role> roles=new HashSet<Role>();
	
	public Right() {
		super();
	}
	
	public Right(String rightName, String rightDesc, String rightUrl,
			Integer rightType, Integer status, Right parent, Set<Right> children) {
		super();
		this.rightName = rightName;
		this.rightDesc = rightDesc;
		this.rightUrl = rightUrl;
		this.rightType = rightType;
		this.status = status;
		this.parent = parent;
		this.children = children;
	}

	public Integer getRightId() {
		return rightId;
	}
	public void setRightId(Integer rightId) {
		this.rightId = rightId;
	}
	public String getRightName() {
		return rightName;
	}
	public void setRightName(String rightName) {
		this.rightName = rightName;
	}
	public String getRightDesc() {
		return rightDesc;
	}
	public void setRightDesc(String rightDesc) {
		this.rightDesc = rightDesc;
	}
	public String getRightUrl() {
		return rightUrl;
	}
	public void setRightUrl(String rightUrl) {
		this.rightUrl = rightUrl;
	}
	public Integer getRightType() {
		return rightType;
	}
	public void setRightType(Integer rightType) {
		this.rightType = rightType;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Right getParent() {
		return parent;
	}
	public void setParent(Right parent) {
		this.parent = parent;
	}
	public Set<Right> getChildren() {
		return children;
	}
	public void setChildren(Set<Right> children) {
		this.children = children;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}	
}
