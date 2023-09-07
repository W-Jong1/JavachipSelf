package com.javachip.vo;

public class PattachVO {
	private int aNo;
	private int pNo;
	private String aOriginName;
	private String aChangeName;
	
	@Override
	public String toString() {
		return "PattachVO [aNo=" + aNo + ", pNo=" + pNo + ", aOriginName=" + aOriginName + ", aChangeName="
				+ aChangeName + "]";
	}
	
	public int getaNo() {
		return aNo;
	}
	public void setaNo(int aNo) {
		this.aNo = aNo;
	}
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public String getaOriginName() {
		return aOriginName;
	}
	public void setaOriginName(String aOriginName) {
		this.aOriginName = aOriginName;
	}
	public String getaChangeName() {
		return aChangeName;
	}
	public void setaChangeName(String aChangeName) {
		this.aChangeName = aChangeName;
	}
}
