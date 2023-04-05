package kr.co.myshop.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.myshop.mapper.ProductMapper;
import kr.co.myshop.vo.BaesongVo;
import kr.co.myshop.vo.GumaeVo;
import kr.co.myshop.vo.JungVo;
import kr.co.myshop.vo.MemberVo;
import kr.co.myshop.vo.ProductVo;
import kr.co.myshop.vo.QnaVo;
import kr.co.myshop.vo.ReviewVo;
import kr.co.myshop.vo.SoVo;

@Service
@Qualifier("ps")
public class ProductServiceImpl implements ProductService{
    
	@Autowired
	private ProductMapper mapper;
	
	@Override
	public String product(Model model)
	{//대분류 테이블을 읽어서 내용을 view에 전달
		model.addAttribute("dae", mapper.getDae());
		return "/product/product";
	}
	
	@Override
	public void getJung(HttpServletRequest request, PrintWriter out)
	{
		String daecode=request.getParameter("daecode");
		ArrayList<JungVo> jung=mapper.getJung(daecode);
		//중분류의 값을 이용하여 option태그를 생성
		String str="<option>"+URLEncoder.encode("중분류")+" </option>";
		for(int i=0;i<jung.size();i++)
		{	
			str=str+"<option value='"+jung.get(i).getCode()+"'> "+URLEncoder.encode(jung.get(i).getName())+" </option>";
		}
		//URLEncoder.encode(s) URLDecoder.decode(s)
		out.print(str);
	}
	
	@Override
	public void getSo(HttpServletRequest request, PrintWriter out) {
		String daejung=request.getParameter("daejung");
		ArrayList<SoVo> so=mapper.getSo(daejung);
		
		String str="<option> "+URLEncoder.encode("선택")+"</option>";
		
		for(int i=0;i<so.size();i++)
		{
			str=str+"<option value='"+so.get(i).getCode()+"'> "+URLEncoder.encode(so.get(i).getName())+" </option>";
		}
		
		out.print(str);
	}
	
	@Override
	public void getCode(HttpServletRequest request, PrintWriter out)
	{
		String pcode=request.getParameter("pcode");
		out.print(mapper.getCode(pcode));
	}
	
	@Override
	public String product_ok(HttpServletRequest request) throws IOException
	{
		String path=request.getRealPath("resources/pro");
		int size=1024*1024*10;
		MultipartRequest multi=new MultipartRequest(request,path,size,"utf-8",new DefaultFileRenamePolicy()); 
		
		String pcode=multi.getParameter("pcode");
		String pimg=multi.getFilesystemName("pimg");
		String cimg=multi.getFilesystemName("cimg");
		String title=multi.getParameter("title");
		int price=Integer.parseInt(multi.getParameter("price"));
		String made=multi.getParameter("made");
		int halin=Integer.parseInt(multi.getParameter("halin"));
		int juk=Integer.parseInt(multi.getParameter("juk"));
		int su=Integer.parseInt(multi.getParameter("su"));
		int baesong=Integer.parseInt(multi.getParameter("baesong"));
		int baeday=Integer.parseInt(multi.getParameter("baeday"));
		
		//vo로 이동하기 위한 객체 생성
		ProductVo pvo=new ProductVo();
		pvo.setPcode(pcode);
		pvo.setPimg(pimg);
		pvo.setCimg(cimg);
		pvo.setTitle(title);
		pvo.setPrice(price);
		pvo.setMade(made);
		pvo.setHalin(halin);
		pvo.setJuk(juk);
		pvo.setSu(su);
		pvo.setBaesong(baesong);
		pvo.setBaeday(baeday);
		
		mapper.product_ok(pvo);
		
		return "redirect:/product/product";
	}
	
	@Override
	public String plist(HttpServletRequest request, Model model)
	{
		String pcode=request.getParameter("pcode");
		
		//페이지값이 없을 경우..
		int page;
		if(request.getParameter("page")==null)
		{
			page=1;
		}
		else
		{
			page=Integer.parseInt(request.getParameter("page"));
		}
		int index=(page-1)*24;
		
		ArrayList<ProductVo> plist=mapper.plist(pcode,index);
		model.addAttribute("plist", plist);
		
		//pstart,pend,chong,page값을 view에 전달
		int pstart=page/10;
		if(page%10==0)
			pstart--;
		pstart=pstart*10+1;
		int pend=pstart+9;
		
		int chong=mapper.getChong(pcode); //mapper를 통해 날라옴.
		
		if(pend>chong)
			pend=chong;
		
		model.addAttribute("pstart", pstart); //jsp로 보내기
		model.addAttribute("pend", pend);
		model.addAttribute("chong", chong);
		model.addAttribute("page", page);
		model.addAttribute("pcode", pcode);
		
		return "/product/plist";
		
	}
	
