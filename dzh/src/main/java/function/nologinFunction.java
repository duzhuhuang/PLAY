package function;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.SQLDao;

import entiy.company;
import entiy.design;
import entiy.message;
import entiy.order;
import entiy.toushu;
import entiy.user;

@Service
public class nologinFunction {
@Autowired
SQLDao dao;
public String[] getdisplay() {
	
	ArrayList<design> list=	(ArrayList<design>) dao.getdesignList(5,0);
	String[] json={"{","{","{","{","{"};
	
	 return json;
}
String addjson(Object obj,Object val) {
	
	String json = "\""+obj.toString()+"\":\""+val.toString()+"\"";
	 return json;
}
public void addmessage(message m) {
	dao.NewMessage(m);
}	

public user mlogin(String p) {
	return dao.mlogin(p);
}
public List<order> dymord(int pid,Timestamp date1,Timestamp date2,double cost1,double cost2,String keyword) {
	return dao.dymorder(pid,date1, date2, cost1, cost2, keyword);
}
public List<toushu> querytoushu(){
	return dao.toushuList();
}
@Transactional
public void toushuchuli(int id1,int id2) {
	message m1=new message();
	m1.setSendto(id1);
	m1.setInformation("投诉已处理");
	m1.setType("2c");
	m1.setSource(0);
	message m2=new message();
	m2.setInformation("接到投诉，系统已经记录，请遵守规则");
	m2.setSendto(id2);
	m2.setType("2b");
	m2.setSource(0);
	dao.NewMessage(m1);
	dao.NewMessage(m2);
	dao.chulitoushu(id1, id2);
	
}
public List<toushu> toushujiancha(int p1,int p2)
{
	return
dao.toushucheck(p1, p2);}
public double toushulv(int id)
{
double rs=((double)dao.counttoushu(id))/dao.countorder(id);
return rs;
}
public List<String> logread(int page) {
	FileReader reader;
	ArrayList<String> rs=new ArrayList<String>();
	try {
		reader = new FileReader(new File("d:/logs/log4jinfo.log"));
	
	BufferedReader bfr=new BufferedReader(reader);
	
	while(0<--page)
	{
		for(int i=0;i<15;i++)
		bfr.readLine();
	}
	
	for(int i=0;i<15&&bfr.ready();i++)
		rs.add(bfr.readLine());
	bfr.close();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
return rs;
}
public List<company>m0(){
	return dao.companyallList();
}
public company m0_1(int id) {
	return dao.findc_id(id);
}
public List<entiy.worker> m0_2(int id){
	return dao.workers(id);
}

}
