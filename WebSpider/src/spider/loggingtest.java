package spider;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.logging.log4j.LogManager;

import dao.daoImpl;

public class loggingtest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//String url=new daoImpl().getNextURL();
		
			String url="https://baike.baidu.com/item/%E5%8D%9A%E4%B8%BD%E7%81%B5%E6%A2%A6";
		String html=new HttpClient().httpvisit(url);
		HTMLanaly.HtmlIndex(html,url);
		new HTMLanaly().keepNewURL(html);
		
		
	}

}
