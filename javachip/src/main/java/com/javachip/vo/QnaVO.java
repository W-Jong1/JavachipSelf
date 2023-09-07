package com.javachip.vo;

public class QnaVO {
	private int qNo;
	private String qTitle;
	private String qContents;
	private String qAnswer;
	private int uNo;
	private String qDate;
	private String qAnswerDate;
	private String qType;
	private int pNo;
	
	private int qlevel;
	private int originqno;
	private String delYN;
	private String secretYN;
	
	private String uName;
	private String pName;
	private String uStatus;
	
	// getter
	public int getqNo() {
		return qNo;
	}
	public String getqTitle() {
		return qTitle;
	}
	public String getqContents() {
		return qContents;
	}
	public String getqAnswer() {
		return qAnswer;
	}
	public int getuNo() {
		return uNo;
	}
	public String getqDate() {
		return qDate;
	}
	public String getqAnswerDate() {
		return qAnswerDate;
	}
	public String getqType() {
		return qType;
	}
	public int getpNo() {
		return pNo;
	}
	public int getQlevel() {
		return qlevel;
	}
	public int getOriginqno() {
		return originqno;
	}
	public String getDelYN() {
		return delYN;
	}
	public String getSecretYN() {
		return secretYN;
	}
	public String getuName() {
		return uName;
	}
	public String getpName() {
		return pName;
	}
	
	public String getuStatus() {
		return uStatus;
	}
	// setter
	public void setqNo(int qNo) {
		this.qNo = qNo;
	}
	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}
	public void setqContents(String qContents) {
		this.qContents = qContents;
	}
	public void setqAnswer(String qAnswer) {
		this.qAnswer = qAnswer;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	public void setqDate(String qDate) {
		this.qDate = qDate;
	}
	public void setqAnswerDate(String qAnswerDate) {
		this.qAnswerDate = qAnswerDate;
	}
	public void setqType(String qType) {
		this.qType = qType;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public void setQlevel(int qlevel) {
		this.qlevel = qlevel;
	}
	public void setOriginqno(int originqno) {
		this.originqno = originqno;
	}
	public void setDelYN(String delYN) {
		this.delYN = delYN;
	}
	public void setSecretYN(String secretYN) {
		this.secretYN = secretYN;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public void setuStatus(String uStatus) {
		this.uStatus = uStatus;
	}
	// toString
	@Override
	public String toString() {
		return "QnaVO [qNo=" + qNo + ", qTitle=" + qTitle + ", qContents=" + qContents + ", qAnswer=" + qAnswer
				+ ", uNo=" + uNo + ", qDate=" + qDate + ", qAnswerDate=" + qAnswerDate + ", qType=" + qType + ", pNo="
				+ pNo + ", qlevel=" + qlevel + ", originqno=" + originqno + ", delYN=" + delYN + ", secretYN="
				+ secretYN + ", uName=" + uName + ", pName=" + pName + ", uStatus=" + uStatus + "]";
	}
	
}
