package util;

import jakarta.servlet.http.HttpServletRequest;
import models.Playlist;
import models.Usuario;
import models.dao.PlaylistDAO;

public class PlaylistUtil {
	
	public static Playlist getParameters(HttpServletRequest request, Playlist playlist) {
		playlist.setTitulo(request.getParameter("lista_titulo").trim());
		playlist.setDescricao(request.getParameter("lista_desc").trim());
		playlist.setEnderecoImagem(request.getParameter("lista_imagem").trim());
		
		return playlist;
	}
	
	public static void deletePlaylist(HttpServletRequest request, PlaylistDAO playlistDAO) {
		Integer id = Integer.valueOf(request.getParameter("playlist_id"));
		Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioAutenticado");
		int index = usuario.getPlaylists().indexOf(playlistDAO.findById(id).get());
		usuario.getPlaylists().remove(index);
		playlistDAO.deleteById(id);
	}
	
	public static Playlist findPlaylist(HttpServletRequest request, PlaylistDAO playlistDAO) {
		Integer id = Integer.valueOf(request.getParameter("playlist_id"));
		return playlistDAO.findById(id).get();
	}
	
}
