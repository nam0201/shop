package kr.co.myshop.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.myshop.mapper.LoginMapper;
import kr.co.myshop.vo.MemberVo;

@Service
@Qualifier("ls")
public class LoginServiceImpl implements LoginService{

	@Autowired
	private LoginMapper mapper;

	@Override
	public String login_ok(MemberVo mvo,HttpSession session) {
		MemberVo mvo2=mapper.login_ok(mvo);
		// 회원이 맞으면 세션변수를 할당
		if(mvo2==null)
		{
			return "redirect:/login/login?chk=1";
		}
		else
		{
			/* 정상회원,탈퇴신청중회원,탈퇴회원에 따라 다르게 처리할떄
			 * xml에서 where 문에 state=0을 제외해야한다.
			 * if(mvo2.getState()==0
			 * {
			 *    session.setAttribute("userid",mvo2.getUserid());
			 *    session.setAttribute("name",mvo2.getName();
			 *    return "redirect:/main/main"; 
			 * 
			 * }
			 * else if(mvo2.getState()==1)
			 * {
			 * else if(mvo2.getState()==2)
			 * {
			 *   return "재가입페이지로 이동";
			    }
			 */
		
			// 세션변수
			session.setAttribute("userid", mvo2.getUserid());
			session.setAttribute("name", mvo2.getName());
			return "redirect:/main/main";
		}
		 
	}

	@Override
	public String login(HttpServletRequest request, Model model) {
		String chk=request.getParameter("chk");
		model.addAttribute("chk",chk);
		return "/login/login";
	}

	@Override
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main/main";
	}

	@Override
	public void userid_search(HttpServletRequest request, PrintWriter out) {
		 String name=request.getParameter("name");
		 String email=request.getParameter("email");
		 String userid=mapper.userid_search(name,email);
		 if(userid==null)
		 {
			 out.print("1");
		 }
		 else
		 {
			 out.print(userid);
		 }
	}
	
	@Override
	public void pwd_search(HttpServletRequest request, PrintWriter out) {
		 String name=request.getParameter("name");
		 String email=request.getParameter("email");
		 String userid=request.getParameter("userid");
		 String pwd=mapper.pwd_search(name,email,userid);
		 if(pwd==null)
		 {
			 out.print("1");
		 }
		 else
		 {
			 out.print(pwd);
		 }
	}
	
	
}