package kr.co.myshop.mapper;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.myshop.vo.BaesongVo;
import kr.co.myshop.vo.DaeVo;
import kr.co.myshop.vo.GumaeVo;
import kr.co.myshop.vo.JungVo;
import kr.co.myshop.vo.MemberVo;
import kr.co.myshop.vo.ProductVo;
import kr.co.myshop.vo.QnaVo;
import kr.co.myshop.vo.ReviewVo;
import kr.co.myshop.vo.SoVo;

public interface ProductMapper {
	//대분류 테이블 내용가져오기
     public ArrayList<DaeVo> getDae();
     public ArrayList<JungVo> getJung(String daecode);
     public ArrayList<SoVo> getSo(String daejung);
     public int getCode(String pcode);
     public void product_ok(ProductVo pvo);
     public ArrayList<ProductVo> plist(String pcode,int index);
     public int getChong(String pcode);
     public ProductVo pcontent(String pcode); //vo하나의 레코드를 저장할 수 있는 공간.
     public void wish_add(String pcode, String userid);
     public void wish_del(String pcode, String userid);
     public int getWish(String pcode, String userid);
     public void cart_add(String pcode, String su, String userid);
     public int cart_check(String pcode,String userid);
     public void cart_up(String su, String pcode,String userid);
     public MemberVo getMember(String userid);
     public BaesongVo getJuso(String userid);
     public void setBaesong(BaesongVo bvo);
     public void member_phone(String phone, String userid);
     public ArrayList<BaesongVo> baeview(String userid);
     public void jusoadd_ok(BaesongVo bvo);
     public BaesongVo baeup(String id);
     public void baeup_ok(BaesongVo bvo);
     public void gibon(String userid);  //기본의 value를 바꾸는 쿼리문등록
     public void baedel(String id);
     public void gibonchg(String userid);
     public void chg_ok(String cla, String id);
	public void gumae_ok(GumaeVo gvo);
    public int getJcode(String jumuncode);
     public GumaeVo getGumae(String jumuncode); //구매내역
     public ProductVo getProduct(String pcode);
    public BaesongVo getBaesong(int id);
    public ArrayList<HashMap<String,String>> getTotal(String jumuncode);
    public ArrayList<ReviewVo> getReview(String pcode);
    public int getGrp();
    public void munwrite(QnaVo qvo);
    public ArrayList<QnaVo> getQna(String pcode);
    public ProductVo getNow(String pcode);
    public void subjuk(int juk,String userid);
}
