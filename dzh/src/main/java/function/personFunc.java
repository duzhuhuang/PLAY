package function;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.SQLDao;
import entiy.design;
import entiy.message;
import entiy.person;
import entiy.wanna;
@Transactional
@Service
public class personFunc {
@Autowired
SQLDao dao;
/**
 * 
 * @param name	person.name
 * @return	数据库中name对应的person
 */
public person login(String name) {
	return dao.selectPersonByName(name);
}

public person update(person p) {
	dao.personUpdate(p);
	return p;
	
}
public void add(person p){
	dao.regist(p);
}
public int check(String name) {
	
	return dao.check(name);
}
public design topdesign() {
	return null;
}
@Transactional(rollbackFor=Exception.class)
public void newwanna(wanna a) throws Exception{
	
		// TODO: handle exception
	try {
	dao.NewWanna(a);
	
	//dao.a.getDid()
	message  m=new message();
	m.setSource(a.getPid());
	m.setSendto(dao.findCompByDesign(a.getDid()).getId());
	m.setInformation("新订单");
	m.setType("toCompany");
	dao.NewMessage(m);
	}
	catch (Exception e) {
		throw new RuntimeException();
	}
	}
	
	


}
