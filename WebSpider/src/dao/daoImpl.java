package dao;

import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.apache.logging.log4j.LogManager;

public class daoImpl {
	spiderdaoutil u=new spiderdaoutil();
	public void  saveURL(Set<String> URL) {
		Connection conn=null;
		PreparedStatement pstm =null;
		ResultSet rs=null;
		StringBuffer sql=new StringBuffer("insert into spider(URL) values");
		
		try {
			if(URL.size()==0)
				throw new Exception("null set");
		conn=u.getconn();
		for(String s:URL) {
			sql.append("(?),");
		}
		pstm=conn.prepareStatement(sql.toString().substring(0, sql.length()-1));
		int i=1;
		for(String s:URL) {
			pstm.setString(i++, s);
		}
		if(pstm.executeUpdate()<1)
		throw new Exception("新增URL失败");
		}
		catch (Exception e) {
			LogManager.getLogger().error("saveURL"+e.getMessage());
		}
		finally {
			u.close(conn, pstm, rs);
		}
	}
	/*public int save(List<Object> list) {
		Connection conn=null;
		PreparedStatement pstm =null;
		ResultSet rs=null;
		StringBuffer sql=new StringBuffer("insert into ");
		try {
			if(list.size()>0) {
				Class table=list.get(0).getClass();
				List<Method> col=new ArrayList<Method>();
				sql.append(table.getName()+"(");
			for(Method e:table.getMethods())
			{
				if(e.getName().indexOf("get")==0) {
					sql.append(e.getName().substring(2)+",");
					col.add(e);
				}
			}
			sql=sql.replace(sql.length(), sql.length(), ") values");
			for(Object e:list)
			{
				sql.append("(");
				for(int i=0;i<col.size();i++)
				{
					if(i>0)
						sql.append(",");
					col.get(i).invoke(e);
				}
				sql.append("),");
			}
			}
			if(pstm.executeUpdate()<1)
				throw new Exception("新增失败");
			
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		finally {
			u.close(conn, pstm, rs);
		}
		return -1;
	}*/
	public String getNextURL() {
		Connection conn=null;
		PreparedStatement pstm =null;
		ResultSet rs=null;
		try {
		conn=u.getconn();
		pstm=conn.prepareStatement("select URL,id from spider where value=0 order by id limit 1");
		rs=(ResultSet)pstm.executeQuery();
		if(rs.next()) {
		int id=rs.getInt("id");
		String URL= rs.getString("URL");
		pstm.close();
		pstm=conn.prepareStatement("update spider set value=1 where id=?");
		pstm.setInt(1, id);
		pstm.execute();
		return URL;}
		else return null;
		}
		catch (Exception e) {
			LogManager.getLogger().error("getNextURL"+e.getMessage());
		}
		finally {
			u.close(conn, pstm, rs);
		}
		return "";
	}
	public int  createIndex(List<String> html,String key) {
		
		Connection conn=null;
		PreparedStatement pstm =null;
		ResultSet rs=null;
		StringBuffer sql=new StringBuffer("insert into map(k,v) values");
		
		try {
			if(html.size()==0)
				throw new Exception("null list");
			conn=u.getconn();
			for(String s:html) {
				sql.append("('");
				sql.append(key);
				sql.append("','");
				sql.append(s);
				sql.append("'),");
			}
			
		pstm=conn.prepareStatement(sql.toString().substring(0, sql.length()-1));
		int c=pstm.executeUpdate();
		if(c<1)
		throw new Exception("新增失败");
		return c;
		}
		catch (Exception e) {
			LogManager.getLogger().error("createIndex"+e.getMessage());
		}
		finally {
			u.close(conn, pstm, rs);
		}
		return 0;
	}
public int  title(String URL,String t) {
		
		Connection conn=null;
		PreparedStatement pstm =null;
		ResultSet rs=null;
		String sql="insert into prior(URL,title) values(?,?)";
		
		try {
			conn=u.getconn();
		pstm=conn.prepareStatement(sql);
		pstm.setString(1, URL);
		pstm.setString(2, t);
		int c=pstm.executeUpdate();
		
		if(c<1)
		throw new Exception("新增失败");
		return c;
		}
		catch (Exception e) {
			LogManager.getLogger().error("title"+e.getMessage());
		}
		finally {
			u.close(conn, pstm, rs);
		}
		return 0;
	}
}
