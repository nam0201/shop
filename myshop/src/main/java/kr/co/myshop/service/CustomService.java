package kr.co.myshop.service;

import javax.servlet.http.HttpSession;

import kr.co.myshop.vo.CustomVo;
import kr.co.myshop.vo.MtmVo;

public interface CustomService {
    public String mtm_ok(MtmVo mvo, HttpSession session);
    public String custom_ok(CustomVo cvo, HttpSession session);
}

 
