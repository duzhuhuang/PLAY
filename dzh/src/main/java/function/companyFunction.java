package function;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.SQLDao;
import dao.userDao;
import entiy.company;
import entiy.design;
import entiy.message;
import entiy.order;
import entiy.wanna;

@Service
public class companyFunction {
@Autowired
SQLDao dao;

public company login(String name) {
	
	return dao.selectcompany(name);
}

public int check(String name) {
	return dao.checkName(name);
	
}
@Transactional
public void addcompany(company p) {
	dao.add(p);
}
@Transactional
public void updateComp(company p) {
	dao.update(p);
}
public List<design> designList2C(int id,int page,int pagesize){
	
	return dao.getDesignList(id, pagesize, (page-1)*pagesize);
}
public List<message> getmessage(int id){
	
	return dao.getMessageList2comp(id);
}
public void read(int id)
{
	dao.CsetRead(id);
	}
public List<message> getallMessage(int id)
{
	return dao.getallmessage2comp(id);
}
public List<wanna> allwanna(int p,int id){
	return dao.listwanna(12, 12*(p-1),id);
}
public HashMap<Integer,design> map(List<wanna> list){
	HashMap<Integer,design> rs=new HashMap<Integer,design>();
	for(wanna a:list) {
		
		rs.put(a.getDid(), dao.sfdw(a.getDid()));
	}
	return rs;
}
public int count() {
	return dao.countALL();
}
public List<order> orderlist(int cid){
	return dao.orderlist2c(cid);
}
public List<entiy.worker> worker(int id){
	return dao.workers(id);
}
public void newworker(entiy.worker w) {
	dao.vaddworker(w);
}
public void delworker(int id) {
	dao.delworker(id);
}
public List<wanna> wannas(int id){
	return dao.cfindwanna(id);
}
}
