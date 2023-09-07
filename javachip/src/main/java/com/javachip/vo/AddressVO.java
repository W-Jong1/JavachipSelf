package com.javachip.vo;

public class AddressVO {
	public int addNo;
	public int uNo;
	public String aStatus;
	public String Addr1;
	public String Addr2;
	public String Addr3;
	public String aPhone;
	public String aMail;
	public String aComment;
	public String aName;
	
	public int getAddNo() {
		return addNo;
	}
	public void setAddNo(int addNo) {
		this.addNo = addNo;
	}
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	public String getaStatus() {
		return aStatus;
	}
	public void setaStatus(String aStatus) {
		this.aStatus = aStatus;
	}
	public String getAddr1() {
		return Addr1;
	}
	public void setAddr1(String addr1) {
		Addr1 = addr1;
	}
	public String getAddr2() {
		return Addr2;
	}
	public void setAddr2(String addr2) {
		Addr2 = addr2;
	}
	public String getAddr3() {
		return Addr3;
	}
	public void setAddr3(String addr3) {
		Addr3 = addr3;
	}
	public String getaPhone() {
		return aPhone;
	}
	public void setaPhone(String aPhone) {
		this.aPhone = aPhone;
	}
	public String getaMail() {
		return aMail;
	}
	public void setaMail(String aMail) {
		this.aMail = aMail;
	}
	public String getaComment() {
		return aComment;
	}
	public void setaComment(String aComment) {
		this.aComment = aComment;
	}
	public String getaName() {
		return aName;
	}
	public void setaName(String aName) {
		this.aName = aName;
	}
	@Override
	public String toString() {
		return "AddressVO [addNo=" + addNo + ", uNo=" + uNo + ", aStatus=" + aStatus + ", Addr1=" + Addr1
				+ ", Addr2=" + Addr2 + ", Addr3=" + Addr3 + ", aPhone=" + aPhone + ", aMail=" + aMail + ", aComment="
				+ aComment + ", aName=" + aName + "]";
	}
	
	
}
