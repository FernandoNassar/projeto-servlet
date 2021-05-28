package util;

import jakarta.servlet.http.HttpServletRequest;
import models.Video;
import models.dao.VideoDAO;

public class VideoUtil {
	
	public static Video getParameters(HttpServletRequest request, Video video) {
		
		video.setTitulo(request.getParameter("video_titulo"));
		
		String videoUrl = Util.urlFormatter(request.getParameter("video_url"));
		video.setUrl(videoUrl);
		
		video.setDescricao(request.getParameter("video_descricao"));
		
		return video;
	}
	
	public static Integer excluirVideo(HttpServletRequest request, VideoDAO videoDAO) {
		
		Integer videoId = Integer.valueOf(request.getParameter("id").trim());
		
		Integer playlistID = videoDAO.findById(videoId).get().getPlaylist().getId();
		
		videoDAO.deleteById(videoId);
		
		return playlistID;
	}
	
}
