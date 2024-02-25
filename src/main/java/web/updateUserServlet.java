package web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import metier.User;
import metier.UserImpl;
import metier.UserModel;

/**
 * Servlet implementation class updateUserServlet
 */
@WebServlet("/updateUserServlet")
public class updateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
		User user = userImpl.getUserById(id);
		session.setAttribute("updated_user", user);
		request.getRequestDispatcher("updateUser.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String name = request.getParameter("name");
		int age =Integer.parseInt(request.getParameter("age"));
		int id =Integer.parseInt(request.getParameter("id"));
		
		User user = new User(id,name,age);
		
		UserModel userModel = null;
		if(session.getAttribute("users") != null) {
			userModel = (UserModel) session.getAttribute("users");
		}else {
			response.sendRedirect("addUser.jsp");
		}
		
		UserImpl userImpl = new UserImpl();
		userImpl.setList(userModel.getList());
		userImpl.updateUser(user);
		
		//UserModel userModel = new UserModel();
		userModel.clearListById(user.getId());
		
		userModel.setList(userImpl.getList());
		session.setAttribute("users", userModel);
		request.getRequestDispatcher("UserServlet").forward(request, response);
	}

}
