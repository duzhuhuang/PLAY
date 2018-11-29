package entiy;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class toushu {
String fromname;
String tarname;
int from ;
int cid;
Timestamp time;
String info;
public String getFromname() {
	return fromname;
}
public void setFromname(String fromname) {
	this.fromname = fromname;
}
public String getTarname() {
	return tarname;
}
public void setTarname(String tarname) {
	this.tarname = tarname;
}
public int getFrom() {
	return from;
}
public void setFrom(int from) {
	this.from = from;
}
public int getCid() {
	return cid;
}
public void setCid(int cid) {
	this.cid = cid;
}
public String getTime() {
	return timeStamp2Date(time);
}
public void setTime(Timestamp time) {
	this.time = time;
}
public String getInfo() {
	return info;
}
public void setInfo(String info) {
	this.info = info;
}
public  String timeStamp2Date(Timestamp d) {  
	 
	 SimpleDateFormat format =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
	 return format.format(d);
} 
}
