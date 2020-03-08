package edu.wpi.breakeven;
import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.LambdaLogger;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import edu.wpi.breakeven.db.PlaylistDAO;
import edu.wpi.breakeven.http.DeleteFromPlaylistRequest;
import edu.wpi.breakeven.http.DeleteFromPlaylistResponse;
public class DeleteFromPlaylistHandler implements RequestHandler<DeleteFromPlaylistRequest, DeleteFromPlaylistResponse> {
	public static LambdaLogger logger;
	public String table = "playlist";
	boolean _deletePlaylist(String name) throws Exception {
		if(logger != null) {
			logger.log("In _deletePlaylist");
		}
		PlaylistDAO dao = new PlaylistDAO();
		dao.setTable(table);
		dao.deletePlaylist(name);
		return true;
	}
	boolean deletePlaylist(String name) throws Exception {
		if(logger != null) { 
			logger.log("In deletePlaylist");
		}
		_deletePlaylist(name);
		return true;
	}
	@Override
	public DeleteFromPlaylistResponse handleRequest(DeleteFromPlaylistRequest input, Context context) {
		logger = context.getLogger();
		logger.log(input.toString());	
		DeleteFromPlaylistResponse response;
		try {
			if(deletePlaylist(input.name)) {
				response = new DeleteFromPlaylistResponse("success", 200);
			}
			else {
				response = new DeleteFromPlaylistResponse("Unable to delete from playlist: Unknown error", 422);
			}
		}
		catch(Exception e) {
			response = new DeleteFromPlaylistResponse("Unable to delete video segment to playlist: " + e.getMessage(), 422);
		}
		return response;
	}
}