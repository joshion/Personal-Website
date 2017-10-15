package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Operator.Database;

/**
 * Servlet implementation class SignInServlet
 */
@WebServlet("/SignInServlet")
public class SignInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignInServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    response.setContentType("text/html;charset=utf-8");
	    response.setCharacterEncoding("UTF-8");
		response.getWriter().append("Served at:你好 ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    // doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		String IDentity = (String) request.getParameter("IDentity");
		String password = (String) request.getParameter("password");
		
		Database database = new Database();
		String userName = database.login(IDentity, password);
		if(!userName.isEmpty())
		{
		    request.getSession().setAttribute("userName", userName);
	        request.getSession().setAttribute("IDentity", IDentity);
		    request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		else
		{
		    request.getSession().setAttribute("message", "Don't exit userName Or Wrong password!");
		    request.getRequestDispatcher("login.jsp").forward(request, response);
		    // response.sendRedirect("login.jsp");ֵ
		}
	}

}


