package com.xuyy.sms.dao;

import com.xuyy.sms.model.Student;

public interface IStudentDao {
    Student selectStudent(int id);
}
