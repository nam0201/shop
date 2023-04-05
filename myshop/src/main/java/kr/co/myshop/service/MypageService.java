package kr.co.myshop.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.myshop.vo.ReviewVo;

public interface MypageService {
	public String wishview(HttpSession session, Model model);
    public String wishdel(HttpServletRequest request);
    public String cart_add(HttpServletRequest request,HttpSession session);
    public String cartview(HttpSession session, Model model);
    public String cartdel(HttpServletRequest request);
    public void cart_su(HttpServletRequest request, PrintWriter out,HttpSession session);
    public String jumunview(HttpSession session, Model model);
    public String chgstate(HttpServletRequest request);
    public String review(HttpServletRequest requset,Model model);
    public String review_ok(ReviewVo rvo, HttpSession session);
}
