package dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import entiy.company;
import entiy.design;
import entiy.message;
import entiy.order;
import entiy.person;
import entiy.picture;
import entiy.user;
import entiy.wanna;

public interface SQLDao {
@Select("select count(*) from wanna")
public int countALL();
	
@Select("select * from company where name=#{0} ")
company selectcompany(String name);

/**
  param:p偏移量
  */
@Select("select * from company limit 10 offset #{p}")
List<company> companyList(int p);
@Select("select * from company ")
List<company> companyallList();

@Select("select * from wanna,design where activy=0 and design.id=did and design.cid = #{2}  order by time desc limit #{0} offset #{1} ")
public List<wanna> listwanna(int pagesize,int offset,int p3);

@Insert("insert into company(name,password,local) values(#{name},#{password},#{local})")
public void add(company p);

@Select("select * from design where id=#{0}")
public design sfdw(int id);

@Select("select count(*) from company where name=#{0} ")
int checkName(String name);

@Update("update  company set name=#{name}, phone=#{phone}, logoPath=#{logoPath} ,local=#{local} where id=#{id}")
public void update(company p);

@Update("update  company set password=#{0} where id=#{1}")
public void modifyPWD();

@Insert("insert into design(name,style,cid,area,cost,word,allow) values (#{name},#{style},#{cid},#{area},#{cost},#{word},-1)")
@Options(useGeneratedKeys=true, keyProperty="id", keyColumn="id") 
public int saveDesign(design d);

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
@Select("select * from design where cid=#{0} order by id desc limit #{1} offset #{2} ")
public List<design> getDesignList(int cid,int param1,int param2);
/**
 * 
 * @param id	design.id
 * @return		design
 */
@Select("select * from design where id= #{0}")
public design getDesign(int id);


@Update("update  design set name=#{name},style=#{style},cost=#{cost},area=#{area},word=#{word} where id=#{id}")
public void modifyDesign(design d);
@Update("update  design set cid=#{1} where id=#{0}")
public void acDesign(int p1,int p2);
@Select("select count(*) from wanna where did=#{0} and activy=0")
public int acdesign(int p1);
@Update("update  wanna set activy=2 where id=#{0} ")
public void acwanna(int p1);

@Select("select picture.id,picture.path,picture.what from picture where picture.did=#{0}")
public List<picture> findPicture(int did);
@Select("select * from design where style=#{style} and area< #{area}+10 and area> = #{area}-10 and cost>= #{cost}-10 and cost< #{cost}+10 limit 3")
public List<design> designTop(design d);
@Select("select * from design  limit 3")
public List<design> designsecond(design d);

@Insert("insert into `order`(pid,cid,cost,action,did) values(#{pid},#{cid},#{cost},#{action},#{did})")
public void addOrder(order o) ;
@Select("select * from order where cid =#{0} ")
public void selectBycid(int cid);
@Select("select * from order where pid =#{0} ")
public void selectBypid(int pid);


@Select("select * from person where name=#{0}")
public person selectPersonByName(String name);



public ArrayList<person> PersonList();
@Insert("insert into person(name,password,phone) values(#{name},#{password},#{phone})")
public void regist(person p);

@Select("select count(*) from person where name=#{0}")
public int check(String n);

public void update(person p);
@Insert("insert into wanna (did,pid,address,area,activy,phone) values(#{did},#{pid},#{address},#{area},#{activy},#{phone})")
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
	
@Update("update message set message.read=1 where sendto=#{0} and type='2c'")
public void PsetRead(int id);
@Update("update message set message.read=1 where sendto=#{0} and type='2b'")
public void CsetRead(int id);

@Insert("insert into message (source,sendto,information,type,message.read) values(#{source},#{sendto},#{information},#{type},#{read})")
public void NewMessage(message m);

@Select("select * from message where sendto=#{0} and `read`= 0 and type= '2c' order by time desc")
public List<message> getMessageList(int targetId);
@Select("select * from message where sendto=#{0} and `read`= 0 and type= '2b' order by time desc")
public List<message> getMessageList2comp(int target);
@Select("select * from message,company where message.source=company.id and sendto=#{0} and type= '2c' order by time desc")
public List<message> getallmessage(int targetId);
@Select("select * from message,person where message.source=person.id and sendto=#{0} and type= '2b' order by time desc")
public List<message> getallmessage2comp(int targetId);

@Insert("insert into picture(id,what,path) values(#{id},#{what},#{path})")
public void addPicture(picture p);
@Delete("delete from picture where id=#{id}")
public void delete(int id);
@Select("select * from wanna,design where wanna.did=design.id and pid= #{0} and activy<1 order by time desc limit 1")
public design pfindwanna(int id);
@Select("select * from wanna,design where wanna.did=design.id  and cid=#{0} activy=1 order by time ")
public List<wanna> cfindwanna(int id);
@Select("select * from wanna where wanna.did =#{0} ")
public wanna findwanna(int id);
@Select("select * from design where id=#{0} ")
public design finddesign(int id);
@Select("select * from `order` where cid =#{0}")
List<order>orderlist2c(int p1);
@Select("select * from `order` where pid =#{0}")
List<order>orderlist2person(int p1);
@Update("update `order` set action=2 where id=#{0}")
public void orderisok(int id);
@Insert("insert into toushu(`from`,info,cid) values(#{source},#{information},#{sendto})")
public void toushu(message m);
@Select("select * from root where name=#{0}")
public user mlogin(String p);
@Update("update design set allow=1 where id=#{0}")
public void allow(int id);
@Delete("DELETE from design where id=#{0}")
public void deletedesign(int id );
@Select("select person.name fromname, company.name tarname,info,time,`from`,cid  from toushu,person,company where statu=0 and person.id=`from` and company.id = cid ")
public List<entiy.toushu> toushuList();
@Select("select person.name fromname, company.name tarname,info,time,`from`,cid  from toushu,person,company where statu=1 and person.id=`from` and company.id = cid and `from`=#{0} and cid=#{1} ")
public List<entiy.toushu> toushucheck(int p1,int p2);
@Update("update toushu set statu=1 where `from`=#{0} and cid=#{1}")
public void chulitoushu(int id1,int id2);
public List<order>dymorder(@Param("pid") int pid,@Param("date1")Timestamp date1,@Param("date2")Timestamp date2,@Param("cost1")double cost1,@Param("cost2")double cost2,@Param("keyword")String keyword);
@Select("select count(*) from `order` where id=#{0}")
public int countorder(int id);
@Select("select count(*) from toushu where cid=#{0}")
public int counttoushu(int id);
public void tongjitoushu();
@Select("select * from worker where cid= #{0}")
public List<entiy.worker> workers(int id);
@Insert("insert into worker(cid,job,name,photo) values(#{cid},#{job},#{name},#{photo})")
public void vaddworker(entiy.worker w);
@Delete("delete from worker where id=#{0}")
public void delworker(int id);
@Select("select * from company where id=#{0}")
public company findc_id(int id);


}