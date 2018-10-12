package function;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.SQLDao;
import dao.ddao;
import dao.userDao;
import entiy.design;
import entiy.picture;
@Service("designFunction")
public class designFunction {
@Autowired
SQLDao dDao;
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
/**
 * 
 * @param id	design主键
 * @return		返回对应主键d的design
 */
public design GetDesign(int id) {
	return dDao.getDesign(id);
	
}
public List<Integer> topdesign(){
	return dDao.designTop();
}


}
