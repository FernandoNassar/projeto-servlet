package servlets;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Playlist;
import models.Usuario;
import models.dao.PlaylistDAO;
import util.PlaylistUtil;
import util.Util;


@WebServlet("/playlist")
public class PlaylistServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private PlaylistDAO playlistDAO = new PlaylistDAO();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		if(Util.isAutenticated(session)) {
			
			if(request.getParameter("playlist_id") != null) {
				
				Playlist playlist = PlaylistUtil.findPlaylist(request, playlistDAO);
				session.setAttribute("playlist", playlist);
			
				switch(Util.getAction(request)) {
				case "editar":
					request.getRequestDispatcher("/templates/editar-lista.jsp").forward(request, response);
					break;
					
				case "excluir":
					PlaylistUtil.deletePlaylist(request, playlistDAO);
					response.sendRedirect("dashboard");
					break;
					
				default:
					request.getRequestDispatcher("/templates/playlist.jsp").forward(request, response);}
															
			} else {response.sendRedirect("dashboard");}
				
		} else {response.sendRedirect("login");}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		if(Util.isAutenticated(session)) {
			
			Usuario usuario = (Usuario) session.getAttribute("usuarioAutenticado");
			
			if(request.getParameter("lista_id") != null) {
				Integer playlistId = Integer.valueOf(request.getParameter("lista_id").trim());
				PlaylistUtil.getParameters(request, playlistDAO.findById(playlistId).get());
				
			} else {
				Playlist playlist = playlistDAO.save(PlaylistUtil.getParameters(request, new Playlist()));			
				usuario.addPlaylist(playlist);
			}

			response.sendRedirect("dashboard");
				
		} else {response.sendRedirect("login");}		
	}
		

}
