package util;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class Util {
	
	public static String urlFormatter(String s) {		
		String[] splittedS = s.split("v=");
		splittedS[1].trim();
		return "https://www.youtube.com/embed/" + splittedS[1];
	}
	
	public static Boolean isAutenticated(HttpSession session) {
		return session.getAttribute("usuarioAutenticado") != null;
	}
	
	public static String getAction(HttpServletRequest request) {
		
		if(request.getParameter("action")!=null && request.getParameter("action").equals("editar")) {
			return "editar";	
		} 
		
		if(request.getParameter("action")!=null && request.getParameter("action").equals("excluir")) {
			return "excluir";		
		} 
	
		return "";
		
	
	}
	
}
