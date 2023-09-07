package com.javachip.vo;

public class UserVO {
	private int uNo;
	private String uId;
	private String uPw;
	private String uName;
	private String uJoin;
	private String uRetire;
	private String uPhone;
	private String uStatus;
	private String uBisno;
	private String uBisName;
	private String uAdd1;
	private String uAdd2;
	private String uAdd3;
	private String uMail;
	private int uAlertNum;
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getuPw() {
		return uPw;
	}
	public void setuPw(String uPw) {
		this.uPw = uPw;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuJoin() {
		return uJoin;
	}
	public void setuJoin(String uJoin) {
		this.uJoin = uJoin;
	}
	public String getuRetire() {
		return uRetire;
	}
	public void setuRetire(String uRetire) {
		this.uRetire = uRetire;
	}
	public String getuPhone() {
		return uPhone;
	}
	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}
	public String getuStatus() {
		return uStatus;
	}
	public void setuStatus(String uStatus) {
		this.uStatus = uStatus;
	}
	public String getuBisno() {
		return uBisno;
	}
	public void setuBisno(String uBisno) {
		this.uBisno = uBisno;
	}
	public String getuBisName() {
		return uBisName;
	}
	public void setuBisName(String uBisName) {
		this.uBisName = uBisName;
	}
	public String getuAdd1() {
		return uAdd1;
	}
	public void setuAdd1(String uAdd1) {
		this.uAdd1 = uAdd1;
	}
	public String getuAdd2() {
		return uAdd2;
	}
	public void setuAdd2(String uAdd2) {
		this.uAdd2 = uAdd2;
	}
	public String getuAdd3() {
		return uAdd3;
	}
	public void setuAdd3(String uAdd3) {
		this.uAdd3 = uAdd3;
	}
	
	public String getuMail() {
		return uMail;
	}
	public void setuMail(String uMail) {
		this.uMail = uMail;
	}
	public int getuAlertNum() {
		return uAlertNum;
	}
	public void setuAlertNum(int uAlertNum) {
		this.uAlertNum = uAlertNum;
	}
	@Override
	public String toString() {
		return "UserVO [uNo=" + uNo + ", uId=" + uId + ", uPw=" + uPw + ", uName=" + uName + ", uJoin=" + uJoin
				+ ", uRetire=" + uRetire + ", uPhone=" + uPhone + ", uStatus=" + uStatus + ", uBisno=" + uBisno
				+ ", uBisName=" + uBisName + ", uAdd1=" + uAdd1 + ", uAdd2=" + uAdd2 + ", uAdd3=" + uAdd3 + ", uMail="
				+ uMail + ", uAlertNum=" + uAlertNum + "]";
	}
	
	
	
}
