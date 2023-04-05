package kr.co.myshop.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.myshop.mapper.MemberMapper;
import kr.co.myshop.vo.MemberVo;

@Service
@Qualifier("ms")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper mapper;
	@Override
	public void userid_check(HttpServletRequest request, PrintWriter out) {
		// 입력한 사용자 아이디가 테이블에 존재하는 여부의 값을 전달
		// count()를 통해 아이디가 존재 : 1 , 없으면 0 => out객체를 통해 자바스크립트에 전달
		String userid=request.getParameter("userid");
		out.print( mapper.userid_check(userid) );
	}
	
	@Override
	public String member_input_ok(MemberVo mvo) {
		mapper.member_input_ok(mvo);
		return "redirect:/login/login?chk=2";
	}
	
	@Override
	public String member_view(HttpSession session, Model model) {
		String userid=session.getAttribute("userid").toString();
		model.addAttribute("mvo",mapper.member_view(userid));
		return "/member/member_view";
	}
	
	@Override
	public String member_edit(HttpSession session, Model model)
	{
		String userid=session.getAttribute("userid").toString();
		model.addAttribute("mvo",mapper.member_edit(userid));
		
		return "/member/member_edit";
	}
	
	@Override
	public String member_edit_ok(HttpSession session,MemberVo mvo)
	{
		String userid=session.getAttribute("userid").toString();
		mvo.setUserid(userid);
		mapper.member_edit_ok(mvo);
		return "redirect:/member/member_view";
	}

	@Override
	public String out(HttpSession session) {
		String userid=session.getAttribute("userid").toString();
		mapper.out(userid);
		
		session.invalidate();
		
		return "redirect:/main/main";
	}
	
	
}
