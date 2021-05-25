import com.zw.bean.Enterprise;
import com.zw.dao.EnterpriseMapper;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring.xml"})
public class Test {
    @Resource
    EnterpriseMapper enterpriseMapper;


    @org.junit.Test
    public void testCrud1(){
        List<Enterprise> list= enterpriseMapper.selectByExample("美国纽约","国家银行",5);
        for (Enterprise e:list) {
            System.out.println(e.toString());
        }
//        --     where
//                --       address = #{address,jdbcType=VARCHAR}
//        --       AND name = #{name,jdbcType=VARCHAR}
//        --       AND number = #{number,jdbcType=INTEGER}
    }
}
