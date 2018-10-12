package dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import entiy.order;

public interface odao {
@Insert("insert into order(id,pid,cid,date,cost,action) values(#{id},#{pid},#{cid},#{date},#{cost},#{action})")
public void addOrder(order o) ;
@Select("select * from order where cid =#{0} ")
public void selectBycid(int cid);
@Select("select * from order where pid =#{0} ")
public void selectBypid(int pid);
}
