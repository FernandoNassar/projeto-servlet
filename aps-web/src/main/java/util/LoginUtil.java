package util;

import java.util.Optional;

import jakarta.servlet.http.HttpServletRequest;
import models.Usuario;
import models.dao.UsuarioDAO;

public class LoginUtil {
	
	public static Usuario getParameters(HttpServletRequest request) {
		String email = (String) request.getParameter("usuarioEmail").trim();
		String senha = (String) request.getParameter("usuarioSenha").trim();
		return new Usuario(email, senha);
	}
	
	public static Boolean isAutentic(Usuario u2, UsuarioDAO dao) {
		return dao.findAll().stream()
				.filter(u1 -> u1.getEmail().equals(u2.getEmail())  && u1.getSenha().equals(u2.getSenha()))
				.findAny()
				.isPresent();	
	}
	
	public static Boolean isEmailAlreadyInUse(Usuario usuario, UsuarioDAO dao) {
		Optional<Usuario> op = dao.findAll().stream().filter(u -> u.getEmail().equals(usuario.getEmail())).findAny();
		
		if(op.isPresent()) {
			return true;
		}
		return false;
	}
	
}
