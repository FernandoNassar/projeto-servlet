package models.dao;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

import models.Playlist;
import models.Video;

public class VideoDAO implements DAO<Video> {

	@Override
	public List<Video> findAll() {
		return Collections.unmodifiableList(Db.getVideos());
	}

	@Override
	public Optional<Video> findById(Integer id) {
		return Db.getVideos().stream().filter(v -> v.getId() == id).findAny();
	}

	@Override
	public Video save(Video obj) {
		return Db.save(obj);
	}

	@Override
	public void deleteById(Integer id) {
		Optional<Video> video = findById(id);
		if(video.isPresent()) {
			Playlist playlist = video.get().getPlaylist();
			int index = playlist.getVideos().indexOf(video.get());
			playlist.getVideos().remove(index);
			index = Db.getVideos().indexOf(video.get());
			Db.getVideos().remove(index);
		}
	}

}
