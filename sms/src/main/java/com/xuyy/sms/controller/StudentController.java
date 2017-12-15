package com.xuyy.sms.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.xuyy.sms.model.Student;
import com.xuyy.sms.service.IStudentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.registry.infomodel.User;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

@Controller
@RequestMapping("/student")
public class StudentController {
    @Resource
    private IStudentService studentService;

    @RequestMapping("/showStudent.do")
    public void selectStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        Integer studentId=Integer.parseInt(request.getParameter("id"));
        Student student = this.studentService.selectStudent(studentId);
        ObjectMapper mapper = new ObjectMapper();
        response.getWriter().write(mapper.writeValueAsString(student));
        response.getWriter().close();
    }
}
