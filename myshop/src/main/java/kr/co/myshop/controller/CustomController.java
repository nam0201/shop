package kr.co.myshop.controller;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.myshop.service.CustomService;
import kr.co.myshop.service.CustomServiceImlp;
import kr.co.myshop.vo.CustomVo;
import kr.co.myshop.vo.MtmVo;

@Controller
public class CustomController {
   @Autowired
   @Qualifier("cs")
   private CustomService service;
   
   @RequestMapping("/custom/mtm")
   public String mtm()
   {
	   return "/custom/mtm";
   }
   
   @RequestMapping("/custom/mtm_ok")
   public String mtm_ok(MtmVo mvo,HttpSession session)
   {
	   return service.mtm_ok(mvo,session);
   }
   
   @RequestMapping("/custom/custom")
   public String custom()
   {
	   return "/custom/custom";
   }
   
   @RequestMapping("/custom/custom_ok")
   public String custom_ok(CustomVo cvo, HttpSession session)
   {
	   return service.custom_ok(cvo,session);
   }
   
  
}