	@Override
	public String pcontent(HttpServletResponse response, HttpServletRequest request, Model model, HttpSession session)
	{
		String pcode=request.getParameter("pcode");
		ProductVo pvo=mapper.pcontent(pcode);
		model.addAttribute("pvo", pvo);
		
		// 사용자로부터 쿠키를 읽어오는 작업
		Cookie[] cookie=request.getCookies();
		
		String imsi=null;
		//읽어온 쿠키중에서 작업할 쿠키변수 => pcode
		for(int i=0;i<cookie.length;i++)  // Cooke배열의 모든 값을 다 열람하겠다. getName(), getValue()
		{
			//getName()이 pcode인 쿠키의 getValue()
			if(cookie[i].getName().equals("pcode") )
			{	
			   imsi=cookie[i].getValue();  // 지금보는 상품을 제외한 이전에 본 상품만 존재
			   
			   // 현재 보는 상품의 pcode를 추가하여 저장
			   if(imsi.indexOf(pcode) == -1)  // 현재보는 상품이 imsi라는 문자열 변수에 존재하지 않는다면
			   {	   
			      imsi=imsi+pcode+"/";
			   }
			   
			   // 하나의 상품을 추가 했다면 imsi라는 문자열에 상품이 몇개?
			   int len=imsi.split("/").length;  // 배열의 길이.
			   if(len > 3 )  // 상품이 3개이상 => 4개
			   {
				   int n=imsi.indexOf("/"); 
				   imsi=imsi.substring(n+1);   // 기존의 상품 + 현재보는 상품으로 3개 이하의 상품코드를 가진다..
			   }
			   
			   // 변경된 imsi를 쿠키변수 pcode에 저장
			   Cookie cookie2=new Cookie("pcode",imsi); //(변수명, 값);
			   cookie2.setMaxAge(600);  //시간 지정 초단위로 적기
			   response.addCookie(cookie2);
			}
	    }
		if(imsi==null)  // pcode값이 없다면 현재 상품만 추가하여 쿠키변수에 저장
		{
			imsi=pcode+"/"; //현재 상품을 imsi라는 변수에 저장
			Cookie cookie2=new Cookie("pcode",imsi);
			cookie2.setMaxAge(600);
			response.addCookie(cookie2);
		}
		//System.out.println(imsi);
		
		//imsi라는 문자열에 있는 pcode를 이용하여 해당 그림파일의 이름을 가져와서 view에 전달
		String[] pcode2=imsi.split("/"); 
		ArrayList<ProductVo> plist2=new ArrayList<ProductVo>();
		for(int i=0;i<pcode2.length;i++)
		{
			ProductVo pvo2=mapper.getNow(pcode2[i]);
			plist2.add(pvo2);
		}
		model.addAttribute("plist2", plist2);   // 쿠키변수에 있는 상품코드를 이용하여 그림파일명, 상품코드를 view에 전달..
		
		//해당 상품의 review테이블의 내용을 읽어 뷰에 전달
		ArrayList<ReviewVo> rlist=mapper.getReview(pcode);  // review
		//content에 줄바꿈문자를 br로 replace
		for(int i=0;i<rlist.size();i++)
		{
			String content=rlist.get(i).getContent().replace("\r\n","<br>");
		    rlist.get(i).setContent(content);;
		}
		model.addAttribute("rlist", rlist);
		
		//문의하기qna테이블의 내용읽어오기
		ArrayList<QnaVo> qlist=mapper.getQna(pcode); //바꿀 꺼 있으면 이단계에서 바꾸기 예)연도같은거 2023/3/4
		for(int i=0;i<qlist.size();i++) //list는 무조건 for문
		//현재 사용자의 아이디로 현재 상품이 wish테이블에 존재여부를 확인.=>하트빨간색
		{
			//.0을 지우기
			int len=qlist.get(i).getWriteday().length(); //길이
			String writeday=qlist.get(i).getWriteday().substring(0,len-2); //.0을제거
			writeday.replace("-", "/");
			qlist.get(i).setWriteday(writeday);
			
			//content의 \r\n=><br>
			String content=qlist.get(i).getContent().replace("\r\n", "<br>");
			qlist.get(i).setContent(content);
		}
		model.addAttribute("qlist", qlist);
		//현재사용자 아이디로 위시저장
	    if(session.getAttribute("userid")!=null)
		{
			String userid=session.getAttribute("userid").toString();
			int wcnt=mapper.getWish(pcode,userid);
			  
			model.addAttribute("wcnt", wcnt);
			
		}
		return "/product/pcontent";
		
	}

