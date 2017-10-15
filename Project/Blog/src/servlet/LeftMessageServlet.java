package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Operator.Database;

/**
 * Servlet implementation class LeftMessageServlet
 */
@WebServlet("/LeftMessageServlet")
public class LeftMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LeftMessageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
		String e_mail = (String) request.getParameter("e_mail");
        String message = (String) request.getParameter("message");
		String strSigned = (String) request.getParameter("signed");
		boolean signed = false;
		if (strSigned.equals("true"))
		{
		    signed = true;
		}
		else if (strSigned.equals("false"))
		{
		    signed = false;
		}
        Database database = new Database();
        if (database.leftAMessage(e_mail, signed, message)) {
            response.getWriter().write("<label class='info'>Success！</label>");
        } else {
            response.getWriter().write("<label class='message'> failure！</label>");
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
