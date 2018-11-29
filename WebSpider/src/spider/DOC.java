package spider;

import java.util.List;

public class DOC {
	
	String text;
	int start;
	int end;
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public DOC(String s,int a) {
		text=s;
		start=a;
		
	}
}