	@Override
	public void wish_add(HttpServletRequest request, HttpSession session, PrintWriter out) {
		String pcode=request.getParameter("pcode");
		String userid=session.getAttribute("userid").toString();
		int ck=Integer.parseInt(request.getParameter("ck"));
		
		if(ck==1)
		{
			try 
			{	
			   mapper.wish_del(pcode,userid);
			   out.print("0");
			}
			catch(Exception e)
			{
				out.print("1");
			}
		}
		else
		{
			try 
			{	
			   mapper.wish_add(pcode,userid);
			   out.print("0");
			}
			catch(Exception e)
			{
				out.print("1");
			}
		}
		
	}

	@Override
	public void cart_add(HttpServletRequest request, HttpSession session, PrintWriter out) {
		String pcode=request.getParameter("pcode");
		String su=request.getParameter("su");
		
		if(session.getAttribute("userid")!=null)
		{	
		    String userid=session.getAttribute("userid").toString();
            try
            {
            	int cnt=mapper.cart_check(pcode,userid);
            	
            	if(cnt==1)
            	{
            		mapper.cart_up(su,pcode,userid);
            	}
            	else
            	{
            	  mapper.cart_add(pcode,su,userid);
            	}
            	
            	out.print("0");
            }
            catch(Exception e)
            {
            	out.print("1");
            }
		    
		}
		
	}

	@Override
	public String gumae(HttpServletRequest request, HttpSession session, Model model) {
		//구매자정보, 배송지정보, 배송관련,결제정보
		//구매자정보전달
		String userid=session.getAttribute("userid").toString();
		MemberVo mvo=mapper.getMember(userid);
		model.addAttribute("mvo", mvo);
		
		//배송지 정보: baesong테이블에서 gibon필드가 1인 정보를 읽어와서 전달..
		BaesongVo bvo=mapper.getJuso(userid);
		if(bvo==null)
		{
			//null이면 member테이블의 주소를 baesong테이블에 추가
			BaesongVo bvo2=new BaesongVo();
			bvo2.setName(mvo.getName());
			bvo2.setPhone(mvo.getPhone());
			bvo2.setZip(mvo.getZip());
			bvo2.setJuso(mvo.getJuso());
			bvo2.setJuso_etc(mvo.getJuso_etc());
			bvo2.setUserid(userid);
			
			mapper.setBaesong(bvo2);
			
			model.addAttribute("bvo", bvo2);
		}
		else
		{
			model.addAttribute("bvo", bvo);
		}
		
		//상품정보를 전달
		//p01010001,p01010002
		String[] pcode=request.getParameter("pcode").split(",");
		String[] su=request.getParameter("su").split(",");
		
		ArrayList<ProductVo> plist=new ArrayList<ProductVo>();
		int pprice=0;   //총상품가격
		int pbae=0;     //총배송비
		int payprice=0; //결제금액
		String privateprice="";  
		for(int i=0;i<pcode.length;i++)
		{
			ProductVo pvo=mapper.pcontent(pcode[i]);
			//pvo에 구입수량을 setter
			pvo.setSu(Integer.parseInt(su[i]));
			plist.add(pvo);
			
			//총상품가격
			int imsi=( pvo.getPrice()-(int)(pvo.getPrice()*(pvo.getHalin())/100.0 ))*pvo.getSu();
			pprice=pprice+imsi;
			int imsi2=pvo.getBaesong();
			pbae=pbae+imsi2;
			
			privateprice=privateprice+(imsi+imsi2)+",";   //120000, 250000, 12600,
		    
		}
		System.out.println(privateprice);
		payprice=pprice+pbae;
		
		model.addAttribute("pprice", pprice);
		model.addAttribute("pbae", pbae);
		model.addAttribute("payprice", payprice);
		model.addAttribute("privateprice", privateprice);
		model.addAttribute("plist", plist);
		model.addAttribute("pcode", request.getParameter("pcode"));
		model.addAttribute("su", request.getParameter("su"));
		/*
		String pcode=request.getParameter("pcode");  
		int su=Integer.parseInt(request.getParameter("su")); //사용자가 구매할 갯수
		ProductVo pvo=mapper.pcontent(pcode);
		pvo.setSu(su);//전달
		
	    model.addAttribute("pcode", pcode); //gumae_ok에서 gumae 테이블 저장용
		model.addAttribute("pvo", pvo);
	    */
	    LocalDateTime today=LocalDateTime.now();
	    LocalDateTime xday=today.plusDays(1);
	    int y=xday.getYear();
	    int m=xday.getMonthValue();
	    int d=xday.getDayOfMonth();
	    int h=xday.getHour();
	    int mm=xday.getMinute();
	    int s=xday.getSecond();
	    String gihan=y+"년"+m+"월"+d+"일"+h+"시"+mm+"분"+s+"초";
	    model.addAttribute("gihan", gihan);
	    
	    return "/product/gumae";
	}

