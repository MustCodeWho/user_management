package web;

import java.io.IOException;
import java.io.PrintWriter;

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
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	
	UserImpl userImpl;
	
	@Override
		public void init() throws ServletException {
			userImpl = new UserImpl();
		}
	@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			// TODO Auto-generated method stub
			req.getRequestDispatcher("Home.jsp").forward(req, resp);
		}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String name = request.getParameter("name");
		int age =Integer.parseInt(request.getParameter("age"));
		int id =Integer.parseInt(request.getParameter("id"));
		
		User user = new User(id,name,age);
		userImpl.addUser(user);
		

		UserModel userModel = new UserModel();
		
		userModel.setList(userImpl.getList());
		
		session.setAttribute("users", userModel);
		request.getRequestDispatcher("Home.jsp").forward(request, response);
		
		
	}

}
