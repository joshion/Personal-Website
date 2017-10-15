package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Operator.Database;

/**
 * Servlet implementation class CheckUserNameServlet
 */
@WebServlet("/CheckUserNameServlet")
public class CheckUserNameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
	    Database database = new Database();
	    String userName = (String) request.getParameter("userName");
	    if (database.checkUserName(userName)) {
	        response.getWriter().write("<label class='message'>uerName has existed!</label><br/>&nbsp;");
	    }
	    else {
	        response.getWriter().write("<label class='info'>uerNamecould be used！</label><br/>&nbsp;");
	    }
	}

}
