package kr.co.myshop.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.myshop.service.ProductService;
import kr.co.myshop.vo.BaesongVo;
import kr.co.myshop.vo.GumaeVo;
import kr.co.myshop.vo.ProductVo;
import kr.co.myshop.vo.QnaVo;

@Controller
public class ProductController {

	@Autowired
	@Qualifier("ps")
	private ProductService service;
	
	@RequestMapping("/product/product")
	public String product(Model model)
	{
		return service.product(model);
	}
	
	@RequestMapping("/product/getjung")
	public void getjung(HttpServletRequest request,PrintWriter out) //view가 없으니 return이 없음
	{
		service.getJung(request,out);
	}
	
	@RequestMapping("/product/getso")
	public void getso(HttpServletRequest request, PrintWriter out)
	{
		service.getSo(request,out);
	}
	
	@RequestMapping("/product/getcode")
	public void getcode(HttpServletRequest request, PrintWriter out)
	{
		service.getCode(request,out);
	}
	
	@RequestMapping("/product/product_ok")
	public String product_ok(HttpServletRequest request)throws IOException
	{

		return service.product_ok(request);
		
	}
	
	@RequestMapping("/product/plist")
	public String plist(HttpServletRequest request, Model model)
	{
		return service.plist(request, model);
	}
	
	//임시
	@RequestMapping("/trtd")
	public String trtd(Model model)
	{
		ArrayList<String> list=new ArrayList<String>();
		for(int i=0;i<24;i++)
		{
			
			list.add(i+"");
			
		}
		model.addAttribute("list", list);
		return "/trtd";
	}
	
	@RequestMapping("/product/pcontent")
	public String pcontent(HttpServletResponse response,HttpServletRequest request, Model model, HttpSession session)
	{
		return service.pcontent(response,request,model,session);
	}
	
	@RequestMapping("/product/wish_add")
	public void wish_add(HttpServletRequest request, HttpSession session, PrintWriter out)
	{
		/*if(session.getAttribute("userid")==null)
			return "redirect:/login/login";
		else
			return service.wish_add(request,session);*/
	  service.wish_add(request,session,out);
	
	}
	
	@RequestMapping("/product/cart_add")
	public void cart_add(HttpServletRequest request,HttpSession session,PrintWriter out)
	{
		service.cart_add(request,session,out);
	}
		
	
	@RequestMapping("/product/gumae")
	public void gumae(HttpServletRequest request, HttpSession session, Model model)
	{
		service.gumae(request,session,model);
	}
	
	@RequestMapping("/product/member_phone")
	public void member_phone(HttpServletRequest request, PrintWriter out,HttpSession session)  //ajax는 void
	{
		service.member_phone(request,out,session);
	}
	
	@RequestMapping("/product/baeview")
	public String baeview(HttpSession session, Model model)
	{
		return service.baeview(session, model);
	}
	
	@RequestMapping("/product/jusoadd")
	public String jusoadd()
	{
		return service.jusoadd();
	}
	
	
	@RequestMapping("/product/jusoadd_ok")
	public String jusoadd_ok(BaesongVo bvo, HttpSession session)
	{
		return service.jusoadd_ok(bvo,session);
	}
	
	@RequestMapping("/product/baeup")
	public String baeup(HttpServletRequest request,Model model)
	{
		return service.baeup(request,model);
	}
	
	@RequestMapping("/product/baeup_ok")
	public String baeup_ok(BaesongVo bvo,HttpSession session)
	{
		return service.baeup_ok(bvo,session);
	}
	
	@RequestMapping("/product/baedel")
	public String baedel(HttpServletRequest request, HttpSession session)
	{
		return service.baedel(request,session);
	}
	
	@RequestMapping("/product/chgcla")
	public String chgcla(HttpServletRequest request, Model model)//배송사항 변경창띄우기
	{
		return service.chgcla(request, model);
	}
	
	@RequestMapping("/product/chg_ok") //배송요청사항을 변경
	public void chg_ok(HttpServletRequest request, PrintWriter out)
	{
		service.chg_ok(request,out);
	}
	
	@RequestMapping("/product/gumae_ok")
	public String gumae_ok(int id,GumaeVo gvo,HttpSession session)
	{
		//System.out.println(id);
		return service.gumae_ok(id,gvo,session);
		
		
		
	}
	
	/* 3개의 vo를 이용하여 jumun내용보기
	@RequestMapping("/product/jumun") //jumuncode만 사용되기때문에 userid는 필요없음
	public String jumun(HttpServletRequest request, Model model)
	{
		return service.jumun(request,model);
	}*/
	
	@RequestMapping("/product/jumun")
	public String jumun(HttpServletRequest request, Model model)
	{
		return service.jumun2(request,model);
	}
	
	@RequestMapping("/product/munwrite")
	public String munwrite(QnaVo qvo,HttpSession session)
	{
		return service.munwrite(qvo,session);
	}
	
}
