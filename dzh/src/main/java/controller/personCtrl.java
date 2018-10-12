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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import entiy.Page;
import entiy.company;
import entiy.design;
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
		if(p.getPassword().equals(u.getPassword()))
		{
			session.setAttribute("user",u);
			display(request);
			return "pmain";
		}
		return "login";
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
	display(request);//Ë³±ãµÇÂ¼
		return  "pmain";
	}
	
	public void display(HttpServletRequest request) {
		List<Integer> l=dfunc.topdesign();
		
		request.setAttribute("did1", l.get(0).intValue());
		request.setAttribute("did2", l.get(1).intValue());
		request.setAttribute("did3", l.get(2).intValue());
		
		request.setAttribute("img1", "img/01.jpg");
		request.setAttribute("img2", "img/02.jpg");
		request.setAttribute("img3", "img/03.jpg");
		
		
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
		w.setpid(((person)session.getAttribute("user")).getId());
		try{func.newwanna(w);}
		catch (Exception e) {
			System.out.println(e);// TODO: handle exception
		}
		return null;
	}
	@RequestMapping(value="/updatePersonInfo")
	public String updateInfo(person p,HttpSession session) {
		p.setName(((person)session.getAttribute("user")).getName());
		session.setAttribute("user", func.update(p));
		return "frame/p1";
	}
	
}
