package kr.co.myshop.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.myshop.mapper.AdminMapper;
import kr.co.myshop.vo.AcustomVo;
import kr.co.myshop.vo.AmtmVo;
import kr.co.myshop.vo.CustomVo;
import kr.co.myshop.vo.MemberVo;
import kr.co.myshop.vo.MtmVo;
import kr.co.myshop.vo.ProductVo;
import kr.co.myshop.vo.QnaVo;
import kr.co.myshop.vo.ReviewVo;
@Service
@Qualifier("as")
public class AdminServiceImpl implements AdminService {
   
	@Autowired
	private AdminMapper mapper;

	@Override
	public String admingumae(Model model) {
		ArrayList<HashMap<String,String>> glist=mapper.admingumae();
		model.addAttribute("glist",glist);
		return "/admin/admingumae";
	}

	@Override
	public String chgstate(HttpServletRequest request) {
		String id=request.getParameter("id");
		String state=request.getParameter("state");
		
		mapper.chgstate(state,id);
		
		//적립금을 계산해서 member.juk필드에 추가
		if(state.equals("3") || state.equals("9") || state.equals("7"))  //배송완료로 변경시 작업!
		{	
		  int price=Integer.parseInt(request.getParameter("price"));
		  int juk=Integer.parseInt(request.getParameter("juk"));
		  int su=Integer.parseInt(request.getParameter("su"));
		
		   int num=(int)(price*(juk/100.0));
		   num=num*su;
		   String userid=request.getParameter("userid");
		
		   if(state.equals("3"))
		     mapper.setJuk(num,userid); //적립금 값을 주는 것이므로
		   else
			   mapper.subJuk(num,userid);
		}
		return "redirect:/admin/admingumae";
	}

	@Override
	public String adminqna(Model model) {
		ArrayList<QnaVo> qlist=mapper.adminqna();
		
		//content의 줄바꿈 넣기
		for(int i=0;i<qlist.size();i++)
		{
			String content=qlist.get(i).getContent().replace("\r\n", "<br>");
			content=content.replace(")","]");
			content=content.replace("(","[");
			content=content.replace("'", "");
			qlist.get(i).setContent(content);
						
			int len=qlist.get(i).getWriteday().length();
			
			String writeday=qlist.get(i).getWriteday().substring(0,len-2);
		    qlist.get(i).setWriteday(writeday);
		    //vo로 넣어야 레코드별로 불러올 수 있음.
		    
		    String pcode=qlist.get(i).getPcode();
			String title=mapper.getTitle(pcode);
			qlist.get(i).setTitle(title);
			
		}
		model.addAttribute("qlist", qlist);
		return "/admin/adminqna";
	}

	@Override
	public String ansview_ok(QnaVo qvo, HttpSession session) {
		//String userid=session.getAttribute("userid").toString();
		String userid="admin";
		qvo.setUserid(userid);
		
		mapper.ansview_ok(qvo);
		return "redirect:/admin/adminqna";
	}

	@Override
	public String adminmtm(Model model, HttpSession session) {
		if(session.getAttribute("userid")==null)
		   return "redirect:/login/login";
		
		if(session.getAttribute("userid").equals("admin"))
		{
		   ArrayList<MtmVo> mlist=mapper.adminmtm();
		   model.addAttribute("mlist", mlist);
		   return "/admin/adminmtm";
		}
		else
		{
			return "redirect:/main/main";
		}
	}

	@Override
	public String amtm(AmtmVo avo, HttpSession session) {
		String userid=session.getAttribute("userid").toString();
		avo.setUserid(userid);
		
		mapper.amtm(avo);
		
		// mtm테이블의 state필드의 값을 1로 변경하기
		mapper.setState("mtm",avo.getMid());  
		
		return "redirect:/admin/adminmtm";
	}

	@Override
	public String adminmember(Model model, HttpSession session) {
		if(session.getAttribute("userid")==null)
			return "redirect:/login/login";
		
		if(session.getAttribute("userid").equals("admin"))
		{
			ArrayList<MemberVo> mlist=mapper.getMember();
			
			// juso에서 빈칸 앞에 부분만 juso에 다시 설정
			for(int i=0;i<mlist.size();i++)
			{
				int num=mlist.get(i).getJuso().indexOf(" "); //빈칸의 인덱스
				String juso=mlist.get(i).getJuso().substring(0,num);
				mlist.get(i).setJuso(juso);
			}
			model.addAttribute("mlist", mlist);
			return "/admin/adminmember";
			
		}
		else
		{
			return "redirect:/main/main";
		}
	}

	@Override
	public String out_ok(HttpServletRequest request) {
		String id=request.getParameter("id");
		mapper.out_ok(id);
		return "redirect:/admin/adminmember";
	}

