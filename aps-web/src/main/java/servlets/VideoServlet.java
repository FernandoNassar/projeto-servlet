package servlets;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Playlist;
import models.Video;
import models.dao.PlaylistDAO;
import models.dao.VideoDAO;
import util.Util;
import util.VideoUtil;

@WebServlet("/video")
public class VideoServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private PlaylistDAO playlistDAO = new PlaylistDAO();
	private VideoDAO videoDAO = new VideoDAO();
	
		@Override
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			if(Util.isAutenticated(request.getSession())) {
				
				switch (Util.getAction(request)) {	
					
				case "excluir":
					Integer id = VideoUtil.excluirVideo(request, videoDAO);
					response.sendRedirect("playlist?playlist_id=" + id);
					break;
						
				default : response.sendRedirect("dashboard");}
				
			} else {response.sendRedirect("login");}
		}
		
		
		@Override
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			HttpSession session = request.getSession();
			
			if(Util.isAutenticated(session)) {
				Integer playlistId = Integer.valueOf(request.getParameter("playlist_id").trim());

				Video video = VideoUtil.getParameters(request, new Video());
				video = videoDAO.save(video);
				
				Playlist playlist = playlistDAO.findById(playlistId).get();
				playlist.addVideo(video);
				
				response.sendRedirect("playlist?playlist_id=" + playlistId);
			
			} else {response.sendRedirect("login");}	
		}

}
