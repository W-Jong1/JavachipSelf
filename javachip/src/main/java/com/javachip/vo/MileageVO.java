package com.javachip.vo;

public class MileageVO {
	private int mno;
	private int uNo;
	private int mPlus;
	private int mMinus;
	private String mNote;
	private String mDate;
	
	@Override
	public String toString() {
		return "MileageVO [mno=" + mno + ", uNo=" + uNo + ", mPlus=" + mPlus + ", mMinus=" + mMinus + ", mNote=" + mNote
				+ ", mDate=" + mDate + "]";
	}
	
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	public int getmPlus() {
		return mPlus;
	}
	public void setmPlus(int mPlus) {
		this.mPlus = mPlus;
	}
	public int getmMinus() {
		return mMinus;
	}
	public void setmMinus(int mMinus) {
		this.mMinus = mMinus;
	}
	public String getmNote() {
		return mNote;
	}
	public void setmNote(String mNote) {
		this.mNote = mNote;
	}
	public String getmDate() {
		return mDate;
	}
	public void setmDate(String mDate) {
		this.mDate = mDate;
	}
}
