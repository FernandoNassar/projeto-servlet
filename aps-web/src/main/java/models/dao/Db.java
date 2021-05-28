package models.dao;

import java.util.LinkedList;
import java.util.List;

import models.Playlist;
import models.Usuario;
import models.Video;

public class Db {
	private static Integer countUsuarios = 1, countPlaylists = 1, countVideos = 1;
	private static List<Usuario> usuarios = new LinkedList<Usuario>();
	private static List<Playlist> playlists = new LinkedList<Playlist>();
	private static List<Video> videos = new LinkedList<Video>();

	public Db() {}
	
	public static Usuario save(Usuario usuario) {
		usuario.setId(countUsuarios);
		usuarios.add(usuario);
		countUsuarios++;
		return usuario;
	}
	
	public static Playlist save(Playlist playlist) {
		playlist.setId(countPlaylists);
		playlists.add(playlist);
		countPlaylists++;
		return playlist;
	}
	
	public static Video save(Video video) {
		video.setId(countPlaylists);
		videos.add(video);
		countVideos++;
		return video;
	}

	public static List<Usuario> getUsuarios() {
		return usuarios;
	}

	public static void setUsuarios(List<Usuario> usuarios) {
		Db.usuarios = usuarios;
	}

	public static List<Playlist> getPlaylists() {
		return playlists;
	}

	public static void setPlaylists(List<Playlist> playlists) {
		Db.playlists = playlists;
	}

	public static List<Video> getVideos() {
		return videos;
	}

	public static void setVideos(List<Video> videos) {
		Db.videos = videos;
	}
	
	
}
