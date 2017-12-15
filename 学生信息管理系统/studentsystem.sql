
create tablespace studentsystem
datafile 'C:\jsp\studentsystem.dbf'
size 100m
autoextend on next 10m
maxsize unlimited
logging
extent management local;

/*
2.�����û�
������
�����û�root������Ϊ123456��
Ҫ��
�û�Ĭ�ϱ�ռ�Ϊtablespace_bank��������û�connect��resource��ɫ������Ŀ���������ݿ��������bankģʽ��
*/
create user root identified by 123456
default tablespace studentsystem
temporary tablespace temp;

grant connect,resource to root;
--grant update,delete,insert,select on  all_all_tables to root;

------------------------------------------------------------------
/****************************************************************/
------------------------------------------------------------------
create table students                        --ѧ����Ϣ��
(
      sid  number(10)  not null��            ---ѧԱ���
      name nvarchar2(50) not null��          ---����
      sex nvarchar2(4) not null��            ----�Ա�
      age number(10)��                       ----����
      grade nvarchar2(20)��                  ----�꼶
      major nvarchar2(50)��                  -----רҵ
      address nvarchar2(250)��               -----��ַ
      primary key (sid)                      ---���������
); 

  


--Ϊѧ����Ϣ��������
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
values(seq_students.nextval,'����','��','19','����','�����','����');
insert into students(sid,name,sex,age,grade,major,address)
values(seq_students.nextval,'����','Ů','16','����','�������','�Ϻ�');
insert into students(sid,name,sex,age,grade,major,address)
values(seq_students.nextval,'����','Ů','19','����','��ѧ','����');
commit;
--delete from students;


create table employee                      --����Ա��Ϣ��
(
      emp_id number(10) not null,          --����Ա���
      emp_name nvarchar2(50) not null,         --����
      password nvarchar2(50) not null,     --����
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

