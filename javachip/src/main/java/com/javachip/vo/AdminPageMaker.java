package com.javachip.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.stereotype.Component;

@Component
public class AdminPageMaker 
{
		//어드민 페이지 메이커
		//하단에 페이지 네비게이션을 사용할때 필요한 변수들 모아놓은곳
		private int displayPageNum = 10;    // 페이지 목록에 나열할 페이지 번호 갯수
		private int startPage;			// 페이지 목록에 시작번호	
		private int endPage;            //페이지 목록에 끝번호
		
		private int totalCount;          //전체 글 갯수
		
		private boolean prev;     //이전버튼 값 (true/false)
		private boolean next;	//다음버튼 값
		
		private AdminSearchVO AdminSearchVO;   //페이지값이 들어있는 객체
		
		public int getDisplayPageNum() {
			return displayPageNum;
		}

		public void setDisplayPageNum(int diplayPageNum) {
			this.displayPageNum = diplayPageNum;
		}

		public int getStartPage() {
			return startPage;
		}

		public void setStartPage(int startPage) {
			this.startPage = startPage;
		}

		public int getEndPage() {
			return endPage;
		}

		public void setEndPage(int endPage) {
			this.endPage = endPage;
		}

		public int getTotalCount() {
			return totalCount;
		}

		public void setTotalCount(int totalCount) {
			this.totalCount = totalCount;
			calcData();   
		}
		
		public void setqTotalCount(int totalCount) {
			this.totalCount = totalCount;
			calcqData();   
		}
		public void setpTotalCount(int totalCount) {
			this.totalCount = totalCount;
			calcpData();   
		}
		public void setnTotalCount(int totalCount) {
			this.totalCount = totalCount;
			calcnData();   
		}

		//전체 글갯수를 가지고와서  시작페이지 번호와 끝페이지 번호 및 이전 다음버튼 생성시 필요한 메소드
		private void calcData() {
			//처음 10번으로 세팅
			endPage = (int)(Math.ceil(AdminSearchVO.getPage()/(double)displayPageNum) * displayPageNum);
			//처음1번으로 셋팅 
			startPage = (endPage-displayPageNum)+1;   
			
			//실제 갯수에 따른 페이지의  endPage를 뽑는다
			int tempEndPage = (int)(Math.ceil(totalCount/(double)AdminSearchVO.getPerPageNum()));
			
			//10개로 정의한 endPage가 실제 페이지 번호보다 크다면 실제번호페이지를 끝페이지로 쓴다 
			if (endPage > tempEndPage) {
				endPage = tempEndPage;
			}
			
			// 시작페이지가 1번이면 이전 번호는 필요없으니까 이전버튼 안보여준다 그래서 false값 
			prev = (startPage ==1 ? false : true);
			// 끝페이지의 총개수가 전체 개수보다 작으면 다음버튼은 안보여주고  전체갯수가 더 크면  다음버튼 보여준다 
			next = (endPage*AdminSearchVO.getPerPageNum() >= totalCount ? false :true);
			
		}
		private void calcqData() {
			//처음 10번으로 세팅
			endPage = (int)(Math.ceil(AdminSearchVO.getqPage()/(double)displayPageNum) * displayPageNum);
			//처음1번으로 셋팅 
			startPage = (endPage-displayPageNum)+1;   
			
			//실제 갯수에 따른 페이지의  endPage를 뽑는다
			int tempEndPage = (int)(Math.ceil(totalCount/(double)AdminSearchVO.getPerPageNum()));
			
			//10개로 정의한 endPage가 실제 페이지 번호보다 크다면 실제번호페이지를 끝페이지로 쓴다 
			if (endPage > tempEndPage) {
				endPage = tempEndPage;
			}
			
			// 시작페이지가 1번이면 이전 번호는 필요없으니까 이전버튼 안보여준다 그래서 false값 
			prev = (startPage ==1 ? false : true);
			// 끝페이지의 총개수가 전체 개수보다 작으면 다음버튼은 안보여주고  전체갯수가 더 크면  다음버튼 보여준다 
			next = (endPage*AdminSearchVO.getPerPageNum() >= totalCount ? false :true);
			
		}
		private void calcpData() {
			//처음 10번으로 세팅
			endPage = (int)(Math.ceil(AdminSearchVO.getpPage()/(double)displayPageNum) * displayPageNum);
			//처음1번으로 셋팅 
			startPage = (endPage-displayPageNum)+1;   
			
			//실제 갯수에 따른 페이지의  endPage를 뽑는다
			int tempEndPage = (int)(Math.ceil(totalCount/(double)AdminSearchVO.getPerPageNum()));
			
			//10개로 정의한 endPage가 실제 페이지 번호보다 크다면 실제번호페이지를 끝페이지로 쓴다 
			if (endPage > tempEndPage) {
				endPage = tempEndPage;
			}
			
			// 시작페이지가 1번이면 이전 번호는 필요없으니까 이전버튼 안보여준다 그래서 false값 
			prev = (startPage ==1 ? false : true);
			// 끝페이지의 총개수가 전체 개수보다 작으면 다음버튼은 안보여주고  전체갯수가 더 크면  다음버튼 보여준다 
			next = (endPage*AdminSearchVO.getPerPageNum() >= totalCount ? false :true);
			
		}
		private void calcnData() {
			//처음 10번으로 세팅
			endPage = (int)(Math.ceil(AdminSearchVO.getnPage()/(double)displayPageNum) * displayPageNum);
			//처음1번으로 셋팅 
			startPage = (endPage-displayPageNum)+1;   
			
			//실제 갯수에 따른 페이지의  endPage를 뽑는다
			int tempEndPage = (int)(Math.ceil(totalCount/(double)AdminSearchVO.getPerPageNum()));
			
			//10개로 정의한 endPage가 실제 페이지 번호보다 크다면 실제번호페이지를 끝페이지로 쓴다 
			if (endPage > tempEndPage) {
				endPage = tempEndPage;
			}
			
			// 시작페이지가 1번이면 이전 번호는 필요없으니까 이전버튼 안보여준다 그래서 false값 
			prev = (startPage ==1 ? false : true);
			// 끝페이지의 총개수가 전체 개수보다 작으면 다음버튼은 안보여주고  전체갯수가 더 크면  다음버튼 보여준다 
			next = (endPage*AdminSearchVO.getPerPageNum() >= totalCount ? false :true);
			
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

		public AdminSearchVO getAdminSearchVO() {
			return AdminSearchVO;
		}

		public void setAdminSearchVO(AdminSearchVO adminSearchVO) {
			AdminSearchVO = adminSearchVO;
		}
		
		public String encoding(String AdminSearchIdValue) {
			String str = "";
			
		try {
			if(AdminSearchIdValue != null ) {
				str = URLEncoder.encode(AdminSearchIdValue, "UTF-8");
			}
		} catch (UnsupportedEncodingException e) {		
			e.printStackTrace();
		}		
			return str;
		}
		
		public String encoding2(String searchValue) {
			String str = "";
			
		try {
			if(searchValue != null ) {
				str = URLEncoder.encode(searchValue, "UTF-8");
			}
		} catch (UnsupportedEncodingException e) {		
			e.printStackTrace();
		}		
			return str;
		}
}
