package com.xuyy.dao;

import com.xuyy.sms.dao.IStudentDao;
import com.xuyy.sms.model.Student;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

//加载spring配置文件
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class IStudentDaoTest {

    @Autowired
    private IStudentDao dao;

    @Test
    public void testSelectStudent() throws Exception {
        Integer id = 1;
        Student student = dao.selectStudent(id);
        System.out.println(student.getName());
    }

}
