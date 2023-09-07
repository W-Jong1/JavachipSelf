package com.javachip.vo;

public class RefundVO {
	private int refNo;
	private int oNo;
	private String refReason;
	private String refStatus;
	private String refDate;
	
	@Override
	public String toString() {
		return "RefundVO [refNo=" + refNo + ", oNo=" + oNo + ", refReason=" + refReason + ", refStatus=" + refStatus
				+ ", refDate=" + refDate + "]";
	}
	
	public int getRefNo() {
		return refNo;
	}
	public void setRefNo(int refNo) {
		this.refNo = refNo;
	}
	public int getoNo() {
		return oNo;
	}
	public void setoNo(int oNo) {
		this.oNo = oNo;
	}
	public String getRefReason() {
		return refReason;
	}
	public void setRefReason(String refReason) {
		this.refReason = refReason;
	}
	public String getRefStatus() {
		return refStatus;
	}
	public void setRefStatus(String refStatus) {
		this.refStatus = refStatus;
	}
	public String getRefDate() {
		return refDate;
	}
	public void setRefDate(String refDate) {
		this.refDate = refDate;
	}
}
