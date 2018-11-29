package dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import entiy.company;
import entiy.message;
import entiy.person;
import entiy.wanna;

public interface personDao {
public person selectPerson(int id);

@Select("select * from person where name=#{0}")
public person selectPersonByName(String name);



public ArrayList<person> PersonList();
public void regist(person p);
@Select("select count(*) from person where name=#{0}")
public int check(String n);

public void update(person p);
@Insert("insert into wanna (cid,pid,address,area) values(#{cid},#{pid}),#{address},#{area}")
public void NewWanna(wanna a);
/**
 * 
 * @param id	designµÄ×Ö¶Î£ºid
 * @return		company
 */
@Select("select * from company,design where design.did=#{0} && company.id=design.cid")
public company  findCompByDesign(int id) ;


	
	


@Insert("insert into wanna (source,sendto,information) values(#{source},#{sendto}),#{information}")
public void NewMessage(message m);
}
