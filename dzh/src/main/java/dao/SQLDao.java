package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import entiy.company;
import entiy.design;
import entiy.message;
import entiy.order;
import entiy.person;
import entiy.picture;
import entiy.wanna;

public interface SQLDao {
@Select("select * from company where name=#{0} ")
company selectcompany(String name);

/**
  param:p偏移量
  */
@Select("select * from company limit 10 offset #{p}")
List<company> companyList(int p);

@Insert("insert into company(name,password,local) values(#{name},#{password},#{local})")
public void add(company p);

@Select("select count(*) from company where name=#{0} ")
int checkName(String name);

@Update("upate  company set name=#{name}, phone=#{phone}, logoPath=#{logoPath} ,local=#{local} where id=#{id}")
public void update(company p);

@Update("update  company set password=#{0} where id=#{1}")
public void modifyPWD();
@Insert("insert into design(name,style,cid,area,cost,word) values (#{name},#{style},#{cid},#{area},#{cost},#{word})")
public void saveDesign(design d);
@Select("select * from design order by id desc limit 1")
public design newDesign();
@Insert("insert into picture(what,path,did) values (#{what},#{path},#{did})")
public void savePicture(picture p);
@Select("select * from picture order by id desc limit 1")
public picture newpicture();

/**
 * @param did	设计方案id
 * @param pid	图片id
 */

/**
 * @param page	页面显示数量
 * @param offset	偏移量
 * @return	分页查询的designList
 */
@Update("update  person set sex=#{sex},phone=#{phone},password=#{password} where name=#{name}")
public void personUpdate(person p);
@Select("select * from design limit #{0} offset #{1}")
public List<design> getdesignList(int page,int offset);
@Select("select count(*) from design")
public int count();
/**
 * 
 * @param cid	装修公司id
 * @param page
 * @param offset
 * @return
 */
@Select("select * from design where cid=#{0} limit #{1} offset #{2}")
public List<design> getDesignList(int cid,int page,int offset);
/**
 * 
 * @param id	design.id
 * @return		design
 */
@Select("select * from design where id= #{0}")
public design getDesign(int id);


@Update("update  design set name=#{name},style=#{style},cost=#{cost},area=#{area},cid=#{cid},word=#{word} where id=#{id}")
public void modifyDesign(design d);

@Select("select picture.id,picture.path,picture.what from picture where picture.did=#{0}")
public List<picture> findPicture(int did);
@Select("select did from designrank order by rank desc limit 3")
public List<Integer> designTop();

@Insert("insert into order(id,pid,cid,date,cost,action) values(#{id},#{pid},#{cid},#{date},#{cost},#{action})")
public void addOrder(order o) ;
@Select("select * from order where cid =#{0} ")
public void selectBycid(int cid);
@Select("select * from order where pid =#{0} ")
public void selectBypid(int pid);


@Select("select * from person where name=#{0}")
public person selectPersonByName(String name);



public ArrayList<person> PersonList();
public void regist(person p);
@Select("select count(*) from person where name=#{0}")
public int check(String n);

public void update(person p);
@Insert("insert into wanna (did,pid,address,area,activy) values(#{did},#{pid},#{address},#{area},#{activy})")
public void NewWanna(wanna a);
/**
 * 
 * @param id	design的字段：id
 * @return		company
 */
@Select("select * from company,design where design.id=#{0} && company.id=design.cid")
public company  findCompByDesign(int id) ;

@Insert("INSERT INTO WANNA #{0}")
public void testsqle(int i);
	
	


@Insert("insert into message (source,sendto,information) values(#{source},#{sendto},#{information})")
public void NewMessage(message m);
}