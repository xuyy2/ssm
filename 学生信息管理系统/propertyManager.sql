
create tablespace mytablespace
datafile 'C:\jsp\hzhy.dbf'
size 100m
autoextend on next 10m
maxsize unlimited
logging
extent management local;

/*
2.�����û�
������
�����û�hzhy������Ϊhzhy��
Ҫ��
�û�Ĭ�ϱ�ռ�Ϊtablespace_bank��������û�connect��resource��ɫ������Ŀ���������ݿ��������bankģʽ��
*/
create user hzhy identified by hzhy
default tablespace mytablespace
temporary tablespace temp;

grant connect,resource to hzhy;
--grant update,delete,insert,select on  all_all_tables to bank;

------------------------------------------------------------------
/****************************************************************/
------------------------------------------------------------------
create table employees                  --Ա����Ϣ��
(
       emp_id number(10) not null,      --Ա��ID���������������Զ�����
       emp_name nvarchar2(50) not null, --Ա���������ǿ�
       password nvarchar2(20) not null, --���룬�ǿ�
       sex number(10) not null,         --�Ա�number���ͣ�1���У�0��Ů
       birthday date not null,          --����ʱ�䣬�ǿ�
       role_id number(10),              --��ɫID�����           
       status number(10) not null       --״̬��number���ͣ�1��������0������
); 
--��������
  alter table employees
    add constraints pk_emp_id
    primary key(emp_id);
--�������
alter table employees
  add constraints fk_employees_roles
  foreign key (role_id)
  references roles(role_id);    

create table roles                        --��ɫ��Ϣ��
(
       role_id number(10) not null,       --��ɫID���������������Զ�����
       role_name nvarchar2(10) not null,  --��ɫ���ƣ��ǿ�
       role_desc nvarchar2(250) not null, --��ɫ˵�����ǿ�
       status number(10) not null         --״̬���ǿ�
)
--��������
alter table roles
  add constraints pk_role_id
  primary key(role_id);
    
create table rights                       --Ȩ����Ϣ��rights��
(
       right_id	number(10) not null,      --Ȩ��ID���������������Զ�����
       parent_id number(10),               --��Ȩ�ޱ�ţ����������������������е�ֵ
       right_name nvarchar2(50) not null, --Ȩ�����ƣ��ǿ�
       right_desc nvarchar2(250),         --Ȩ��˵��
       right_url nvarchar2(250),          --Ȩ��URL
       right_type number(10) not null,    --Ȩ�����ͣ�number�������ͣ��ǿգ�1-�˵���2-��ť
       status number(10) not null         --״̬��number��������
)


--��������
  alter table rights
    add constraints pk_right_id
    primary key(right_id);
--�������
alter table rights
  add constraints fk_rights_parent_id
  foreign key (parent_id)
  references rights(right_id); 
  

create table ref_roles_rights          --��ɫ��Ȩ�޹�����ref_roles_rights��
(
       ref_role_id number(10) not null,--��ɫID��������ǿ�
       ref_right_id number(10) not null--Ȩ��ID��������ǿ�
)
-- ��������
--ΪԱ����Ϣ��������seq_employees
create sequence seq_employees
  start with 1
  minvalue 1
  maxvalue 9999999999
  increment by 1
  nocycle
  cache 20
  order;
  --drop sequence seq_employees;

--Ϊ��ɫ��Ϣ��������seq_roles
create sequence seq_roles
  start with 1
  minvalue 1
  maxvalue 9999999999
  increment by 1
  nocycle
  cache 20
  order;
--drop sequence seq_roles;

--Ϊ�û���Ϣ��������seq_rights
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
values(seq_roles.nextval,'����Ա',' ','1');
insert into roles(role_id,role_name,role_desc,status)
values(seq_roles.nextval,'�ܾ���',' ','1');
insert into roles(role_id,role_name,role_desc,status)
values(seq_roles.nextval,'���ž���',' ','1');
insert into roles(role_id,role_name,role_desc,status)
values(seq_roles.nextval,'������',' ','1');
insert into roles(role_id,role_name,role_desc,status)
values(seq_roles.nextval,'Ա��',' ','1');
commit;
--delete from roles;
select * from roles;



insert into employees(emp_id,emp_name,password,sex,birthday,role_id,status)
values(seq_employees.nextval,'��ΰ','111111','1',to_date('2012-2-2','yyyy-MM-dd'),'1','1');
insert into employees(emp_id,emp_name,password,sex,birthday,role_id,status)
values(seq_employees.nextval,'��ΰ','111111','1',to_date('2010-2-2','yyyy-MM-dd'),'2','1');
insert into employees(emp_id,emp_name,password,sex,birthday,role_id,status)
values(seq_employees.nextval,'��ΰ','111111','1',to_date('2000-2-2','yyyy-MM-dd'),'3','1');
insert into employees(emp_id,emp_name,password,sex,birthday,role_id,status)
values(seq_employees.nextval,'��ΰ','111111','1',to_date('1999-2-2','yyyy-MM-dd'),'4','1');
insert into employees(emp_id,emp_name,password,sex,birthday,role_id,status)
values(seq_employees.nextval,'Ǯΰ','111111','1',to_date('2000-12-2','yyyy-MM-dd'),'5','1');
insert into employees(emp_id,emp_name,password,sex,birthday,role_id,status)
values(seq_employees.nextval,'��ΰ','111111','1',to_date('2010-12-12','yyyy-MM-dd'),'5','1');


commit;
--delete from employees;

insert into rights(right_id,parent_id,right_name,right_desc,right_url,right_type,status)
values(seq_rights.nextval,null,'����������',null,null,1,1);
insert into rights(right_id,parent_id,right_name,right_desc,right_url,right_type,status)
values(seq_rights.nextval,null,'����������',null,null,1,1);
insert into rights(right_id,parent_id,right_name,right_desc,right_url,right_type,status)
values(seq_rights.nextval,null,'����������',null,null,1,1);
insert into rights(right_id,parent_id,right_name,right_desc,right_url,right_type,status)
values(seq_rights.nextval,null,'����������',null,null,1,1);
insert into rights(right_id,parent_id,right_name,right_desc,right_url,right_type,status)
values(seq_rights.nextval,null,'����������',null,null,1,1);
insert into rights(right_id,parent_id,right_name,right_desc,right_url,right_type,status)
values(seq_rights.nextval,null,'����������',null,null,1,1);
insert into rights(right_id,parent_id,right_name,right_desc,right_url,right_type,status)
values(seq_rights.nextval,null,'����������',null,null,1,1);
insert into rights(right_id,parent_id,right_name,right_desc,right_url,right_type,status)
values(seq_rights.nextval,null,'����������',null,null,1,1);
insert into rights(right_id,parent_id,right_name,right_desc,right_url,right_type,status)
values(seq_rights.nextval,null,'����������',null,null,1,1);
insert into rights(right_id,parent_id,right_name,right_desc,right_url,right_type,status)
values(seq_rights.nextval,null,'����������',null,null,1,1);
insert into rights(right_id,parent_id,right_name,right_desc,right_url,right_type,status)
values(seq_rights.nextval,null,'����������',null,null,1,1);
insert into rights(right_id,parent_id,right_name,right_desc,right_url,right_type,status)
values(seq_rights.nextval,null,'����������',null,null,1,1);
insert into rights(right_id,parent_id,right_name,right_desc,right_url,right_type,status)
values(seq_rights.nextval,null,'����������',null,null,1,1);

select * from rights;
select * from employees;
select * from roles;
