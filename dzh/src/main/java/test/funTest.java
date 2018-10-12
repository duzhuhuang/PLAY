package test;

import java.util.ArrayList;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import dao.slDao;
import entiy.company;
import entiy.design;
import entiy.picture;
import function.*;


@RunWith(SpringJUnit4ClassRunner.class) //使用junit4进行测试
@ContextConfiguration(locations={"classpath:spring-context.xml"}) //加载配置文件
public class funTest {
	@Autowired
	designFunction f;

	@Autowired
	function.companyFunction f3;
	
	@Test
	public void t123() {
		f3.addcompany(new company());
		
	}

	public void test() {
		design d=new design();
		d.setId(21);
		d.setStyle("china");
		picture p=new picture();
		picture p2=new picture();
		p.setWhat("11111");
		p2.setWhat("111");
		ArrayList<picture> list=new ArrayList<picture>();
		list.add(p);
		list.add(p2);
		d.setPictures(list);
		
		f.addDesign(d);
	
}
}
