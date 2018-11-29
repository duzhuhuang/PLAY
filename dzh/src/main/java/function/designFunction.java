package function;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.SQLDao;
import dao.ddao;
import dao.userDao;
import entiy.design;
import entiy.order;
import entiy.picture;
import entiy.wanna;
@Service("designFunction")
public class designFunction {
@Autowired
SQLDao dDao;
@Autowired
ddao ddao2;
@Transactional
public int addDesign(design d) {
	dDao.saveDesign(d);
	
	//for(picture p : d.getPictures()) {
	//picture p= d.getPictures().get(0);
	d=dDao.newDesign();
	//dDao.savePicture(p);
	//dDao.DP(d.getId(),p.getId());
	//}
	return d.getId();
	
}
@Transactional
public void addpicture(int did,picture p) {
	p.setDid(did);
	dDao.savePicture(p);
	
	
}
/**
 * 
 * @param id	design归属的公司的id
 * @param page	当前页面
 * @return		design集合
 */
public List<design> queryDesign(int id,int page){
	List<design> list=dDao.getDesignList(id, 10, (page-1)*10);
	for(design ds: list) {
		ds.setPictures(dDao.findPicture(ds.getId()));	
	}
	
	return list;
	
}
public List<picture> querypicture(int did) {
	
	
	return dDao.findPicture(did);
	
	
}
/**
 * 
 * @param page	当前页数
 * @return		数据库中所有design的分页
 */
public List<design>AllDesign(int page){
	List<design> list=dDao.getdesignList(6, (page-1)*6);
	for(design ds: list) {
		ds.setPictures(dDao.findPicture(ds.getId()));	
	}
	return list;
}
public int countDesign() {
	
	return dDao.count();
	
}
public void updateDesign(design d) {
	dDao.modifyDesign(d);
}
@Transactional
public void acDesign(order o,int id) {
//	if(dDao.acdesign(id)!=0)
//	{
//	dDao.acDesign(id, cid);
	dDao.acwanna(id);
	dDao.addOrder(o);
//	order o=new order();
//	design d=dDao.finddesign(id);
//	o.setCid(cid);
//	o.setPid((dDao.findwanna(id)).getPid());
//	o.setCost(d.getCost());
//	o.setAction(1);
//	dDao.addOrder(o);
//	}
	
}
/**
 * 
 * @param id	design主键
 * @return		返回对应主键d的design
 */
public design GetDesign(int id) {
	return dDao.getDesign(id);
	
}
public List<design> topdesign(int id){
	design d=dDao.pfindwanna(id);
	List<design> r=ddao2.getdesigns(d);
	if(r.size()<3) {
		List<design> r2 =ddao2.getdesigns2();
		r.addAll(r2);
	}
	return r;
}
public List<design> designInspect(){
	return ddao2.getdesigns3();
}

public void delete(int id) {
	dDao.delete(id);
}
public void allow(int id) {
	dDao.allow(id);
}
public void del(int id) {
	dDao.deletedesign(id);
}
}
