package function;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.SQLDao;
import dao.slDao;
import entiy.design;

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
}
