package kr.co.myshop.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.myshop.vo.AcustomVo;
import kr.co.myshop.vo.AmtmVo;
import kr.co.myshop.vo.ProductVo;
import kr.co.myshop.vo.QnaVo;

public interface AdminService {
    public String admingumae(Model model);
    public String chgstate(HttpServletRequest request);
    public String adminqna(Model model);
    public String ansview_ok(QnaVo qvo, HttpSession session);
    public String adminmtm(Model model,HttpSession session);
    public String amtm(AmtmVo avo, HttpSession session);
    public String adminmember(Model model, HttpSession session);
    public String out_ok(HttpServletRequest request);
    public String adminproduct(HttpSession session, Model model,HttpServletRequest request);
    public String productUp(ProductVo pvo);
    public String changeimage(HttpServletRequest request) throws IOException;
    public String adminreview(Model model);
    public String reviewdel(HttpServletRequest request);
    public String admincustom(Model model,HttpSession session);
    public String acustom(AcustomVo avo,HttpSession session);
}