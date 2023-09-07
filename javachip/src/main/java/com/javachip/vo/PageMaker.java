package com.javachip.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.stereotype.Component;

@Component
public class PageMaker {

	private int displayPageNum = 10;    // 페이지 목록에 나열할 페이지 번호 갯수	
	private int startPage;			// 페이지 목록에 시작번호	
	private int endPage;            //페이지 목록에 끝번호
	
	private int totalCount;          //전체 글 갯수
	private int seqNo;
	
	private boolean prev;     //이전버튼 값 (true/false)
	private boolean next;	//다음버튼 값
	
	private SearchVO searchVO;   //페이지값이 들어있는 객체
	
	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public int getStartPage() {
		return startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	
	public int getSeqNo() {
		return seqNo;
	}

	public SearchVO getSearchVO() {
		return searchVO;
	}
	
	public void setDisplayPageNum(int diplayPageNum) {
		this.displayPageNum = diplayPageNum;
	}


	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();   
	}

	public void setSeqNo(int seqNo) {
		this.seqNo = seqNo;
	}

	//전체 글갯수를 가지고와서  시작페이지 번호와 끝페이지 번호 및 이전 다음버튼 생성시 필요한 메소드
	private void calcData() {
		//처음 10번으로 세팅	
		endPage = (int)(Math.ceil(searchVO.getPage()/(double)displayPageNum) * displayPageNum);
		//처음 1번으로 셋팅 
		startPage = (endPage-displayPageNum)+1;   
		
		//실제 갯수에 따른 페이지의  endPage를 뽑는다
		int tempEndPage = (int)(Math.ceil(totalCount/(double)searchVO.getPerPageNum()));
		//10개로 정의한 endPage가 실제 페이지 번호보다 크다면 실제번호페이지를 끝페이지로 쓴다 
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		// 이전페이지  여부
		prev = (startPage ==1 ? false : true);
		// 다음페이지 여부
		next = (endPage*searchVO.getPerPageNum() >= totalCount ? false :true);
		
		seqNo = totalCount - (searchVO.getPage()-1)*(searchVO.getPerPageNum());
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public void setSearchVO(SearchVO searchVO) {
		this.searchVO = searchVO;
	}

	// 인코딩
	public String encoding(String keyword) {
		String str = "";
		
	try {
		if(keyword != null ) {
			str = URLEncoder.encode(keyword, "UTF-8");
		}
	} catch (UnsupportedEncodingException e) {		
		e.printStackTrace();
	}		
		return str;
	}
	

}
