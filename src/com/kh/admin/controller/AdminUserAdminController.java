package com.kh.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.model.service.AdminService;
import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class AdminUserAdminController
 */
@WebServlet("/userAdmin.ad")
public class AdminUserAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUserAdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// ----------- 페이징 처리 -----------
		// 필요한 변수들
		int listCount; // 현재 일반게시판의 게시글 총 갯수 => BOARD 로 부터 조회 COUNT(*) 활용 (STATUS = 'Y')
		int currentPage; // 현재 페이지 (즉, 사용자가 요청한 페이지) => request.getParameter("currentPage");
		int pageLimit; // 페이지 하단에 보여질 페이징바의 페이지 최대 갯수 => 10 개로 고정
		int boardLimit; // 한 페이지에 보여질 게시글의 최대 갯수 => 10 개로 고정
		int maxPage; // 가장 마지막 페이지가 몇번 페이지인지 (== 총 페이지의 갯수)
		int startPage; // 페이지 하단에 보여질 페이징바의 시작수
		int endPage; // 페이지 하단에 보여질 페이징바의 끝수
		
		//------------------------------페이징 처리--------------------------------------------------------------------
		
		// * listCount : 총 게시글 갯수
		listCount = new AdminService().AdminUserSelectListCount();
				
		// * currrentPage : 현재페이지 (== 사용자가 요청한 페이지)
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		//String loginUser = request.getParameter("loginUser");
				
		// * pageLimit : 페이징바의 페이지 최대 갯수
		pageLimit = 10;
				
		// * boardLimit : 한 페이지에 보여질 게시글의 최대 갯수
		boardLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Member> list = new AdminService().adminUserSelect(pi);
	
		
		ArrayList<Member> blist = new AdminService().adminBlackListUserSelect();
		request.setAttribute("list", list);
		request.setAttribute("pi", pi); // 페이징바를 만들때 필요한 변수
		request.setAttribute("blist", blist);
	
		
		if(request.getSession().getAttribute("loginUser")!= null && ((Member)request.getSession().getAttribute("loginUser")).getMemId().equals("admin")) {
			
			request.getRequestDispatcher("views/admin/user/userAdmin.jsp").forward(request, response);
			
		}else {
			request.getSession().setAttribute("alertMsg", "It is only for admin");
			response.sendRedirect("/pet/");
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