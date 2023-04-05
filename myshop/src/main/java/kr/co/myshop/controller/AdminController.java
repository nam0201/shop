package kr.co.myshop.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;

import kr.co.myshop.service.AdminService;
import kr.co.myshop.vo.AcustomVo;
import kr.co.myshop.vo.AmtmVo;
import kr.co.myshop.vo.ProductVo;
import kr.co.myshop.vo.QnaVo;

@Controller
public class AdminController {
	
	@Autowired
	@Qualifier("as")
	private AdminService service;
     @RequestMapping("/admin/adminmain")
     public String main()
     {
    	 return "/admin/adminmain";
     }
     
     @RequestMapping("admin/admingumae")
     public String admingumae(Model model)
     {
    	 return service.admingumae(model);
     }
     
     @RequestMapping("/admin/chgstate")
     public String chgstate(HttpServletRequest request)
     {
    	 return service.chgstate(request);
     }
     
     @RequestMapping("/admin/adminqna")
     public String adminqna(Model model)
     {
    	 return service.adminqna(model);
     }
     
     @RequestMapping("/admin/ansview_ok")
     public String ansview_ok(QnaVo qvo,HttpSession session)
     {
    	 return service.ansview_ok(qvo,session);
     }
     
     @RequestMapping("/admin/adminmtm")
     public String adminmtm(Model model,HttpSession session)//select한값을 addminmtm에 보여주ㅓ야하기 때문에 model 필요
     {
    	 return service.adminmtm(model,session);
     }
     
     @RequestMapping("/admin/amtm")
     public String amtm(AmtmVo avo, HttpSession session)
     {
    	 return service.amtm(avo, session);
     }
     
     @RequestMapping("/admin/adminmember")
     public String adminmember(Model model, HttpSession session)
     {
    	 return service.adminmember(model,session);
     }
     
     @RequestMapping("/admin/out_ok")
 	 public String out_ok(HttpServletRequest request)
 	 {
    	 return service.out_ok(request);
 	 }
     
     @RequestMapping("/admin/adminproduct")
     public String adminproduct(HttpSession session, Model model,HttpServletRequest request)
     {
    	 return service.adminproduct(session,model,request);
     }
     
     @RequestMapping("/admin/productUp")
     public String productUp(ProductVo pvo)
     {
    	 return service.productUp(pvo);
     }
     
     @RequestMapping("/admin/changeimage")
     public String changeimage(HttpServletRequest request) throws IOException
     {
    	 return service.changeimage(request);
     }
     
     @RequestMapping("/admin/adminreview")
     public String adminreview(Model model)
     {
    	 return service.adminreview(model);
     }
     
     @RequestMapping("/admin/reviewdel")
     public String reviewdel(HttpServletRequest request)
     {
    	 return service.reviewdel(request);
     }
     
     @RequestMapping("/admin/admincustom") // 관리자 보기
 	public String admincustom(Model model,HttpSession session)
 	{
 		return service.admincustom(model,session); 
 	}
 	
 	@RequestMapping("/admin/acustom") // 답변
 	public String acustom(AcustomVo avo,HttpSession session)
 	{
 		return service.acustom(avo,session); 
 	}
}
