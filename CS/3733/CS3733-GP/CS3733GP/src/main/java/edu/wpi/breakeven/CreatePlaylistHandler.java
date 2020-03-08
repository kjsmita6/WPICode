package edu.wpi.breakeven;
import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.LambdaLogger;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import edu.wpi.breakeven.db.PlaylistDAO;
import edu.wpi.breakeven.http.CreatePlaylistRequest;
import edu.wpi.breakeven.http.CreatePlaylistResponse;
import edu.wpi.breakeven.model.Playlist;
public class CreatePlaylistHandler implements RequestHandler<CreatePlaylistRequest, CreatePlaylistResponse> {
	public static LambdaLogger logger;
	public String table = "playlist";
	boolean PlaylistDAO(Playlist playlist) throws Exception {
		if(logger != null) {
			logger.log("In PlaylistDAO");
		}
		PlaylistDAO dao = new PlaylistDAO();
		dao.setTable(table);
		dao.addPlaylist(playlist);
		return true;
	}
	@Override
	public CreatePlaylistResponse handleRequest(CreatePlaylistRequest input, Context context) {
		logger = context.getLogger();
		logger.log(input.toString());
		CreatePlaylistResponse response;
		Playlist playlist = new Playlist(input.name, input.segments);
		try {
			if(PlaylistDAO(playlist)) {
				response = new CreatePlaylistResponse(null, 200);
			}
			else {
				response = new CreatePlaylistResponse("Unable to create playlist: Unknown error", 422);
			}
		}
		catch(Exception e) {
			response = new CreatePlaylistResponse("Unable to create playlist: " + e.getMessage(), 422);
		}
		return response;
	}
}