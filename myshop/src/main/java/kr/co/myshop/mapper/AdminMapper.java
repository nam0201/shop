package kr.co.myshop.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.myshop.vo.AcustomVo;
import kr.co.myshop.vo.AmtmVo;
import kr.co.myshop.vo.CustomVo;
import kr.co.myshop.vo.MemberVo;
import kr.co.myshop.vo.MtmVo;
import kr.co.myshop.vo.ProductVo;
import kr.co.myshop.vo.QnaVo;
import kr.co.myshop.vo.ReviewVo;

public interface AdminMapper {
    public ArrayList<HashMap<String,String>> admingumae();
    public void chgstate(String state,String id);
    public ArrayList<QnaVo> adminqna();
    public String getTitle(String pcode);
    public void ansview_ok(QnaVo qvo);
    public ArrayList<MtmVo> adminmtm(); //하나이상들어갈지 하나면 vo
    public void amtm(AmtmVo avo);
    public void setState(String field, int id);
    public ArrayList<MemberVo> getMember();
    public void out_ok(String id);
    public ArrayList<ProductVo> getProduct(int index);
    public void productUp(ProductVo pvo);
    public int getChong();
    public void changeimage(String sql,String id);
    public ArrayList<ReviewVo> getReview();
    public void reviewdel(String id);
    public void acustom(AcustomVo avo);
    public ArrayList<CustomVo> admincustom();
    public void setJuk(int num,String userid);
    public void subJuk(int num,String userid);
}

