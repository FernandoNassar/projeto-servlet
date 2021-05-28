package servlets;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import util.Util;


@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		if(Util.isAutenticated(session)) {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("/templates/dashboard.jsp");
			requestDispatcher.forward(request, response);
			
		} else {
			response.sendRedirect("login");
		}
		
	}


}
