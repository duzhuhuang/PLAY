package entiy;

import java.util.Date;

public class order {
	int id;
	int pid;
	int cid;
	Date date;
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
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
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
	
}
