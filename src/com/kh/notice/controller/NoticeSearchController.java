package com.kh.notice.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.DateParse;
import com.kh.common.model.vo.PageInfo;
import com.kh.notice.model.service.NoticeService;
import com.kh.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeSearch
 */
@WebServlet("/search.no")
public class NoticeSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 //1) 인코딩
		request.setCharacterEncoding("UTF-8");
//-----------페이징 처리--------------
	//필요한 변수들
	int listCount;//현재 일반게시판의 게시글 총 개수=>BOARD 로부터 조회 COUNT(*) 활용 (status='Y')
	int currentPage;//현재 페이지(즉, 사용자가 요쳥한 페이지)=>request.getParameter("currentPage")
	int pageLimit;//페이지 하단에 보여질 페이징바의 페이지 최대 개수=>
	int boardLimit;//한 페이지에 보여질 게시글 개수
	
	int maxPage;//가장 마지막 페이지가 몇 번 페이지인지(==총페이지개수)
	int startPage;//페이지 하단에 보여질 시작수
	int endPage; //페이지 하다넹 보여질 페이징바의 끝수
	
	//2) 값뽑기
			String date1 = request.getParameter("noStartDate");
			String noEndDate = request.getParameter("noEndDate");
			Date date2 = (Date) new DateParse().noEndDate(noEndDate);
			
			String keyword = request.getParameter("keyword");
	//*currentPage: 현재페이지(==사용자가 요청한 페이지)
	currentPage = Integer.parseInt(request.getParameter("currentPage"));
	
	//*pageLimit: 페이징바의 페이지 최대 개수
	pageLimit = 10;
	
	//*boardLimit: 한 페이지에 보여질 게시글의 최대 개수
	boardLimit = 10;
	
	//* listCount: 총 개시글 개수-먼저 보내서 총 개수를 파악해온다.
	listCount = new NoticeService().NoticeSerachListCount(currentPage,pageLimit, boardLimit,date1,date2,keyword);
	
	
	
	maxPage = (int)Math.ceil((double)listCount / boardLimit);
	
	
	startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
	
	
	endPage = startPage + pageLimit -1;
	//startPage가 11이어서 endpage 가 20이 되어야 하는데 
	//maxPage가 마침 13까지밖에 없다면?
	// => endPage 를 maxPage 로 변경
	if(endPage > maxPage) {
		endPage = maxPage;
	}
	
			
	//3) vo로 가공
	PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit,
								maxPage, startPage, endPage);		
	 
		
	 //3)vo
		
	 //4) 서비스단으로 토스
		ArrayList<Notice> list = new NoticeService().noticeSearch(date1, date2, keyword,pi);
	//5) 출력
		
		
		if(list.isEmpty()) {
			request.getSession().setAttribute("alertMsg","No data found");
			response.sendRedirect(request.getContextPath()+"/list.no?currentPage=1");
		}
		else {
			String date3 = String.valueOf(date2);
			request.setAttribute("noStartDate", date1);
			request.setAttribute("noEndDate", date3);
			request.setAttribute("keyword", keyword);
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			request.getRequestDispatcher("/views/notice/noticeSearch.jsp").forward(request, response);
		}
		
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}