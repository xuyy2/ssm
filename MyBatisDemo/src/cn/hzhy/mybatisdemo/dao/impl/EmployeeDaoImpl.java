package cn.hzhy.mybatisdemo.dao.impl;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import cn.hzhy.mybatisdemo.dao.EmployeeDao;
import cn.hzhy.mybatisdemo.entity.Employee;

public class EmployeeDaoImpl implements EmployeeDao {

	public int countAll() {
		int result=0;
		SqlSession session=null;
		
		try {
			//解释配置文件
			Reader reader=Resources.getResourceAsReader("mybatis-config.xml");
			//创建SqlSessionFactoryBuilder对象
			SqlSessionFactoryBuilder builder=new SqlSessionFactoryBuilder();
			//创建SqlSessionFactory对象
			SqlSessionFactory factory=builder.build(reader);
			//创建SqlSession对象
			session=factory.openSession();
			//执行SQL语句，返回结果
			result=session.selectOne("cn.hzhy.mybatisdemo.dao.EmployeeDao.countAll");
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			//关闭SqlSession
			if(session!=null){
				session.close();
			}
		}		
		return result;
	}
	
	public Employee getById(int empId) {
		return null;
	}


}
