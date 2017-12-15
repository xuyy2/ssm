
create tablespace studentsystem
datafile 'C:\jsp\studentsystem.dbf'
size 100m
autoextend on next 10m
maxsize unlimited
logging
extent management local;

/*
2.创建用户
描述：
创建用户root，密码为123456。
要求：
用户默认表空间为tablespace_bank。授予该用户connect和resource角色。该项目中所有数据库对象都属于bank模式。
*/
create user root identified by 123456
default tablespace studentsystem
temporary tablespace temp;

grant connect,resource to root;
--grant update,delete,insert,select on  all_all_tables to root;

------------------------------------------------------------------
/****************************************************************/
------------------------------------------------------------------
create table students                        --学生信息表
(
      sid  number(10)  not null，            ---学员编号
      name nvarchar2(50) not null，          ---姓名
      sex nvarchar2(4) not null，            ----性别
      age number(10)，                       ----年龄
      grade nvarchar2(20)，                  ----年级
      major nvarchar2(50)，                  -----专业
      address nvarchar2(250)，               -----地址
      primary key (sid)                      ---编号是主键
); 

  


--为学生信息表创建序列
create sequence seq_students
  start with 1
  minvalue 1
  maxvalue 9999999999
  increment by 1
  nocycle
  cache 20
  order;
  --drop sequence seq_students

insert into students(sid,name,sex,age,grade,major,address)
values(seq_students.nextval,'胡格','男','19','高三','计算机','北京');
insert into students(sid,name,sex,age,grade,major,address)
values(seq_students.nextval,'张美','女','16','初二','美术设计','上海');
insert into students(sid,name,sex,age,grade,major,address)
values(seq_students.nextval,'柳光','女','19','高三','文学','杭州');
commit;
--delete from students;


create table employee                      --管理员信息表
(
      emp_id number(10) not null,          --管理员编号
      emp_name nvarchar2(50) not null,         --姓名
      password nvarchar2(50) not null,     --密码
      primary key (emp_id)
); 


drop table employee;

create sequence seq_employee
  start with 1
  minvalue 1
  maxvalue 9999999999
  increment by 1
  nocycle
  cache 20
  order;
 --drop sequence seq_employee;

insert into employee(emp_id,emp_name, password)
values(seq_employee.nextval,'admin','123456');
commit;
--delete from employee;

delete from admin;

select * from students;
select * from employee;

