package controller;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;

import java.util.Stack;
import java.util.List;
import java.util.UUID;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.javassist.runtime.Cflow;
import org.apache.tools.ant.types.selectors.TypeSelector.FileType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import entiy.Page;
import entiy.company;
import entiy.design;
import entiy.order;
import entiy.picture;
import entiy.user;
import entiy.wanna;
@Controller
public class compCtrl {
	@Autowired
	function.designFunction df;
	
	@Autowired
	function.companyFunction cf;
	@RequestMapping(value="/addDesign")
	public String addDesign(HttpSession session,HttpServletRequest request,design d, @RequestParam(value="files",required=false)MultipartFile file) throws IOException {
	int did	= df.addDesign(d);
	
	String filename= UUID.randomUUID().toString();
	File image=new File("img/"+filename+file.getOriginalFilename());
	FileUtils.copyInputStreamToFile(file.getInputStream(),image);
	
	picture p=new picture();
	p.setPath(image.getPath());
	
	df.addpicture(did, p);
	Page pg=new Page();
	pg.setPage(1);
	return designList(request, session, pg);
	
	}
	
	@RequestMapping(value="/compRegist/add")
	public String compadd(company c) {
		System.out.println(c.getName());
		cf.addcompany(c);
		return "cindex";
	}
	@RequestMapping(value="/compRegist/check")
	public void compcheck( HttpServletRequest request,HttpServletResponse response,@RequestParam(value="name")String name) throws IOException {
		PrintWriter w=response.getWriter();
		response.setCharacterEncoding("utf-8");
		System.out.println(name);
		int i=cf.check(name);
		w.print(Integer.toString(i));
		w.flush();
		w.close();
	}
	@RequestMapping(value="/compLogin")
	public String login(company c,HttpSession session) {
		company a=cf.login(c.getName());
		
		if(c!=null&&c.getPassword().equals(a.getPassword()))
		{
			session.setAttribute("user", a);
			return "comp";
		}
		
		else return "loginfail";
	}
	
	@RequestMapping(value="/addpicture")
	public String addpicture(String designID,HttpSession session,HttpServletRequest request,@RequestParam(value="file")MultipartFile file) throws IOException {
		
		
		String filename= UUID.randomUUID().toString();
		File image=new File("d://duzhuhuangFiles/"+filename+file.getOriginalFilename());
		FileUtils.copyInputStreamToFile(file.getInputStream(),image);
		
		picture p=new picture();
		p.setPath(image.getPath());
		
		df.addpicture(Integer.parseInt(designID), p);
		
		return designInfo(request, Integer.parseInt(designID));
		
		
	}
	@RequestMapping(value="/addlogo")
	public String addlogo(HttpSession session,HttpServletRequest request,@RequestParam(value="file")MultipartFile file) throws IOException {
		company c=(company)session.getAttribute("user");
		if(c!=null) {
			String s=file.getOriginalFilename();
			String [] filetype=s.split("\\.");
		File image=new File("d://duzhuhuangFiles/companylogo"+Integer.toString(c.getId())+"."+filetype[filetype.length-1]);
		FileUtils.copyInputStreamToFile(file.getInputStream(),image);
		c.setLogoPath(image.getPath());
		cf.updateComp(c);
		session.setAttribute("user",c);
		}
		
		return "frame/c1";
		
		
	}
	@RequestMapping(value="/comp/read")
	public String read(HttpSession session,HttpServletRequest request) {
		int id=((user)session.getAttribute("user")).getId();
		
		request.setAttribute("list",cf.getallMessage(id));
		
		this.cf.read(id);
		return "frame/c5";
	}
	@RequestMapping(value="/comp/checkMessage")
	public void checkmessage(HttpServletResponse response,HttpSession session) throws IOException {
		PrintWriter out= response.getWriter();
		company c=(company)session.getAttribute("user");
		
		int len=(cf.getmessage(c.getId())).size();
		if(len==0)
			out.print("0");
		else
			out.print("1");
		out.flush();
		out.close();
		
	}
	@RequestMapping(value="/designInfo")
	public String designInfo(HttpServletRequest request,int id) {
		design d=df.GetDesign(id);
		d.setPictures(df.querypicture(d.getId()));
		
		request.setAttribute("design",d);
		if(request.getParameter("userType").equals("person"))
		return "designInfo";
		else
			return "frame/updateDesign";
	}
	@RequestMapping("/designList2C")
	public String designList(HttpServletRequest request,HttpSession session,Page p) {
		company c=(company)session.getAttribute("user");
		List<design>list=cf.designList2C(c.getId(),p.getPage(),10);
		
		
		p.setTotal(list.size()/10+1);
		request.setAttribute("list", list);
		
		request.setAttribute("page",p);
		return "frame/c3";
	}
	@RequestMapping("/updateDesign")
	public String updateDesign(design d,HttpServletRequest request,HttpSession session) {
		this.df.updateDesign(d);
		Page p=new Page();
		p.setPage(1);
		return designList(request, session, p);
	}
	@RequestMapping("/deletepicture")
	public void deletepic(int id) {
		df.delete(id);
		System.out.println(id);
	}
	@RequestMapping("/form")
	public String form() {
				
		
		return null;
	}
	
