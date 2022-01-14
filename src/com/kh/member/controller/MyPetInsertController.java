package com.kh.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.member.model.service.MemberService;
import com.kh.common.model.vo.Attachment;
import com.kh.member.model.vo.Member;
import com.kh.member.model.vo.Mypet;
import com.kh.member.model.vo.PetOwner;
import com.kh.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class MyPetInsertController
 */
@WebServlet("/myPetInsert.me")
public class MyPetInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPetInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// POST => 인코딩
		// 1) 인코딩
		request.setCharacterEncoding("UTF-8");

		// 먼저 견주테이블에 대한 INSERT
		HttpSession session = request.getSession();
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		String memNum = loginUser.getMemNum();
		
		PetOwner po = new MemberService().selectPetOwner(memNum);
		
		int result0 = 0;
		
		if(po == null) {
			
			result0 = new MemberService().insertPetOwner(memNum); // 주인임을 추가
		} else {
			result0 = 1;
		}
		
	
		
		// 5) 결과에 따른 응답뷰 지정
		if(result0 > 0) { // 성공 => Mypet.me 로 요청 (sendRedirect)
			
			// request.getSession().setAttribute("alertMsg", "성공적으로 업로드 되었습니다.");
			// response.sendRedirect(request.getContextPath() + "/myPet.me");
			request.getRequestDispatcher("views/mypet/myPetEnroll.jsp").forward(request, response);  //*
		}
		
		else { // 실패 => 에러페이지
			
			request.getSession().setAttribute("alertMsg", "Upload Failed");
			request.getRequestDispatcher("views/mypet/myPet.jsp").forward(request, response);
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
