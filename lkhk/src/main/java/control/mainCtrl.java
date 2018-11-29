package control;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.Printer;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import servers.SeachServers;
import servers.requestOther;
@Controller
public class mainCtrl {
	@Autowired
	SeachServers serv;
	@RequestMapping("/index")
public String index() {
	
	return "index";
}
	@RequestMapping("/search")
	public String search(String word,HttpServletRequest request) {
		try {
			request.setAttribute("List", serv.search(word));
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "rs";
	}
	/*static int i=0;
	@RequestMapping(value="/test")
	public void test(HttpServletResponse response) {
		try {
			Thread.sleep(100);
	   PrintWriter out=	response.getWriter();
	   out.print(serv.getOtherData());
	   out.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	@RequestMapping(value="/getData")
	public void getData(HttpServletResponse response) {
		try {
			PrintWriter out=response.getWriter();
			
			 out.print(i++);
			   out.close();
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		
		
	}*/
}
