package com.javachip.vo;

public class CartVO {
	private int cNo;
	private int pNo;
	private int uNo;
	private int cCount;
	
	// 외래키
	private String pName;
	private int pPrice;
	private String aChangeName;
	
	@Override
	public String toString() {
		return "CartVO [cNo=" + cNo + ", pNo=" + pNo + ", uNo=" + uNo + ", cCount=" + cCount + ", pName=" + pName
				+ ", pPrice=" + pPrice + ", aChangeName=" + aChangeName + "]";
	}
	public int getcNo() {
		return cNo;
	}
	public void setcNo(int cNo) {
		this.cNo = cNo;
	}
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	public int getcCount() {
		return cCount;
	}
	public void setcCount(int cCount) {
		this.cCount = cCount;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public String getaChangeName() {
		return aChangeName;
	}
	public void setaChangeName(String aChangeName) {
		this.aChangeName = aChangeName;
	}
}