	@RequestMapping("/c2")
	public String c2(HttpServletRequest request,HttpSession session) {
		Page p=new Page();
				p.setPage(1);
		p.setTotal(1+cf.count()/12);
		request.setAttribute("page", p);
		List<wanna> l= cf.allwanna(p.getPage(),((company)session.getAttribute("user")).getId());
		request.setAttribute("list",l );
		request.setAttribute("map", cf.map(l));
		return "frame/c2";
	}
	@RequestMapping("/c2_1")
	public String c21(HttpServletRequest request,Page p,HttpSession session) {
		
		request.setAttribute("page", p);
		List<wanna> l= cf.allwanna(p.getPage(),((company)session.getAttribute("user")).getId());
		request.setAttribute("list",l );
		request.setAttribute("map", cf.map(l));
		return "frame/c2";
	}
	@RequestMapping("/c2_2")
	public String c22(HttpSession session,order o,int wannaid,HttpServletRequest request) {
		int cid=((company)session.getAttribute("user")).getId();
		o.setCid(cid);
		
		df.acDesign(o,wannaid);
		
		return c2(request,session);
	}
	@RequestMapping("/c4")
	public String c4(HttpSession session,HttpServletRequest request) {
		int cid=((user)session.getAttribute("user")).getId();
		request.setAttribute("list",cf.orderlist(cid));
		//request.setAttribute("wannas", cf.wannas(cid));
		return "frame/c4";
	}
	@RequestMapping("/m1")
	public String m1(HttpServletRequest request){
		
		request.setAttribute("list",df.designInspect());
		return "frame/m1";
	}
	@RequestMapping("/m1_2")
	public String m1_2(HttpServletRequest request,int id,boolean allow) {
		if(allow) {
			df.allow(id);
		}
		else {
			df.del(id);
		}
		return m1(request);
	}
	@RequestMapping("c1")
	public String worker(HttpSession session,HttpServletRequest request) {
		company c=(company)session.getAttribute("user");
		request.setAttribute("list", cf.worker(c.getId()));
		return "frame/c1_1";
	}
	
	@RequestMapping("c1_1_a")
	public String addw(@RequestParam(value="file")MultipartFile file,entiy.worker w,HttpSession session,HttpServletRequest request) {
		company c=(company)session.getAttribute("user");
		if(c!=null) {
			String s=file.getOriginalFilename();
			String [] filetype=s.split("\\.");
		File image=new File("./img/companylogo"+Integer.toString(c.getId())+"."+filetype[filetype.length-1]);
		try {
			FileUtils.copyInputStreamToFile(file.getInputStream(),image);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		w.setPhoto(image.getPath());
		w.setCid(c.getId());
		cf.newworker(w);
		}
		return worker(session, request);
	}
	@RequestMapping("c1_1_d")
	public String delworker(int id,HttpSession session,HttpServletRequest request) {
		cf.delworker(id);
		return worker(session, request);
		
	}
	
}
