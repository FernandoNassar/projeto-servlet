package models.dao;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

import models.Usuario;

public class UsuarioDAO implements DAO<Usuario> {
	
	public UsuarioDAO() {
		
	}
	
	@Override
	public List<Usuario> findAll() {
		return Collections.unmodifiableList(Db.getUsuarios());
	}

	@Override
	public Optional<Usuario> findById(Integer id) {
		return Db.getUsuarios().stream().filter(u -> u.getId() == id).findFirst();
	}
	
	public Optional<Usuario> findByEmail(String email) {
 		return Db.getUsuarios().stream().filter(u -> u.getEmail().equals(email)).findFirst();
	}

	@Override
	public Usuario save(Usuario obj) {
		return Db.save(obj);
	}

	@Override
	public void deleteById(Integer id) {
		Optional<Usuario> u = findById(id);
		if(u.isPresent()) {
			int index = Db.getUsuarios().indexOf(u.get());
			Db.getUsuarios().remove(index);
		}
	}	
	
}
