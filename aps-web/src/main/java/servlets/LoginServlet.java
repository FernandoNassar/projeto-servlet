package servlets;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Usuario;
import models.dao.UsuarioDAO;
import util.LoginUtil;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/templates/form-login.jsp");
		requestDispatcher.forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Usuario usuario = LoginUtil.getParameters(request);
		UsuarioDAO usuarioDAO = new UsuarioDAO();
		
		if(LoginUtil.isAutentic(usuario, usuarioDAO)) {
			
			usuario = usuarioDAO.findByEmail(usuario.getEmail()).get();
			
			request.getSession().setAttribute("usuarioAutenticado", usuario);
			
			response.sendRedirect("dashboard");
		
		} else {response.sendRedirect("login");}
				
	}
	
		
}
