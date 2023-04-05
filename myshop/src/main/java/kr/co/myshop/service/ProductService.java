package kr.co.myshop.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.jws.WebParam.Mode;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.myshop.vo.BaesongVo;
import kr.co.myshop.vo.GumaeVo;
import kr.co.myshop.vo.MemberVo;
import kr.co.myshop.vo.ProductVo;
import kr.co.myshop.vo.QnaVo;

public interface ProductService {
	public String product(Model model);
	public void getJung(HttpServletRequest request, PrintWriter out);
    public void getSo(HttpServletRequest request, PrintWriter out);
    public void getCode(HttpServletRequest request,PrintWriter out);
    public String product_ok(HttpServletRequest request)throws IOException;
    public String plist(HttpServletRequest request, Model model);
    public String pcontent(HttpServletResponse response,HttpServletRequest request, Model model,HttpSession session);
    public void wish_add(HttpServletRequest request, HttpSession session, PrintWriter out);
    public void cart_add(HttpServletRequest request, HttpSession session, PrintWriter out);
    public String gumae(HttpServletRequest request, HttpSession session, Model model);
    public void member_phone(HttpServletRequest request, PrintWriter out, HttpSession session);
    public String baeview(HttpSession session, Model model); //배송지 확인
    public String jusoadd();
    public String jusoadd_ok(BaesongVo bvo, HttpSession session);
    public String baeup(HttpServletRequest request, Model model);
    public String baeup_ok(BaesongVo bvo,HttpSession session);
    public String baedel(HttpServletRequest request, HttpSession session);
    public String chgcla(HttpServletRequest request, Model model);
    public void chg_ok(HttpServletRequest request, PrintWriter out);
    public String gumae_ok(int id, GumaeVo gvo,HttpSession session);
    public String jumun(HttpServletRequest request, Model model);
    public String jumun2(HttpServletRequest request, Model model);
    public String munwrite(QnaVo qvo, HttpSession session);
}
