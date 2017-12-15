
create tablespace mytablespace
datafile 'C:\jsp\hzhy.dbf'
size 100m
autoextend on next 10m
maxsize unlimited
logging
extent management local;

/*
2.创建用户
描述：
创建用户hzhy，密码为hzhy。
要求：
用户默认表空间为tablespace_bank。授予该用户connect和resource角色。该项目中所有数据库对象都属于bank模式。
*/
create user hzhy identified by hzhy
default tablespace mytablespace
temporary tablespace temp;

grant connect,resource to hzhy;
--grant update,delete,insert,select on  all_all_tables to bank;

------------------------------------------------------------------
/****************************************************************/
------------------------------------------------------------------
create table employees                  --员工信息表
(
       emp_id number(10) not null,      --员工ID，主键，由序列自动生成
       emp_name nvarchar2(50) not null, --员工姓名，非空
       password nvarchar2(20) not null, --密码，非空
       sex number(10) not null,         --性别，number类型，1—男，0—女
       birthday date not null,          --出生时间，非空
       role_id number(10),              --角色ID，外键           
       status number(10) not null       --状态，number类型，1—正常，0—禁用
); 
--创建主键
  alter table employees
    add constraints pk_emp_id
    primary key(emp_id);
--建立外键
alter table employees
  add constraints fk_employees_roles
  foreign key (role_id)
  references roles(role_id);    

create table roles                        --角色信息表
(
       role_id number(10) not null,       --角色ID，主键，由序列自动生成
       role_name nvarchar2(10) not null,  --角色名称，非空
       role_desc nvarchar2(250) not null, --角色说明，非空
       status number(10) not null         --状态，非空
)
--创建主键
alter table roles
  add constraints pk_role_id
  primary key(role_id);
    
create table rights                       --权限信息表（rights）
(
       right_id	number(10) not null,      --权限ID，主键，由序列自动生成
       parent_id number(10),               --父权限编号，外键，引用自身表中主键列的值
       right_name nvarchar2(50) not null, --权限名称，非空
       right_desc nvarchar2(250),         --权限说明
       right_url nvarchar2(250),          --权限URL
       right_type number(10) not null,    --权限类型，number数据类型，非空，1-菜单；2-按钮
       status number(10) not null         --状态，number数据类型
)


--创建主键
  alter table rights
    add constraints pk_right_id
    primary key(right_id);
--建立外键
alter table rights
  add constraints fk_rights_parent_id
  foreign key (parent_id)
  references rights(right_id); 
  

create table ref_roles_rights          --角色和权限关联表（ref_roles_rights）
(
       ref_role_id number(10) not null,--角色ID，外键，非空
       ref_right_id number(10) not null--权限ID，外键，非空
)
-- 创建序列
--为员工信息表创建序列seq_employees
create sequence seq_employees
  start with 1
  minvalue 1
  maxvalue 9999999999
  increment by 1
  nocycle
  cache 20
  order;
  --drop sequence seq_employees;

--为角色信息表创建序列seq_roles
create sequence seq_roles
  start with 1
  minvalue 1
  maxvalue 9999999999
  increment by 1
  nocycle
  cache 20
  order;
--drop sequence seq_roles;

--为用户信息表创建序列seq_rights
create sequence seq_rights
  start with 1
  minvalue 1
  maxvalue 9999999999
  increment by 1
  nocycle
  cache 20
  order;


-----------------------------------------------------
-----------------------------------------------------
insert into roles(role_id,role_name,role_desc,status)
values(seq_roles.nextval,'管理员',' ','1');
insert into roles(role_id,role_name,role_desc,status)
values(seq_roles.nextval,'总经理',' ','1');
insert into roles(role_id,role_name,role_desc,status)
values(seq_roles.nextval,'部门经理',' ','1');
insert into roles(role_id,role_name,role_desc,status)
values(seq_roles.nextval,'财务经理',' ','1');
insert into roles(role_id,role_name,role_desc,status)
values(seq_roles.nextval,'员工',' ','1');
commit;
--delete from roles;
select * from roles;



insert into employees(emp_id,emp_name,password,sex,birthday,role_id,status)
values(seq_employees.nextval,'张伟','111111','1',to_date('2012-2-2','yyyy-MM-dd'),'1','1');
insert into employees(emp_id,emp_name,password,sex,birthday,role_id,status)
values(seq_employees.nextval,'李伟','111111','1',to_date('2010-2-2','yyyy-MM-dd'),'2','1');
insert into employees(emp_id,emp_name,password,sex,birthday,role_id,status)
values(seq_employees.nextval,'王伟','111111','1',to_date('2000-2-2','yyyy-MM-dd'),'3','1');
insert into employees(emp_id,emp_name,password,sex,birthday,role_id,status)
values(seq_employees.nextval,'赵伟','111111','1',to_date('1999-2-2','yyyy-MM-dd'),'4','1');
insert into employees(emp_id,emp_name,password,sex,birthday,role_id,status)
values(seq_employees.nextval,'钱伟','111111','1',to_date('2000-12-2','yyyy-MM-dd'),'5','1');
insert into employees(emp_id,emp_name,password,sex,birthday,role_id,status)
values(seq_employees.nextval,'徐伟','111111','1',to_date('2010-12-12','yyyy-MM-dd'),'5','1');


commit;
--delete from employees;

insert into rights(right_id,parent_id,right_name,right_desc,right_url,right_type,status)
values(seq_rights.nextval,null,'报销单管理',null,null,1,1);
insert into rights(right_id,parent_id,right_name,right_desc,right_url,right_type,status)
values(seq_rights.nextval,null,'报销单管理',null,null,1,1);
insert into rights(right_id,parent_id,right_name,right_desc,right_url,right_type,status)
values(seq_rights.nextval,null,'报销单管理',null,null,1,1);
insert into rights(right_id,parent_id,right_name,right_desc,right_url,right_type,status)
values(seq_rights.nextval,null,'报销单管理',null,null,1,1);
insert into rights(right_id,parent_id,right_name,right_desc,right_url,right_type,status)
values(seq_rights.nextval,null,'报销单管理',null,null,1,1);
insert into rights(right_id,parent_id,right_name,right_desc,right_url,right_type,status)
values(seq_rights.nextval,null,'报销单管理',null,null,1,1);
insert into rights(right_id,parent_id,right_name,right_desc,right_url,right_type,status)
values(seq_rights.nextval,null,'报销单管理',null,null,1,1);
insert into rights(right_id,parent_id,right_name,right_desc,right_url,right_type,status)
values(seq_rights.nextval,null,'报销单管理',null,null,1,1);
insert into rights(right_id,parent_id,right_name,right_desc,right_url,right_type,status)
values(seq_rights.nextval,null,'报销单管理',null,null,1,1);
insert into rights(right_id,parent_id,right_name,right_desc,right_url,right_type,status)
values(seq_rights.nextval,null,'报销单管理',null,null,1,1);
insert into rights(right_id,parent_id,right_name,right_desc,right_url,right_type,status)
values(seq_rights.nextval,null,'报销单管理',null,null,1,1);
insert into rights(right_id,parent_id,right_name,right_desc,right_url,right_type,status)
values(seq_rights.nextval,null,'报销单管理',null,null,1,1);
insert into rights(right_id,parent_id,right_name,right_desc,right_url,right_type,status)
values(seq_rights.nextval,null,'报销单管理',null,null,1,1);

select * from rights;
select * from employees;
select * from roles;
