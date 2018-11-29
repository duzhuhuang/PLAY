package spider;


import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.Stack;
import java.util.TreeSet;
import java.util.regex.*;




import org.apache.logging.log4j.LogManager;

import dao.daoImpl;
public class HTMLanaly {
	public String keepNewURL(String HTML) {
		try {
		HTML=HTML.toLowerCase();
		Pattern reg= Pattern.compile("href=\\S*?\\.\\S*?\\.\\S*?( |>)");
		Matcher m= reg.matcher(HTML);
		daoImpl save=new daoImpl();
		Set<String> a=new TreeSet<String>();
		while(m.find())
		{
			String URL=m.group();
			URL=URL.substring(5,URL.length()-1);
			URL=URL.replace("\"", "");
			
			if(URL.length()<255)
			a.add(URL);
		}
		save.saveURL(a);
		}catch (Exception e) {
			LogManager.getLogger().error(e.getMessage());
			return "fail";
		}
		return "success";
	} 
	static public int HtmlIndex(String html,String key) {
		List<String> rs=new ArrayList<>();
		try {
			html=html.toLowerCase();
			new daoImpl().title(key,title(html));
			Pattern reg= Pattern.compile("<body[\\S\\s]*?</body>");
			Matcher m= reg.matcher(html);
			m.find();
			html=m.group();

			
			rs.addAll(bodyanaly(html));
			if(!rs.isEmpty())
				new daoImpl().createIndex(rs, key);
		}
		catch(Exception e){
			System.out.println(e.getMessage());
		}
		return 0;
	}
	static public String title(String doc) {
		String rs="";
		try {
			
			Pattern reg= Pattern.compile("<title>\\S*?</title>");
			Matcher m= reg.matcher(doc);
			if(m.find())
			{
				 rs=m.group();
				 rs=rs.substring(7,rs.length()-8);
				
			}
			
		}
		catch (Exception e) {
			System.out.println("HTMLanaly.title"+e.getMessage());
		}
		return rs;
	}
	static public List<String> bodyanaly(String doc){
		List<String> rs=new ArrayList<>();
		try {
			Stack<DOC> stack=new Stack<DOC>();
			Pattern reg= Pattern.compile(">[\\s\\S]*?<");
			Matcher m= reg.matcher(doc);
			
			while(m.find())
			{
				String text=m.group();
				text=text.substring(1, text.length()-1);
				text=text.replace("'", "\\'");
				text=text.replace("&nbsp;", " ");
				text=text.trim();
				if(text.length()<2048&&text.length()>1)
				{
					rs.add(text);
				}
				
			}
			
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return rs;
	}
	/*
	static public List<String> bodyanaly(String doc){
		List<String> rs=new ArrayList<>();
		try {
			Stack<DOC> stack=new Stack<DOC>();
			Pattern reg= Pattern.compile("<[\\s\\S]*?[^/]>");
			Matcher m= reg.matcher(doc);
			
			while(m.find())
			{
				int []flag= {0};
				String tag=analyTag(m.group(), flag);
				if(flag[0]==1) {
				stack.push(new DOC(tag,m.start()));
				
				}
				else if(flag[0]==-1)
				{
					while(!stack.peek().text.equals(tag)) {
						stack.pop();
					}
					DOC cur=stack.pop();
					String d=doc.substring(cur.getStart(),m.end());
					if(isLeaf(d))
					{
						d=d.replaceAll("<[\\S\\s]*?>", "");
						d=d.replace("'", "\\'");
						if(!d.equals(""))
						rs.add(d);
					}
					
					
				}
				
			}
			
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return rs;
	}*/
	static public DOC bodyanaly(String doc,String elementName ) {
try {
			
			Pattern reg= Pattern.compile("<body[\\S\\s]*?</body>");
			Matcher m= reg.matcher(doc);
			m.find();
			
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
	}
	static public boolean  isLeaf(String element) {
		try {
			Pattern reg= Pattern.compile("<\\w*?( |>)");
			Matcher m= reg.matcher(element);
			m.find();
			if(m.find())
			return false;
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return true;
	}
	static public String analyTag(String tag,int[] flag) {
		try {
			if(tag.substring(0, 2).equals("</"))
			{
				Pattern reg= Pattern.compile("</\\w*?\\W");
				Matcher m= reg.matcher(tag);
				if(m.find()) {
					flag[0]=-1;
					String t= m.group();
					return t.substring(2, t.length()-1).trim();
					
				}
			}
			if(tag.substring(0, 1).equals("<"))
			{
				Pattern reg= Pattern.compile("<\\w*?\\W");
				Matcher m= reg.matcher(tag);
				if(m.find()) {
					flag[0]=1;
					String t= m.group();
					return t.substring(1, t.length()-1).trim();
				}
			}
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "";
	}
	
}
