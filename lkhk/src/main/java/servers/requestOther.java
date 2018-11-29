package servers;
import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.*;

import org.springframework.stereotype.Service;

@Service
public class requestOther {
public String getOtherData() {
	String rs="";
	try {
	String url="http://dj.reconova.cn/oauthAction!refreshToken.action?";
	String param="clientId=0aa2b689-4ea6-46c2-bc9c-8ed0d5cc9f97&refreshToken=973653CA5D564753F732D3952B354F50&grantType=client_credentials";
	HttpURLConnection httpclient=(HttpURLConnection) (new URL(url+param).openConnection());
	httpclient.connect();
	BufferedReader reader = new BufferedReader(new InputStreamReader(httpclient.getInputStream()));
	String line=reader.readLine();
	while(line!=null)
	{
		rs=rs+line;
		line=reader.readLine();
	}
	reader.close();
	httpclient.disconnect();
	
	}
	catch (Exception e) {
		// TODO: handle exception
	}
	return rs;
	
}
}
