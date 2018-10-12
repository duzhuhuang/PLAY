package dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import entiy.design;

public interface slDao {
	/**
	 * @param page	页面显示数量
	 * @param offset	偏移量
	 * @return	分页查询的designList
	 */
	@Select("select * from design  limit #{0} offset #{1}")
	public List<design> getdesignList(int page,int offset);
}
