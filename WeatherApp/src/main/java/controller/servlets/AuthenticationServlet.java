package controller.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.SQLRepositorium;
import util.UserAccount;

/**
 * This Servlet provides authentication: doPost method allows to log in and
 * doGet method to log out
 */
@WebServlet(urlPatterns = "/AuthenticationServlet", name = "AuthenticationServlet")
public class AuthenticationServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String login = request.getParameter("login");
		char[] password = request.getParameter("pass").toCharArray();
		UserAccount user = SQLRepositorium.authenticateUser(login, password);

		HttpSession session = request.getSession();

		if (user == null) {
			request.setAttribute("error", "Wrong login or password!");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		} else {
			session.setAttribute("user", user);
			request.setAttribute("role", user.getRole().toString());
			session.setMaxInactiveInterval(60 * 5);
			request.getRequestDispatcher("/pages/moderator/logged_index.jsp").forward(request, response);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

}
