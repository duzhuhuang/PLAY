package entiy;

import java.util.ArrayList;
import java.util.List;

public class design {
int id;
String name;
int cid;
String style;
String word;
double area;
double cost;
ArrayList<picture> pictures;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public int getCid() {
	return cid;
}
public void setCid(int cid) {
	this.cid = cid;
}
public String getStyle() {
	return style;
}
public void setStyle(String style) {
	this.style = style;
}
public String getword() {
	return word;
}
public void setword(String word) {
	this.word = word;
}
public double getArea() {
	return area;
}
public void setArea(double area) {
	this.area = area;
}
public double getCost() {
	return cost;
}
public void setCost(double cost) {
	this.cost = cost;
}
public ArrayList<picture> getPictures() {
	return pictures;
}
public void setPictures(List<picture> list) {
	this.pictures = (ArrayList<picture>) list;
}

}
