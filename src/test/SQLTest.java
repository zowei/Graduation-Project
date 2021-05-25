
import com.zw.bean.Enterprise;
import com.zw.dao.EnterpriseMapper;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;
import java.util.UUID;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring.xml"})
public class SQLTest {

    @Resource
    EnterpriseMapper enterpriseMapper;
    @Autowired
    SqlSession sqlSession;
    //    spring整合之后的单元测试::
    @Test
    public void testCrud1(){

        System.out.println(enterpriseMapper);
        //批量操作
        EnterpriseMapper enterpriseMapper=sqlSession.getMapper(EnterpriseMapper.class);
        //循环插入一千条数据
        for(int i=0;i<10;i++){
           String uuid=UUID .randomUUID().toString().substring(0,5)+i;
            enterpriseMapper.insert(new Enterprise(null,"邹威","1999-10-15","其他地区",4));
      }
    }
}
