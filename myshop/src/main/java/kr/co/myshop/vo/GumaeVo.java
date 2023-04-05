package kr.co.myshop.vo;

public class GumaeVo {
	private int id,bae_id,su,juk,cprice,pay,bank,bank2,coopay,card,card2,gigan,gigan2,tong,gibonpay,state,hugi;
	private String userid,pcode,writeday,jumuncode;
	
	//cart애서 1개 이상의 수량이 올 수 있으므로 String 변수 생성
	String su2,privateprice;
	
	public String getPrivateprice() {
		return privateprice;
	}
	public void setPrivateprice(String privateprice) {
		this.privateprice = privateprice;
	}
	public String getSu2() {
		return su2;
	}
	public void setSu2(String su2) {
		this.su2 = su2;
	}
	public int getBank2() {
		return bank2;
	}
	public void setBank2(int bank2) {
		this.bank2 = bank2;
	}
	public int getCard2() {
		return card2;
	}
	public void setCard2(int card2) {
		this.card2 = card2;
	}
	public int getGigan2() {
		return gigan2;
	}
	public void setGigan2(int gigan2) {
		this.gigan2 = gigan2;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getBae_id() {
		return bae_id;
	}
	public void setBae_id(int bae_id) {
		this.bae_id = bae_id;
	}
	public int getSu() {
		return su;
	}
	public void setSu(int su) {
		this.su = su;
	}
	public int getJuk() {
		return juk;
	}
	public void setJuk(int juk) {
		this.juk = juk;
	}
	public int getCprice() {
		return cprice;
	}
	public void setCprice(int cprice) {
		this.cprice = cprice;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public int getBank() {
		return bank;
	}
	public void setBank(int bank) {
		this.bank = bank;
	}
	public int getCoopay() {
		return coopay;
	}
	public void setCoopay(int coopay) {
		this.coopay = coopay;
	}
	public int getCard() {
		return card;
	}
	public void setCard(int card) {
		this.card = card;
	}
	public int getGigan() {
		return gigan;
	}
	public void setGigan(int gigan) {
		this.gigan = gigan;
	}
	public int getTong() {
		return tong;
	}
	public void setTong(int tong) {
		this.tong = tong;
	}
	public int getGibonpay() {
		return gibonpay;
	}
	public void setGibonpay(int gibonpay) {
		this.gibonpay = gibonpay;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getHugi() {
		return hugi;
	}
	public void setHugi(int hugi) {
		this.hugi = hugi;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public String getWriteday() {
		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
	public String getJumuncode() {
		return jumuncode;
	}
	public void setJumuncode(String jumuncode) {
		this.jumuncode = jumuncode;
	} 

}
