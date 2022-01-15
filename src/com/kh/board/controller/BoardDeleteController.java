package com.kh.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Board;

/**
 * Servlet implementation class BoardDeleteController
 */
@WebServlet("/delete.bo")
public class BoardDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardDeleteController() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String bno= request.getParameter("bno");
		
		Board b = new BoardService().selectBoard(bno); 
		
		int result = new BoardService().deleteBoard(bno, b.getPsNum());
		
		if(result > 0) {
			
			request.getSession().setAttribute("alertMsg", "Successfully Deleted!");
			response.sendRedirect(request.getContextPath()+"/list.bo?currentPage=1");
			
		}else {
			request.setAttribute("errorMeg", "Failed in deleting the board");
			request.getRequestDispatcher("views/common/errorPage.jsp");
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
