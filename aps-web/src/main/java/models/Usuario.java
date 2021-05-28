package models;

import java.util.LinkedList;
import java.util.List;

public class Usuario {
	private Integer id;
	private String nome;
	private String email;
	private String senha;
	private List<Playlist> playlists = new LinkedList<>();
	
	public Usuario() {}
	
	public Usuario(String email, String senha) {
		this.email = email;
		this.senha = senha;
	}
	
	public Usuario(String nome, String email, String senha) {
		this.nome = nome;
		this.email = email;
		this.senha = senha;
		
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void addPlaylist(Playlist playlist) {
		this.playlists.add(playlist);
		playlist.setUsuario(this);
	}
	
	public List<Playlist> getPlaylists() {
		return this.playlists;
	}
	
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	@Override
	public String toString() {
		return email;
	}
}