	@Override
	public void member_phone(HttpServletRequest request, PrintWriter out, HttpSession session) {
		
		try
		{
		    String phone=request.getParameter("phone");
		    String userid=session.getAttribute("userid").toString();
		
		    mapper.member_phone(phone,userid);
		    out.print("0");
		}
		catch(Exception e)
		{
			out.print("1");
		}
	}

	@Override
	public String baeview(HttpSession session, Model model) {
		
		String userid=session.getAttribute("userid").toString();
		
		model.addAttribute("blist", mapper.baeview(userid));
		
		return "/product/baeview";
	}

	@Override
	public String jusoadd() {
		return "/product/jusoadd";
	}

	@Override
	public String jusoadd_ok(BaesongVo bvo, HttpSession session) {
		String userid=session.getAttribute("userid").toString();
		bvo.setUserid(userid);
		
		if(bvo.getGibon()==1) //추가되는 주소가 기본배송지가 된다면
		{
			//기존의 주소에서 gibon의 값을 0으로 변경..
			mapper.gibon(userid);
		}
		mapper.jusoadd_ok(bvo);
		
		return "redirect:/product/baeview";
	}

	@Override
	public String baeup(HttpServletRequest request, Model model) {
		String id=request.getParameter("id");
		BaesongVo bvo=mapper.baeup(id);
		
		model.addAttribute("bvo", bvo);
		return "/product/baeup";
	}

	@Override
	public String baeup_ok(BaesongVo bvo, HttpSession session) {
		String userid=session.getAttribute("userid").toString();
		if(bvo.getGibon()==1) //추가되는 주소가 기본배송지가 된다면
		{
		   mapper.gibon(userid);
		}
		  mapper.baeup_ok(bvo);
		  return "redirect:/product/baeview";
	}

	@Override
	public String baedel(HttpServletRequest request, HttpSession session) {
		String id=request.getParameter("id");
		int chk=Integer.parseInt(request.getParameter("chk"));
		
		// 배송지 삭제
		mapper.baedel(id);
		
		//기본 배송지일 경우 다른주소를 기본배송지로 선정.
		if(chk==1)
		{
			String userid=session.getAttribute("userid").toString();
			mapper.gibonchg(userid);
		}
		return "redirect:/product/baeview";
	}

	@Override
	public String chgcla(HttpServletRequest request, Model model) {
		String id=request.getParameter("id");
		String cla=request.getParameter("cla");
		model.addAttribute("id", id);
		model.addAttribute("cla", cla);
		return "/product/chgcla";
	}

	@Override
	public void chg_ok(HttpServletRequest request, PrintWriter out) {
		String id=request.getParameter("id");
		String cla=request.getParameter("cla");
		
		try
		{
			mapper.chg_ok(cla,id);
			out.print("0");
		}
		catch(Exception e)
		{
			out.print("1");
		}
		
	}

