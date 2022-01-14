package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdatePwdController
 */
@WebServlet("/updatePwd.me")
public class MemberUpdatePwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdatePwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
		request.setCharacterEncoding("UTF-8");
		
		
		String memId = request.getParameter("memId");
		String memPwd = request.getParameter("memPwd");
		String updatePwd = request.getParameter("updatePwd");

		Member updateMem = new MemberService().updatePwdMember(memId, memPwd, updatePwd);
		
	
		
		HttpSession session = request.getSession();
		
		if(updateMem == null) { 
			session.setAttribute("alertMsg", "ë¹„ë°€ë²ˆí˜¸ ë³€ê²½ì—� ì‹¤íŒ¨í–ˆìŠµë‹ˆë‹¤.");
		}
		else { 
			session.setAttribute("alertMsg", "ì„±ê³µì �ìœ¼ë¡œ ë¹„ë°€ë²ˆí˜¸ê°€ ë³€ê²½ë�˜ì—ˆìŠµë‹ˆë‹¤.");
			session.setAttribute("loginUser", updateMem);
		}
		
	
		response.sendRedirect(request.getContextPath() + "/myPage.me");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
