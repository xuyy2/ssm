package cn.hzhy.mybatisdemo.dao;

import cn.hzhy.mybatisdemo.dao.impl.EmployeeDaoImpl;

public class EmployeeDaoTest {

	public static void main(String[] args) {
		EmployeeDao empDao=new EmployeeDaoImpl();
		System.out.println("员工总数为:"+empDao.countAll());
	}

}
