package kr.co.myshop.service;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.myshop.mapper.MypageMapper;
import kr.co.myshop.vo.CartVo;
import kr.co.myshop.vo.ProductVo;
import kr.co.myshop.vo.ReviewVo;
import kr.co.myshop.vo.WishVo;

@Service
@Qualifier("ms")
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	private MypageMapper mapper;

	@Override
	public String wishview(HttpSession session, Model model) {
		if(session.getAttribute("userid")==null)
		{
		    return "redirect:login/login";	
		}
		else
		{	
		   String userid=session.getAttribute("userid").toString();
		   /*ArrayList<WishVo> wlist=mapper.wishview(userid);
		   model.addAttribute("wlist", wlist);*/
		   model.addAttribute("wlist", mapper.wishview(userid));
		   return "/mypage/wishview";
		}   
	}

	/* 하나의 레코드 삭제
	@Override
	public String wishdel(HttpServletRequest request) {
		String id=request.getParameter("id");
		mapper.wishdel(id);
		return "redirect:/mypage/wishview";
	}
	*/
	
	public String wishdel(HttpServletRequest request) {
		String[] id=request.getParameter("id").split(",");
		for(int i=0; i<id.length;i++)
		{	
		   System.out.println(id[i]);
		   mapper.wishdel(id[i]);
		}   
		return "redirect:/mypage/wishview";
	}
	@Override
	public String cart_add(HttpServletRequest request, HttpSession session) {
		String pcode=request.getParameter("pcode");
		String userid=session.getAttribute("userid").toString();
		
		//pcode가 cart테이블에 존재하는가
		int cnt=mapper.cart_check(pcode,userid);
		if(cnt==1)
		{
			// su를 1증가
			mapper.cart_up(pcode, userid);
		}
		else
		{
			// insert
			mapper.cart_add(pcode, userid);
		}
	
		
		return "redirect:/mypage/wishview";
	}

	@Override
	public String cartview(HttpSession session, Model model) {
		if(session.getAttribute("userid")==null)
		{
		    return "redirect:login/login";	
		}
		else
		{	
		   String userid=session.getAttribute("userid").toString();
		   ArrayList<CartVo> clist=mapper.cartview(userid);
		   model.addAttribute("clist", clist);
		   
		   //상품가격, 할인율, 배송비=> 5000,6000,7000
		   String proprice="";
		   String prohalin="";
		   String probae="";
		   for(int i=0;i<clist.size();i++)
		   {
			   proprice=proprice+clist.get(i).getPrice()+",";
			   int imsi=(int)(clist.get(i).getPrice()*( clist.get(i).getHalin()/100.0));
			   prohalin=prohalin+imsi+",";
			   probae=probae+clist.get(i).getBaesong()+",";
		     
		   }
		   model.addAttribute("proprice",proprice);
		   model.addAttribute("prohalin",prohalin);
		   model.addAttribute("probae", probae);
		   return "/mypage/cartview";
		}   
	}

	@Override
	public String cartdel(HttpServletRequest request) {
		String[] id=request.getParameter("id").split(",");
		for(int i=0; i<id.length;i++)
		{	
		   System.out.println(id[i]);
		   mapper.cartdel(id[i]);
		}   
		return "redirect:/mypage/cartview";
	}

	@Override
	public void cart_su(HttpServletRequest request, PrintWriter out, HttpSession session) {
		String pcode=request.getParameter("pcode");
		String su=request.getParameter("su");
		String userid=session.getAttribute("userid").toString();
		
		try
		{
		mapper.cart_su(su,pcode,userid);
		out.print("0");
		}
		catch(Exception e)
		{
			out.print("1");
		}
		
	}

	@Override
	public String jumunview(HttpSession session, Model model) {
		String userid=session.getAttribute("userid").toString();
		model.addAttribute("tmap", mapper.jumunview(userid));
		
		return "/mypage/jumunview";
	}

	@Override
	public String chgstate(HttpServletRequest request) {
		String state=request.getParameter("state");
		String id=request.getParameter("id");
		mapper.chgstate(state,id);
		
		return "redirect:/mypage/jumunview";
	}

	@Override
	public String review(HttpServletRequest request, Model model) {
		String guid=request.getParameter("guid");
		ProductVo pvo=mapper.getProduct2(guid);
		model.addAttribute("pvo",pvo);
		model.addAttribute("guid",guid);
		return "/mypage/review";
	}
	/*
	@Override
	public String review(HttpServletRequest request, Model model) {
		String guid=request.getParameter("guid");
		String pcode=mapper.getPcode(guid);
		ProductVo pvo=mapper.getProduct(pcode);
		model.addAttribute("pvo",pvo);
		return null;
	}
	*/

	@Override
	public String review_ok(ReviewVo rvo, HttpSession session) {
		String userid=session.getAttribute("userid").toString();
		rvo.setUserid(userid);
		
		mapper.review_ok(rvo);
		
		// gumae테이블의 hugi필드의 값을  1로 변경 => 후기를 적었다
        // update gumae set hugi=1 where id=?	
		mapper.setHugi(rvo.getGuid()); 
		
		// review테이블에 현재상품의 평균 별점을 구한다 => product테이블의 star필드에 저장
		int star=mapper.getStar(rvo.getPcode());  // review테이블에서 
		mapper.setStar(star,rvo.getPcode());  // product테이블
		return "redirect:/mypage/jumunview"; 
	}

}
