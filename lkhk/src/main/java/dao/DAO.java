package dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface DAO {
/*@Select("select k from map where v like \"%\"#{keyword}\"%\" group by k")
public List<String> match(String word);*/
@Select("(select url,title from prior where  title like \"%\"#{keyword}\"%\" group by url) union(select url,title from prior where  url like \"%\"#{keyword}\"%\" group by url)")
public List<entiy> prior(String keyword);
@Select("SELECT url,title,v text from (select  url,title from prior)a  JOIN (select k,left(v,  100) v from map where v like \"%\"#{keyword}\"%\" group by k)b on a.url= b.k")
public List<entiy> match(String word);
@Select("select title from prior where url =#{0} limit 1")
public String title(String url);
}
