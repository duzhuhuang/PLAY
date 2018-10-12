package entiy;

public class message {
int source;
int sendto;
String information;
String type;
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
