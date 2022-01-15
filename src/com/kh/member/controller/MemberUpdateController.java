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
 * Servlet implementation class MemberUpdateController
 */
@WebServlet("/update.me")
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		
		
		String memId = request.getParameter("memId");
		String memName = request.getParameter("memName");
		String idNum = request.getParameter("idNum");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String location = request.getParameter("location");
		String address = request.getParameter("address");
		

	
		Member m = new Member(memId, memName, idNum, email, phone, location, address);
		
		
	
		Member updateMem = new MemberService().updateMember(m);
		
		
		
		if(updateMem == null) { 
			
			request.setAttribute("errorMsg", "Successfully update the information");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		else { 
			
			HttpSession session = request.getSession();
			
			session.setAttribute("loginUser", updateMem); 
			session.setAttribute("alertMsg", "Sorry, Failed in update");

			response.sendRedirect(request.getContextPath() + "/myPage.me");
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
