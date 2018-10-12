package controller;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.javassist.runtime.Cflow;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import entiy.company;
import entiy.design;
import entiy.picture;
import entiy.user;
@Controller
public class compCtrl {
	@Autowired
	function.designFunction df;
	@Autowired
	function.designFunc df2;
	@Autowired
	function.companyFunction cf;
	@RequestMapping(value="/addDesign")
	public String addDesign(HttpSession session,HttpServletRequest request,design d, @RequestParam(value="files",required=false)MultipartFile file) throws IOException {
	int did	= df.addDesign(d);
	
	String filename= UUID.randomUUID().toString();
	File image=new File("d:/"+filename+file.getOriginalFilename());
	FileUtils.copyInputStreamToFile(file.getInputStream(),image);
	
	picture p=new picture();
	p.setPath(image.getPath());
	
	df.addpicture(did, p);
	return "designList";
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
		
		if(c.getPassword().equals(a.getPassword()))
		{
			session.setAttribute("user", a);
			return "comp";
		}
		
		else return "login";
	}
	
	@RequestMapping(value="/addpicture")
	public String addpicture(String designID,HttpSession session,HttpServletRequest request,@RequestParam(value="files")MultipartFile file) throws IOException {
		
		
		String filename= UUID.randomUUID().toString();
		File image=new File("d:/"+filename+file.getOriginalFilename());
		FileUtils.copyInputStreamToFile(file.getInputStream(),image);
		
		picture p=new picture();
		p.setPath(image.getPath());
		
		df.addpicture(Integer.parseInt(designID), p);
		
		return null;
		
		
	}
	@RequestMapping(value="/addlogo")
	public String addlogo(HttpSession session,HttpServletRequest request,@RequestParam(value="files")MultipartFile file) throws IOException {
		company c=(company)session.getAttribute("user");
		if(c!=null&&c.getLogoPath()==null) {
		String filename= UUID.randomUUID().toString();
		File image=new File("d:/"+filename+file.getOriginalFilename());
		FileUtils.copyInputStreamToFile(file.getInputStream(),image);
		c.setLogoPath(image.getPath());
		cf.updateComp(c);
		}
		
		return null;
		
		
	}
	@RequestMapping(value="/designInfo")
	public String designInfo(HttpServletRequest request,int id) {
		//design d=df.GetDesign(id);
		design d=new design();
		picture p=new picture();
		picture p2=new picture();
		d.setName("DIODA");
		ArrayList<picture> list=new ArrayList<picture>();
		for(int i=0;i<5;i++) {
			list.add(new picture());
		}
		p.setPath("img/01.jpg");
		p.setWhat("wtf");
		p2.setPath("img/02.jpg");
		p2.setWhat("??????");
		list.add(0, p);
		list.add(1,p2);
		d.setPictures(list);
		d.setId(id);
		request.setAttribute("design",d);
		return "designInfo";
	}
	@RequestMapping("/form")
	public String form() {
				
		
		return null;
	}
  
}
