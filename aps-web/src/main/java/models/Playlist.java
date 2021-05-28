package models;

import java.util.LinkedList;
import java.util.List;

public class Playlist {
	private Integer id;
	private String titulo;
	private String descricao;
	private String enderecoImagem;
	private List<Video> videos = new LinkedList<>();
	private Usuario usuario;
	
	public Playlist() {}
	
	public Playlist(String titulo, String descricao, String enderecoImagem) {
		this.titulo = titulo;
		this.descricao = descricao;
		this.enderecoImagem = enderecoImagem;
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setVideos(List<Video> videos) {
		this.videos = videos;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
//		usuario.addPlaylist(this);
	}

	public void addVideo(Video video) {
		this.videos.add(video);
		video.setPlaylist(this);
	}
	
	public List<Video> getVideos() {
		return this.videos;
	}
	
	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getEnderecoImagem() {
		return enderecoImagem;
	}

	public void setEnderecoImagem(String enderecoImagem) {
		this.enderecoImagem = enderecoImagem;
	}
	
	@Override
	public String toString() {
		return "titulo: " + titulo;
	}
}
