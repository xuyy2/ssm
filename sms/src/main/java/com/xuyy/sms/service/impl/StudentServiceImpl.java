package com.xuyy.sms.service.impl;

import com.xuyy.sms.dao.IStudentDao;
import com.xuyy.sms.model.Student;
import com.xuyy.sms.service.IStudentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("studentService")
public class StudentServiceImpl implements IStudentService {
    @Resource
    private IStudentDao studentDao;

    public Student selectStudent(int studentId) {
        return this.studentDao.selectStudent(studentId);
    }
}
