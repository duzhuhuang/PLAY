package entiy;

public class picture {
int id;
String what;
String path;
int did;
public void setDid(int did) {
	this.did = did;
}
public int getDid() {
	return did;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getWhat() {
	return what;
}
public void setWhat(String what) {
	this.what = what;
}
public String getPath() {
	return path;
}
public void setPath(String path) {
	this.path = path;
}
@Override
	public String toString() {
		// TODO Auto-generated method stub
		return this.path;
	}
}
