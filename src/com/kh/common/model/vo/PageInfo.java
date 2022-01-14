package com.kh.common.model.vo;

public class PageInfo {
	

	private	int listCount; //헌재 일반게시판 게시글 총 갯수. => Board로 부터 count(*) but, status = 'Y'
	private int currentPage; //현재 페이지 => request.getParameter("currentPage");
	private int pageLimit;  //페이지 하단에 보여질 페이지 바에 페이지 최대갯수
	private int boardLimit; // 한페이지에 보여질 게시물리스트
	
	
	private	int maxPage; //가장 마지막 페이지가 몇번 페이지인지 (= 총 페이지 갯수)
	private int startPage; //페이지 하단에 보여질 페이징 바에 시작 수 
	private int endPage; //페이지 하단에 보여질 페이징 바에 끝수
	public PageInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PageInfo(int listCount, int currentPage, int pageLimit, int boardLimit, int maxPage, int startPage,
			int endPage) {
		super();
		this.listCount = listCount;
		this.currentPage = currentPage;
		this.pageLimit = pageLimit;
		this.boardLimit = boardLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}
	public int getListCount() {
		return listCount;
	}
	public void setListCount(int listCount) {
		this.listCount = listCount;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageLimit() {
		return pageLimit;
	}
	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}
	public int getBoardLimit() {
		return boardLimit;
	}
	public void setBoardLimit(int boardLimit) {
		this.boardLimit = boardLimit;
	}
	public int getMaxPage() {
		return maxPage;
	}
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
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
	@Override
	public String toString() {
		return "PageInfo [listCount=" + listCount + ", currentPage=" + currentPage + ", pageLimit=" + pageLimit
				+ ", boardLimit=" + boardLimit + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage="
				+ endPage + "]";
	}
	

}
