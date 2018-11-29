package controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.sun.org.apache.bcel.internal.generic.NEW;

import entiy.Page;
import entiy.company;
import entiy.design;
import entiy.message;
import entiy.person;
import entiy.user;
import entiy.wanna;
import function.designFunction;
import function.personFunc;
@Controller
public class personCtrl {
	@Autowired
	personFunc func;
	@Autowired
	designFunction dfunc;
	@RequestMapping(value="/personLogin")
	public String login(HttpSession session ,HttpServletRequest request,person p) {
		person u=func.login(p.getName());
		if(session.getAttribute("user")!=null)
		{
			return index(request, session);
		}
		if(u!=null&&p.getPassword().equals(u.getPassword()))
		{
			session.setAttribute("user",u);
			display(request,session);
			LogManager.getLogger().info(u.getName()+" login");
			return "pmain";
		}
		return "loginfail";
	}
	@RequestMapping(value="/personRegist/check")
	public void check(String name,HttpServletResponse response) throws IOException {
		PrintWriter out= response.getWriter();
		int i=func.check(name);
		if(i==0)
			out.print("0");
		else
			out.print("1");
		out.flush();
		out.close();
		
	}
	@RequestMapping(value="/personRegist/add")
	public String ADD(person p,HttpSession session,HttpServletRequest request) {
		System.out.println(p.getName());
		func.add(p);
	session.setAttribute("user", func.login(p.getName()));
	display(request,session);//Ë³±ãµÇÂ¼
		return  "pmain";
	}
	@RequestMapping("/index")
	public String index(HttpServletRequest request,HttpSession session) {
		display(request,session);
		return "pmain";
		
	}
	public void display(HttpServletRequest request,HttpSession session) {
		List<design> l=dfunc.topdesign(((user)session.getAttribute("user")).getId());
		
		request.setAttribute("list1",l );
		
		
		//request.setAttribute("img1", "img/01.jpg");
		//request.setAttribute("img2", "img/02.jpg");
		//request.setAttribute("img3", "img/03.jpg");
		
		
	}
	@RequestMapping(value="/wannaanddesign")
	public String wandd(design d,HttpServletRequest request,HttpSession session) {
		user u=(user)session.getAttribute("user");
		
		wanna w=new wanna();
		w.setpid(u.getId());
		w.setActivy(0);
		w.setArea(d.getArea());
		w.setAddress(request.getParameter("address"));
		w.setPhone(request.getParameter("phone"));
		w.setDid(d.getId());
		func.addwannaANDdesign(w,d);
		return "frame/p2";
	}
	@RequestMapping(value="/designList")
	public String designList(HttpServletRequest request,Page p) {
		p.setTotal(dfunc.countDesign()/6+1);
		List<design>list=dfunc.AllDesign(p.getPage());
		for(design d:list) {
			
			d.setPictures(dfunc.querypicture(d.getId()));
			
		}
		request.setAttribute("list", list);
		
		request.setAttribute("page",p);
		return "designList";
	}
	
	@RequestMapping(value="/newWanna")
	public String NewWanna(HttpSession session,wanna w) {
		int id=((person)session.getAttribute("user")).getId();
		w.setpid(id);
		try{func.newwanna(w);}
		catch (Exception e) {
			System.out.println(e);// TODO: handle exception
		}
		func.tip(id);
		return null;
	}
	@RequestMapping(value="/newMessage")
	public void newMessage() {
		
	}
	@RequestMapping(value="/updatePersonInfo")
	public String updateInfo(person p,HttpSession session) {
		p.setName(((person)session.getAttribute("user")).getName());
		session.setAttribute("user", func.update(p));
		return "frame/p1";
	}
	@RequestMapping(value="/checkMessage")
	public void checkMessage(HttpServletResponse response,HttpSession session) throws IOException {
		PrintWriter out= response.getWriter();
		person p=(person)session.getAttribute("user");
		int len=func.getMessage(p.getId()).size();
		System.out.println(len);
		if(len==0)
			out.print("0");
		else
			out.print("1");
		out.flush();
		out.close();
	}
	@RequestMapping(value="/read")
	public String read(HttpSession session,HttpServletRequest request) {
		person p=(person)session.getAttribute("user");
		List<message> a=func.getMessageList(p.getId());
		
		request.setAttribute("list",a);
		func.setread(p.getId());
		return "frame/p4";
	}
	@RequestMapping(value="/logoff")
	public String off(HttpSession session)
	{
		session.setAttribute("user",null);
		return "login";
	}
	@RequestMapping(value="/p2")
	public String p2(HttpSession session,HttpServletRequest request) {
		person p=(person)session.getAttribute("user");
		request.setAttribute("list", func.findwanna(p.getId()));
		return "frame/p2";
	}
	@RequestMapping(value="/p3")
	public String p4(HttpSession session,HttpServletRequest request) {
		int id=((user)session.getAttribute("user")).getId();
		request.setAttribute("list",func.orderlist(id));
		return "frame/p3";
	}
	@RequestMapping("/p3-1")
	public String p41(int id,HttpSession session,HttpServletRequest request) {
		func.orderisOK(id);
		
		return p4(session, request);
	}
	@RequestMapping("toushu")
	public void toushu(HttpSession session,message m,HttpServletResponse response) throws IOException{
    	PrintWriter out= response.getWriter();
    	user u=(user)session.getAttribute("user");
    	m.setSource(u.getId());
    	out.println("");
	}
}
