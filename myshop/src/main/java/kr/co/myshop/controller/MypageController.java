package kr.co.myshop.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.myshop.service.MypageService;
import kr.co.myshop.vo.ReviewVo;

@Controller
public class MypageController {
	
	@Autowired
	@Qualifier("ms")
	private MypageService service;
	
	@RequestMapping("/mypage/wishview")
	public String wishview(HttpSession session, Model model)
	{
		return service.wishview(session,model);
	}
	
	@RequestMapping("/mypage/wishdel")
	public String wishdel(HttpServletRequest request)
	{
		return service.wishdel(request);
	}
	
	@RequestMapping("/mypage/cart_add")
	public String cart_add(HttpServletRequest request,HttpSession session)
	{
		return service.cart_add(request,session);
	}
	
	@RequestMapping("/mypage/cartview")
	public String cartview(HttpSession session, Model model)
	{
		return service.cartview(session,model);
	}
	
	@RequestMapping("/mypage/cartdel")
	public String cartdel(HttpServletRequest request)
	{
		return service.cartdel(request);
	}
	
	@RequestMapping("/mypage/cart_su")
	public void cart_su(HttpServletRequest request, PrintWriter out,HttpSession session)
	{
		service.cart_su(request,out,session);
	}
	
	@RequestMapping("/mypage/jumunview")
	public String jumunview(HttpSession session,Model model)
	{
		return service.jumunview(session,model);
	}
	
	@RequestMapping("/mypage/chgstate")
	public String chgstate(HttpServletRequest request)
	{
		return service.chgstate(request);
	}
	
	@RequestMapping("/mypage/review")
	public String review(HttpServletRequest request, Model model)
	{
		return service.review(request,model);
	}
	
	@RequestMapping("/mypage/review_ok")
	public String review_ok(ReviewVo rvo,HttpSession session)
	{
		return service.review_ok(rvo,session);
	}
	

	

}
