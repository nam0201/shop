package kr.co.myshop.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.myshop.mapper.CustomMapper;
import kr.co.myshop.vo.CustomVo;
import kr.co.myshop.vo.MtmVo;
@Qualifier("cs")
@Service
public class CustomServiceImlp implements CustomService {
	@Autowired
	private CustomMapper mapper;

	@Override
	public String mtm_ok(MtmVo mvo, HttpSession session) {
		String userid=session.getAttribute("userid").toString();
		mvo.setUserid(userid);
		mapper.mtm_ok(mvo);
		return "/custom/mtm_ok";
	}

	@Override
	public String custom_ok(CustomVo cvo, HttpSession session) {
		String userid=session.getAttribute("userid").toString();
		cvo.setUserid(userid);
		mapper.custom_ok(cvo);
		return "/custom/custom_ok";
	}
	


}
