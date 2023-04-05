package kr.co.myshop.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.myshop.service.MemberService;
import kr.co.myshop.vo.MemberVo;

@Controller
public class MemberController {
	@Autowired
	@Qualifier("ms")
	private MemberService service;
	
	@RequestMapping("/member/member_input")
	public String member_input()
	{
		return "/member/member_input";
	}
	
	@RequestMapping("/member/userid_check")
	public void userid_check(HttpServletRequest request, PrintWriter out)
	{
	    service.userid_check(request, out);
	}
	
	@RequestMapping("/member/member_input_ok")
	public String member_input_ok(MemberVo mvo)
	{
		return service.member_input_ok(mvo);
	}
	
	@RequestMapping("/member/member_view")
	public String member_view(HttpSession session,Model model)
	{
		return service.member_view(session,model);
	}
	
	@RequestMapping("/member/member_edit")
	public String member_edit(HttpSession session, Model model)
	{
		return service.member_edit(session,model);
	}
	
	@RequestMapping("/member/member_edit_ok")
	public String member_edit_ok(HttpSession session,MemberVo mvo)
	{
		return service.member_edit_ok(session,mvo);
	}
	
	@RequestMapping("/member/out")
	public String out(HttpSession session)
	{
		return service.out(session);
	}
	
	
}
