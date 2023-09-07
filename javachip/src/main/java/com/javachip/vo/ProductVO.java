package com.javachip.vo;

public class ProductVO {
	private int pNo;
	private String pType;
	private String pName;
	private int pPrice;
	private int pInput;
	private int pOutput;
	private int pStock;
	private String pDate;
	private String pNote;
	private String pDetail;
	private int aNo;		//pattach 기본키
	private String aOriginName;	//pattach 추가로 받을 원본파일명
	private String aChangeName; //pattach 추가로 받을 바뀐파일명
	private String delYN;
	
	@Override
	public String toString() {
		return "ProductVO [pNo=" + pNo + ", pType=" + pType + ", pName=" + pName + ", pPrice=" + pPrice + ", pInput="
				+ pInput + ", pOutput=" + pOutput + ", pStock=" + pStock + ", pDate=" + pDate + ", pNote=" + pNote
				+ ", pDetail=" + pDetail + "]";
	}
	
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public String getpType() {
		return pType;
	}
	public void setpType(String pType) {
		this.pType = pType;
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
	public int getpInput() {
		return pInput;
	}
	public void setpInput(int pInput) {
		this.pInput = pInput;
	}
	public int getpOutput() {
		return pOutput;
	}
	public void setpOutput(int pOutput) {
		this.pOutput = pOutput;
	}
	public int getpStock() {
		return pStock;
	}
	public void setpStock(int pStock) {
		this.pStock = pStock;
	}
	public String getpDate() {
		return pDate;
	}
	public void setpDate(String pDate) {
		this.pDate = pDate;
	}

	public String getpNote() {
		return pNote;
	}

	public void setpNote(String pNote) {
		this.pNote = pNote;
	}

	public String getpDetail() {
		return pDetail;
	}

	public void setpDetail(String pDetail) {
		this.pDetail = pDetail;
	}

	public int getaNo() {
		return aNo;
	}

	public void setaNo(int aNo) {
		this.aNo = aNo;
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

	public String getDelYN() {
		return delYN;
	}

	public void setDelYN(String delYN) {
		this.delYN = delYN;
	}
	
	
	
}
