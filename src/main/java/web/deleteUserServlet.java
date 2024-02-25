package web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import metier.UserImpl;
import metier.UserModel;

/**
 * Servlet implementation class deleteUserServlet
 */
@WebServlet("/deleteUserServlet")
public class deleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		HttpSession session = request.getSession();
		UserModel userModel = null;
		if(session.getAttribute("users") != null) {
			userModel = (UserModel) session.getAttribute("users");
		}else {
			response.sendRedirect("addUser.jsp");
		}
		
		UserImpl userImpl = new UserImpl();
		userImpl.setList(userModel.getList());
		userImpl.removeUser(id);
		userModel.setList(userImpl.getList());
		response.sendRedirect("UserServlet");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
