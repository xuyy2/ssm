package com.yiyi.crud.service.impl;

import com.yiyi.crud.dao.EmployeeDao;
import com.yiyi.crud.pojo.Employee;
import com.yiyi.crud.service.IEmployee;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("employeeService")
public class EmployeeImpl implements IEmployee {
    @Resource
    private EmployeeDao employeeDao;

    @Override
    public Employee getEmployeeById(int emp_id) {
        return this.employeeDao.selectByPrimaryKey(emp_id);
    }
}
