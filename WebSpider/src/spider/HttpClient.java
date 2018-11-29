package spider;

import java.net.*;
import java.nio.charset.Charset;

import org.apache.logging.log4j.LogManager;

import java.io.*;

public class HttpClient {
	static public String httpvisit(String url) {
		StringBuffer rs=new StringBuffer();
	    try {
	    HttpURLConnection httpclient=(HttpURLConnection) (new URL(url).openConnection());
	    httpclient.connect();
	    BufferedReader reader = new BufferedReader(new InputStreamReader(httpclient.getInputStream(),"UTF-8"));
	    //char [] cbuf=new char [1024];
	    
	    String line=reader.readLine();
        while(line!=null)
        {
            rs=rs.append(line);
            line=reader.readLine();
        }
	    reader.close();
	    httpclient.disconnect();
	    
	    }
	    catch(Exception e){
	    	LogManager.getLogger().error(e.getMessage());
	    }
	    return rs.toString();
	}
	public String httpsVisit() {
		String rs="";
		return rs;
		
	}
}
