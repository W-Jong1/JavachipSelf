package com.javachip.vo;

public class Order_DetailVO {
	private int dNo;
	private int oNo;
	private int pNo;
	private int dCount;
	
	// 외래키 값
	private String pName;
	private String pPrice;
	
	private int uNo;
	private int addNo;
	private String oPay;
	private int oTrackNo;
	private String oDate;
	private String oStatus;
	private String aChangeName;
	private String oCount;
	
	@Override
	public String toString() {
		return "Order_DetailVO [dNo=" + dNo + ", oNo=" + oNo + ", pNo=" + pNo + ", dCount=" + dCount + ", pName="
				+ pName + ", pPrice=" + pPrice + ", uNo=" + uNo + ", addNo=" + addNo + ", oPay=" + oPay + ", oTrackNo="
				+ oTrackNo + ", oDate=" + oDate + ", oStatus=" + oStatus + ", aChangeName=" + aChangeName + ", oCount="
				+ oCount + "]";
	}
	
	public int getdNo() {
		return dNo;
	}
	public void setdNo(int dNo) {
		this.dNo = dNo;
	}
	public int getoNo() {
		return oNo;
	}
	public void setoNo(int oNo) {
		this.oNo = oNo;
	}
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public int getdCount() {
		return dCount;
	}
	public void setdCount(int dCount) {
		this.dCount = dCount;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpPrice() {
		return pPrice;
	}
	public void setpPrice(String pPrice) {
		this.pPrice = pPrice;
	}

	public int getAddNo() {
		return addNo;
	}

	public void setAddNo(int addNo) {
		this.addNo = addNo;
	}

	public int getoTrackNo() {
		return oTrackNo;
	}

	public void setoTrackNo(int oTrackNo) {
		this.oTrackNo = oTrackNo;
	}

	public String getoDate() {
		return oDate;
	}

	public void setoDate(String oDate) {
		this.oDate = oDate;
	}

	public int getuNo() {
		return uNo;
	}

	public void setuNo(int uNo) {
		this.uNo = uNo;
	}

	public String getoPay() {
		return oPay;
	}

	public void setoPay(String oPay) {
		this.oPay = oPay;
	}

	public String getoStatus() {
		return oStatus;
	}

	public void setoStatus(String oStatus) {
		this.oStatus = oStatus;
	}

	public String getaChangeName() {
		return aChangeName;
	}

	public void setaChangeName(String aChangeName) {
		this.aChangeName = aChangeName;
	}

	public String getoCount() {
		return oCount;
	}

	public void setoCount(String oCount) {
		this.oCount = oCount;
	}
}
