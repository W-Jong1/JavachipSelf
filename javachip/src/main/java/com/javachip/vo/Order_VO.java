package com.javachip.vo;

public class Order_VO {
	private int oNo;
	private int uNo;
	private int addNo;
	private int oTrackNo;
	private int oTotalPrice;
	private String oPay;
	private String oStatus;
	private String oDate;
	
	private String uId;
	private String pName;
	private String pPrice;
	private String aChangeName;
	private int oCount;
	
	@Override
	public String toString() {
		return "Order_VO [oNo=" + oNo + ", uNo=" + uNo + ", addNo=" + addNo + ", oTrackNo=" + oTrackNo
				+ ", oTotalPrice=" + oTotalPrice + ", oPay=" + oPay + ", oStatus=" + oStatus + ", oDate=" + oDate
				+ ", uId=" + uId + ", pName=" + pName + ", pPrice=" + pPrice + ", aChangeName=" + aChangeName
				+ ", oCount=" + oCount + "]";
	}
	public int getoNo() {
		return oNo;
	}
	public void setoNo(int oNo) {
		this.oNo = oNo;
	}
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
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
	public int getoTotalPrice() {
		return oTotalPrice;
	}
	public void setoTotalPrice(int oTotalPrice) {
		this.oTotalPrice = oTotalPrice;
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
	public String getoDate() {
		return oDate;
	}
	public void setoDate(String oDate) {
		this.oDate = oDate;
	}
	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
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
	public String getaChangeName() {
		return aChangeName;
	}
	public void setaChangeName(String aChangeName) {
		this.aChangeName = aChangeName;
	}
	public int getoCount() {
		return oCount;
	}
	public void setoCount(int oCount) {
		this.oCount = oCount;
	}
	
	
}
