package com.xuyy.demo;

public class EmployeeTest {
    public static void main(String[] args) {
        Employee empOne = new Employee("xyy1");
        Employee empTwo = new Employee("xyy2");

        empOne.empAge(21);
        empOne.empDesignation("高级程序员");
        empOne.empSalary(1000);
        empOne.printEmployee();

        empTwo.empAge(22);
        empTwo.empDesignation("菜鸟程序员");
        empTwo.empSalary(500);
        empTwo.printEmployee();
    }
}

