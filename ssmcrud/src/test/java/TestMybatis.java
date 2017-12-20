import java.util.UUID;
import java.util.logging.Logger;

import com.alibaba.fastjson.JSON;
import com.yiyi.crud.pojo.Department;
import com.yiyi.crud.pojo.Employee;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yiyi.crud.dao.DepartmentDao;
import com.yiyi.crud.dao.EmployeeDao;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring/applicationContext.xml" })
public class TestMybatis {
    private static Logger logger = Logger.getLogger(String.valueOf(TestMybatis.class
    ));
    @Autowired
    private DepartmentDao departmentDao;

    @Autowired
    private EmployeeDao employeeDao;

    @Autowired
    private SqlSession sqlSession;

    @Test
    public void testCRUD() {
        Employee employee = employeeDao.selectByPrimaryKey(1);
        System.out.println(employee.getEmpName()+"\t"+employee.getGender()+"\t"+employee.getDeptId());
        logger.info(JSON.toJSONString(employee));



    }
}
