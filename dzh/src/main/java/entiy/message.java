package entiy;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class message {
int source;
int sendto;
String information;
String type;
int read;
String Name;
Timestamp time =new Timestamp(0);
public String getTime() {
	SimpleDateFormat format =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
	 return format.format(time);
}
public void setTime(Timestamp time) {
	this.time = time;
}
public void setName(String Name) {
	this.Name = Name;
}
public String getName() {
	return Name;
}
public void setRead(int read) {
	this.read = read;
}
public int getRead() {
	return read;
}
public void setType(String type) {
	this.type = type;
}
public String getType() {
	return type;
}
public int getSource() {
	return source;
}
public void setSource(int source) {
	this.source = source;
}
public int getSendto() {
	return sendto;
}
public void setSendto(int sendto) {
	this.sendto = sendto;
}
public String getInformation() {
	return information;
}
public void setInformation(String information) {
	this.information = information;
}

}
