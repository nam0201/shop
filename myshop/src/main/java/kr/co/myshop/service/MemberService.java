package kr.co.myshop.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.myshop.vo.MemberVo;

public interface MemberService {
	public void userid_check(HttpServletRequest request, PrintWriter out);
    public String member_input_ok(MemberVo mvo);
    public String member_view(HttpSession session, Model model);
    public String member_edit(HttpSession session, Model model);
    public String member_edit_ok(HttpSession session,MemberVo mvo);
    public String out(HttpSession session);
}