	@Override
	public String gumae_ok(int id, GumaeVo gvo, HttpSession session) {
		
		gvo.setBae_id(id);  //배송테이블의 id값을 전달
		
		//주문코드를 생성
		// j년 월일
		LocalDate today=LocalDate.now();
		int y=today.getYear();
		int m=today.getMonthValue();
		String mm=m+"";
		if(mm.length()==1)
			mm="0"+mm;
		
		
		int d=today.getDayOfMonth();
		String dd=d+"";
		if(dd.length()==1)
			dd="0"+dd;
		String jumuncode="j"+y+mm+dd;
		
		int num=mapper.getJcode(jumuncode);
		
		String code=String.format("%04d", num);
		
		jumuncode=jumuncode+code;
		//System.out.println(jumuncode);
		gvo.setJumuncode(jumuncode);
		String userid=session.getAttribute("userid").toString();
		gvo.setUserid(userid);
		
		String[] pcode=gvo.getPcode().split(",");
		String[] su=gvo.getSu2().split(",");
		String[] privaterprice=gvo.getPrivateprice().split(",");  //vo=>cprice
				
		for(int i=0;i<pcode.length;i++)
		{
			//vo의 값을 배열에 있는 값으로 변경 뒤 저장
			gvo.setPcode(pcode[i]);
            gvo.setSu(Integer.parseInt(su[i]) );
            gvo.setCprice( Integer.parseInt(privaterprice[i]));
			mapper.gumae_ok(gvo);
		}
		
	
		return "redirect:/product/jumun?jumuncode="+jumuncode;
	}

	@Override
	public String jumun(HttpServletRequest request, Model model) {
		
		// gumae테이블 읽기
		String jumuncode=request.getParameter("jumuncode");
		GumaeVo gvo=mapper.getGumae(jumuncode);
		//product테이블 읽기
		ProductVo pvo=mapper.getProduct(gvo.getPcode());
		//baesong테이블 읽기
		BaesongVo bvo=mapper.getBaesong(gvo.getBae_id());
		
		model.addAttribute("gvo", gvo);
		model.addAttribute("pvo", pvo);
		model.addAttribute("bvo", bvo);
		return "/product/jumun";
	}

	@Override
	public String jumun2(HttpServletRequest request, Model model) {
		String jumuncode=request.getParameter("jumuncode");
		ArrayList<HashMap<String,String>> tmap=mapper.getTotal(jumuncode);
		model.addAttribute("tmap", tmap);
		
		int totalcprice=0;  //총결제금액
		int totalbaesong=0; //총배송비
		int totalprice=0;   //총 상품금액
		 //총상품가격 , 총배송비 , 총결제금액
		for(int i=0;i<tmap.size();i++)
		{
			// map.get(key) 가져온 값은 String이지만
			// String.valueOf(map.get(key)) 를 통해서 변경 후 사용
			
			int imsi=Integer.parseInt( String.valueOf(tmap.get(i).get("price") ) );   //상품원래가격
			int halin=Integer.parseInt( String.valueOf(tmap.get(i).get("halin") ) );  //할인율
			halin=(int)(imsi* (halin/100.0) );  //계산된 할인금액
			
			System.out.println(imsi+" : "+halin);
        	int su=Integer.parseInt( String.valueOf( tmap.get(i).get("su")));
        	totalprice=totalprice+(imsi-halin)*su;   // 상품금액
			
        	totalbaesong=totalbaesong+ Integer.parseInt( String.valueOf(  tmap.get(i).get("baesong") )); // 상품배송비
        	totalcprice=totalcprice+ Integer.parseInt( String.valueOf( tmap.get(i).get("cprice") ));  // 결제금액
        }
		
		model.addAttribute("totalprice", totalprice);
		model.addAttribute("totalbaesong", totalbaesong);
		model.addAttribute("totalcprice",totalcprice);
		
		return "/product/jumun";
	}

	@Override
	public String munwrite(QnaVo qvo, HttpSession session) {
		String userid=session.getAttribute("userid").toString();
		qvo.setUserid(userid);
		
		// grp값 구하기
		int grp=mapper.getGrp();
		qvo.setGrp(grp);
		
		mapper.munwrite(qvo);
		return "redirect:/product/pcontent?pcode="+qvo.getPcode();
	}
	
	

	
}

