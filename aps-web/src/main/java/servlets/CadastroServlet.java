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


@WebServlet("/cadastrar")
public class CadastroServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private UsuarioDAO usuarioDAO = new UsuarioDAO();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/templates/form-cadastro.jsp");
		requestDispatcher.forward(request, response);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Usuario usuario = LoginUtil.getParameters(request);
		
		if(!LoginUtil.isEmailAlreadyInUse(usuario, usuarioDAO)) {
			
			usuario = usuarioDAO.save(usuario);
			
			request.getSession().setAttribute("usuarioAutenticado", usuario);
			
			response.sendRedirect("dashboard");
			
		} else {response.sendRedirect("cadastrar");}
		
	}
	
	
}
