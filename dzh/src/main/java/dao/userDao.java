package dao;

import org.apache.ibatis.annotations.Param;

import entiy.user;

public interface userDao {
user selectUser(@Param("id")int id);
}
