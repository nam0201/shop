package kr.co.myshop.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import kr.co.myshop.vo.CartVo;
import kr.co.myshop.vo.ProductVo;
import kr.co.myshop.vo.ReviewVo;
import kr.co.myshop.vo.WishVo;

public interface MypageMapper {
	public ArrayList<WishVo> wishview(String userid);
    public void wishdel(String id);
    public void cart_add(String pcode,String userid);
    public ArrayList<CartVo> cartview(String userid);
    public void cartdel(String id);
    public int cart_check(String pcode, String userid);
    public void cart_up(String pcode, String userid);
    public void cart_su(String su,String pcode,String userid);
    public ArrayList<HashMap<String,String>> jumunview(String userid);
    public void chgstate(@Param("state") String state,@Param("id") String id);
    public ProductVo getProduct(String pcode);
    public ProductVo getProduct2(String guid);
    public void review_ok(ReviewVo rvo);
    public void setHugi(int guid);
    public int getStar(String pcode);
    public void setStar(int star,String pcode);


}