	@Override
	public String adminproduct(HttpSession session, Model model,HttpServletRequest request) {
		if(session.getAttribute("userid")==null)
			return "redirect:/login/login";
		
		if(session.getAttribute("userid").equals("admin"))
		{
		    // 페이지 관련
		    // 1. limit에 사용될 해당 페이지의 시작 인덱스
		    
		    int page;
		    if(request.getParameter("page")==null)
		    {
		    	page=1;
		    }
		    else
		    {
		    	page=Integer.parseInt(request.getParameter("page"));
		    }
		    int index=(page-1)*20;
		    
		    //pstart,pend,chong
		    int pstart,pend,chong;
		    
		    pstart=page/10;
		    if(page%10==0)
		    	pstart=pstart-1;
		    
		    pstart=pstart*10+1;
		    pend=pstart+9;
		    
		    chong=mapper.getChong();
		    
		    if(pend>chong)
		    	pend=chong;
		    
		    model.addAttribute("page", page);
		    model.addAttribute("pstart", pstart);
		    model.addAttribute("pend", pend);
		    model.addAttribute("chong", chong);
		    
		    ArrayList<ProductVo> plist=mapper.getProduct(index);
		    
			model.addAttribute("plist",plist);
			return "/admin/adminproduct";
		}
		else
		{
			return "redirect:/main/main";
		}
	}

	@Override
	public String productUp(ProductVo pvo) {
		mapper.productUp(pvo);
		
		return "redirect:/admin/adminproduct";
	}

	@Override
	public String changeimage(HttpServletRequest request) throws IOException  {
		
		String path=request.getRealPath("resources/pro");
		int size=1024*1024*10;
		MultipartRequest multi=new MultipartRequest(request,path,size,"utf-8",new DefaultFileRenamePolicy());
		
		//delpimg,delcimg => length() : 0 => 삭제x, length() !=0 => 삭제함
		//input type=file : null이면 변경할 필요가 없다!!, null이 아니면 변경 => update 처리를 해야한다..
		//System.out.println("a:"+multi.getParameter("delpimg").length());
		//System.out.println("a:"+multi.getParameter("delcimg"));
		//System.out.println("b:"+multi.getFilesystemName("pimg"));
		//System.out.println("b:"+multi.getFilesystemName("cimg"));
		String delpimg=multi.getParameter("delpimg");
		String delcimg=multi.getParameter("delcimg");
		String pimg=multi.getFilesystemName("pimg");
		String cimg=multi.getFilesystemName("cimg");
		String id=multi.getParameter("id");
		String sql="";
		if(pimg==null && cimg==null)
		{
			//실행할게 없습니다!!
		}
		else if(pimg==null && cimg!=null)
		{
		     sql="set cimg='"+cimg+"' ";
		     mapper.changeimage(sql,id);
		     
		     File file=new File(path+"/"+delcimg);
		     if(file.exists())
		    	 file.delete();
		}
		else if(pimg!=null && cimg==null)
		{
			sql="set pimg='"+pimg+"' ";
			mapper.changeimage(sql,id);
			File file=new File(path+"/"+delpimg);
		     if(file.exists())
		    	 file.delete();
		}
		else
		{
			sql="set cimg='"+cimg+"',pimg='"+pimg+"' ";
			mapper.changeimage(sql,id);
			File file=new File(path+"/"+delpimg);
		     if(file.exists())
		    	 file.delete();
		     file=new File(path+"/"+delcimg);
		     if(file.exists())
		    	 file.delete();
		}
		System.out.println(sql);
		
		/*
		if( !(pimg==null && cimg==null) )
		{
		   mapper.changeimage(sql,id);
		}
		*/
		
		return "redirect:/admin/adminproduct";
	}

	@Override
	public String adminreview(Model model) {
		 
		ArrayList<ReviewVo> rlist=mapper.getReview();
		
		// content내용에 br태그 넣기
		for(int i=0;i<rlist.size();i++)
		{
		    String content=rlist.get(i).getContent().replace("\r\n", "<br>");
		    rlist.get(i).setContent(content);
		}	
		
		model.addAttribute("rlist",rlist);
		return "/admin/adminreview";
	}

	@Override
	public String reviewdel(HttpServletRequest request) {
		String id=request.getParameter("id");
		mapper.reviewdel(id);
		return "redirect:/admin/adminreview";
	}

	@Override
	public String acustom(AcustomVo avo, HttpSession session) {
		String userid=session.getAttribute("userid").toString();
		avo.setUserid(userid);
		
		mapper.acustom(avo);
		
		// mtm테이블의 state필드의 값을 1로 변경하기
		mapper.setState("custom",avo.getCid());  
		
		return "redirect:/admin/admincustom";
	}

	@Override
	public String admincustom(Model model, HttpSession session) {
		if(session.getAttribute("userid")==null)
			   return "redirect:/login/login";
			
			if(session.getAttribute("userid").equals("admin"))
			{
			   ArrayList<CustomVo> clist=mapper.admincustom();
			   model.addAttribute("clist", clist);
			   return "/admin/admincustom";
			}
			else
			{
				return "redirect:/main/main";
			}
	}
	
	
}
