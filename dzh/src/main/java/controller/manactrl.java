package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import entiy.Page;
import entiy.user;
import function.designFunction;
import function.nologinFunction;

@Controller
public class manactrl {
	@Autowired
	nologinFunction fun;
	

	@RequestMapping("/mtest")
	public void test(HttpServletResponse response,HttpSession session,user u) throws IOException {
		PrintWriter w=response.getWriter();
		response.setCharacterEncoding("utf-8");
		user u2=fun.mlogin(u.getName());
		if(u2==null||!u.getPassword().equals(u2.getPassword())) {
			w.print("erro");
			
		}
		else {
			w.print("true");
		session.setAttribute("manager", u);
		}
		w.flush();
		w.close();
	}
	@RequestMapping("/mLogin")
	public String mlogin(HttpSession session) {
		if(session.getAttribute("manager")!=null)
		return "manager";
		else
			return "mlogin";
	}
	@RequestMapping("/m2")
	public String m2(@RequestParam(required=false)Integer pid,@RequestParam(required=false)Date date1,@RequestParam(required=false)Date date2,@RequestParam(required=false)Double cost1,@RequestParam(required=false)Double cost2,@RequestParam(required=false)String keyword,HttpServletRequest request) {
		System.out.println(date1+""+date2+""+cost1+""+cost2+""+keyword);
		cost1=cost1==null?0.0:cost1;
		cost2=cost2==null?0.0:cost2;
		pid=pid==null?0:pid;
		Timestamp t1=date1==null?null:new Timestamp(date1.getTime());
		Timestamp t2=date2==null?null:new Timestamp(date2.getTime());
		request.setAttribute("list",fun.dymord(pid,t1,t2, cost1, cost2, keyword));
		return "frame/m2";
		
	}
	@RequestMapping("/m3")
	public String m3(HttpServletRequest request) {
		request.setAttribute("lsit", fun.querytoushu());
		return "frame/m3";
	}
	@RequestMapping("/m3_1")
	public String m3_1(int id1,int id2,HttpServletRequest request) {
		fun.toushuchuli(id1,id2);
		return m3(request);
	}
	@RequestMapping("/m3_2")
	public String m3_2(int id1,int id2,HttpServletRequest request) {
		request.setAttribute("lsit",fun.toushujiancha(id1,id2));
		return "frame/m3";
	}
	@RequestMapping("/m3_3")
	public void m3_3(int id,HttpServletResponse response) throws IOException {
		PrintWriter out= response.getWriter();
		out.print(fun.toushulv(id)*100+"%");
		out.flush();
		out.close();
		
	}
	@RequestMapping("/m4")
	public String m4(HttpServletRequest request,int page) {
		request.setAttribute("list",fun.logread(page));
		request.setAttribute("page", new Integer(page));
		return "frame/m4";
	}
	@RequestMapping("m0")
	public String m0(HttpServletRequest request) {
		request.setAttribute("list", fun.m0());
		return "frame/m0";
	}
	@RequestMapping("m0_1")
	public String m0_1(int id,HttpServletRequest request){
		request.setAttribute("COMP",fun.m0_1(id));
		request.setAttribute("workers",fun.m0_2(id));
		return "frame/m0_1";
	}
	
}
