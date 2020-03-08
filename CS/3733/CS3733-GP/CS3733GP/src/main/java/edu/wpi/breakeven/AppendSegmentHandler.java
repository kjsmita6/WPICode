package edu.wpi.breakeven;
import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.LambdaLogger;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import edu.wpi.breakeven.db.SegmentDAO;
import edu.wpi.breakeven.http.AppendSegmentRequest;
import edu.wpi.breakeven.http.AppendSegmentResponse;
public class AppendSegmentHandler implements RequestHandler<AppendSegmentRequest, AppendSegmentResponse> {
    public AppendSegmentHandler() {
    }
    public static LambdaLogger logger;
    public String table = "segment";
	boolean AppendSegment(String playlist, String seg) throws Exception {

		if(logger != null) {
			logger.log("In AppendSegment");
		}
		SegmentDAO dao = new SegmentDAO();
		dao.setTable(table);
		System.out.println("=========== TABLE: " + table);
		System.out.println("=========== SEGM: " + seg);
		System.out.println("=========== PLA: " + playlist);
		dao.addToPlaylist(seg, playlist);
		return true;
	}
	@Override
	public AppendSegmentResponse handleRequest(AppendSegmentRequest input, Context context) {
		logger = context.getLogger();
		logger.log(input.toString());
		AppendSegmentResponse response;
		try {
			if(AppendSegment(input.playlistName, input.segmentName)) {
				response = new AppendSegmentResponse("success", 200);
			}
			else {
				response = new AppendSegmentResponse("Unable to add to playlist: Unknown error", 422);
			}
		}
		catch(Exception e) {
			response = new AppendSegmentResponse("Unable to add video segment to playlist: " + e.getMessage(), 422);
		}
		return response;
	}
}