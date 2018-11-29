package entiy;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;


public class order {
	int id;
	int pid;
	int cid;
	String cname;
	String pname;
	public void setCname(String cname) {
		this.cname = cname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getCname() {
		return cname;
	}
	public String getPname() {
		return pname;
	}
	int did;
	public void setDid(int did) {
		this.did = did;
	}
	public int getDid() {
		return did;
	}
	Timestamp date=new Timestamp(0);
	double cost;
	int action;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getDate() {
		return timeStamp2Date(date);
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public double getCost() {
		return cost;
	}
	public void setCost(double cost) {
		this.cost = cost;
	}
	/**
	 * 订单活跃状态 
	 * 
	 * @return action
	 * 0：已经完成	1：户主发起	 2：装修公司已确认
	 */
	public int getAction() {
		return action;
	}
	/**
	 * 订单活跃状态 
	 * 
	 * @param action
	 * 0：已经完成	1：户主发起	 2：装修公司已确认
	 */
	public void setAction(int action) {
		this.action = action;
	}
	 /** 
	  		* 时间戳转换成日期格式字符串 
	        * @param seconds 精确到秒的字符串 
	        * @param formatStr 
	        * @return 
	        */  
	     public  String timeStamp2Date(Timestamp d) {  
	    	 
	    	 SimpleDateFormat format =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
	    	 return format.format(d);
	     }  
	
}
