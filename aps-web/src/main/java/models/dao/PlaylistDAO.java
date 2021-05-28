package models.dao;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

import models.Playlist;

public class PlaylistDAO implements DAO<Playlist> {

	@Override
	public List<Playlist> findAll() {
		return Collections.unmodifiableList(Db.getPlaylists());
	}

	@Override
	public Optional<Playlist> findById(Integer id) {
		return Db.getPlaylists().stream().filter(p -> p.getId() == id).findFirst();
	}

	@Override
	public Playlist save(Playlist obj) {
		return Db.save(obj);
	}

	@Override
	public void deleteById(Integer id) {
		Optional<Playlist> playlist = findById(id);
		if(playlist.isPresent()) {
			int index = Db.getPlaylists().indexOf(playlist.get());
			Db.getPlaylists().remove(index);
			
		}
		
		
	}

}
