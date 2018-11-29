package function;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.SQLDao;
import entiy.Page;
import entiy.design;
import entiy.message;
import entiy.order;
import entiy.person;
import entiy.wanna;

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
@Transactional
public void addwannaANDdesign(wanna w,design d) {
	dao.saveDesign(d);
	w.setDid(d.getId());
	
	dao.NewWanna(w);
}
	
public person update(person p) {
	dao.personUpdate(p);
	return p;
	
}
@Transactional
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
	
	try {
	dao.NewWanna(a);
	
	//dao.a.getDid()
	message  m=new message();
	m.setSource(a.getPid());
	m.setSendto(dao.findCompByDesign(a.getDid()).getId());
	m.setInformation("新订单");
	m.setType("2b");
	dao.NewMessage(m);
	}
	catch (Exception e) {
		throw new RuntimeException();
	}
	}
public List<message> getMessage(int targetId){
	return dao.getMessageList(targetId);
} 
	public void setread(int targetid) {
		dao.PsetRead(targetid);
	}
public List<message> getMessageList(int targetId){
	
	return dao.getallmessage(targetId);
}
public design findwanna(int id) {
	
	return dao.pfindwanna(id);
}
public List<order> orderlist(int p1){
	return dao.orderlist2person(p1);
}
public void orderisOK(int id) {
	dao.orderisok(id);
}
public void toushu(message m) {
	dao.toushu(m);
}

public void tip(int id) {
	message m=new message();
	m.setInformation("订单已提交，我们的工作人员会主动与您联系");
	m.setSendto(id);
	m.setSource(0);
	m.setType("2c");
	dao.NewMessage(m);
}

}
