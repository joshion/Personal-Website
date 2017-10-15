﻿package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Operator.Database;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
	    request.setCharacterEncoding("UTF-8");
	    String e_mail = (String) request.getParameter("e_mail");
	    String userName = (String) request.getParameter("userName");
	    String password = (String) request.getParameter("password");
	    
	    Database database = new Database();
	    if(database.register(e_mail, userName, password))
	    {
	        request.getSession().setAttribute("userName", userName);
	        request.getSession().setAttribute("e_mail", e_mail);
	        request.getRequestDispatcher("index.jsp").forward(request, response);
	    }
	    else
	    {
	        request.getSession().setAttribute("message", "The e_mail or userName has existed, please try others!");
	        request.getRequestDispatcher("register.jsp").forward(request, response);
	        // response.sendRedirect("register.jsp");
	    }
	}
}
