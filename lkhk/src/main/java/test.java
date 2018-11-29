import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import dao.DAO;
import dao.entiy;

@RunWith(SpringJUnit4ClassRunner.class) //使用junit4进行测试
@ContextConfiguration(locations={"classpath:spring-context.xml"}) //加载配置文件
public class test {
@Autowired
DAO D;
@Test
public void test1() {
	List<entiy>rs=null;
	
	rs= D.prior("新浪");
	rs.addAll(D.match("新浪"));
	
	for(entiy e:rs)
	{
		System.out.println(e.getTitle());
		System.out.println(e.getURL());
		System.out.println(e.getText());
	}
	
	}
}
