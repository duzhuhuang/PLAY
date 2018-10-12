package controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
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

import entiy.company;
import entiy.design;
import entiy.user;

import function.nologinFunction;
@Controller
public class nologinController {
	@Autowired
	nologinFunction lf;
	@RequestMapping(value = "/hello")
    public String hello(){
        //lf.login();
		System.out.println("hello");
        return "NewFile";
    }
	@RequestMapping("/display")
	public void display(HttpServletRequest request,HttpServletResponse response) {
		//ArrayList<design> list= (ArrayList<design>) lf.getdisplay();
		
	}

    @RequestMapping(value = "/login")
    public String login(user u,ModelMap m){
    	user u2=new user();
    	u2.setName("nisan");
    	ArrayList<user> list=new ArrayList<user>();
    	list.add(u);
    	list.add(u2);
       m.addAttribute("list",list);
       
        return "list";
    }
    @RequestMapping("/Handler")
    public String  fileUpload(@RequestParam("file") CommonsMultipartFile file) throws IOException {
    		if(file!=null)
    			System.out.println("f");
    		else
    			System.out.println("null");
    	 try {
             //获取输出流
             OutputStream os=new FileOutputStream("E:/"+new Date().getTime()+file.getOriginalFilename());
             //获取输入流 CommonsMultipartFile 中可以直接得到文件的流
             InputStream is=file.getInputStream();
             int temp;
             //一个一个字节的读取并写入
             while((temp=is.read())!=(-1))
             {
                 os.write(temp);
             }
            os.flush();
            os.close();
            is.close();
          
         } catch (FileNotFoundException e) {
             // TODO Auto-generated catch block
             e.printStackTrace();
         }
		return null;
    	
    }
    @RequestMapping(value="companyList")
    public String companyList(ModelMap m) {
    	//HttpSession session =request.getSession();
    		ArrayList<company> list=new ArrayList<company>();
    		company p1=new company();
    		p1.setId(1);
    		list.add(p1);
    		company p2=new company();
    		p2.setId(2);
    		list.add(p2);
    		company p3=new company();
    		p3.setId(3);
    		list.add(p3);
    		company p4=new company();
    		p4.setId(4);
    		list.add(p4);
    		company p5=new company();
    		p5.setId(5);
    		list.add(p5);
    		company p6=new company();
    		p6.setId(6);
    		list.add(p6);
    		
    		m.addAttribute("list",list.subList(0,3));
    		return "companylist";
    	
    }
  
}
