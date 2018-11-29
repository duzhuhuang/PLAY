package test;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import dao.*;
import entiy.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
@RunWith(SpringJUnit4ClassRunner.class) //使用junit4进行测试

@ContextConfiguration(locations={"classpath:spring-context.xml"}) //加载配置文件
public class DAOTEST {
	
	
	class a{
		int val;
		public a(int v) {
			val=v;
		}
		public void setval(int v) {
			val=v;
		}
		public int getVal() {
			return val;
		}
	}
	@Autowired
	SQLDao dao;
	@Autowired
	ddao d;

	@Test
	public void teset() {
		//System.out.println(d.getdesigns2());
		
		System.out.println(dao.toushuList().get(0));
		
	}
	public void test() {
	List<company> list=  dao.companyList(3);
	for( company p: list){
		System.out.println(p.getId());
	}
		//System.out.println(dao.companyList().get(1).getId());
		
	}
	
	
	
	
	
}
