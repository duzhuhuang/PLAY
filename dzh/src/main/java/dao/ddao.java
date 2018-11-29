package dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import entiy.design;
import entiy.picture;

public interface ddao {
public List<design> getdesigns(design d);
public List<design> getdesigns2();
public List<design> getdesigns3();
public picture s1(int id);
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


}
