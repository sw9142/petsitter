package com.kh.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.PageInfo;
import com.kh.notice.model.service.NoticeService;
import com.kh.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeListController
 */
@WebServlet("/list.no")
public class NoticeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//-----------페이징 처리--------------
		//필요한 변수들
		int listCount;//현재 일반게시판의 게시글 총 개수=>BOARD 로부터 조회 COUNT(*) 활용 (status='Y')
		int currentPage;//현재 페이지(즉, 사용자가 요쳥한 페이지)=>request.getParameter("currentPage")
		int pageLimit;//페이지 하단에 보여질 페이징바의 페이지 최대 개수=>
		int boardLimit;//한 페이지에 보여질 게시글 개수
		
		int maxPage;//가장 마지막 페이지가 몇 번 페이지인지(==총페이지개수)
		int startPage;//페이지 하단에 보여질 시작수
		int endPage; //페이지 하다넹 보여질 페이징바의 끝수
		
		listCount = new NoticeService().selectListCount();
		
	
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	
		pageLimit = 10;
		
	
		boardLimit = 10;
		
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
	
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit -1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
	
		//3) vo로 가공
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit,
									maxPage, startPage, endPage);
		
		//4) service로 토스
		//10개씩 board를 가져올 것 => ArrayList
		ArrayList<Notice> list = new NoticeService().selectNoticeList(pi);
		
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		
		//5)화면 띄우기
		request.getRequestDispatcher("views/notice/noticeList.jsp").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}