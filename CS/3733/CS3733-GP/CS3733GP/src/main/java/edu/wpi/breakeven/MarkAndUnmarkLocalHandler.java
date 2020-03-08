package edu.wpi.breakeven;
import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.LambdaLogger;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import edu.wpi.breakeven.db.SegmentDAO;
import edu.wpi.breakeven.http.MarkLocalRequest;
import edu.wpi.breakeven.http.MarkLocalResponse;
public class MarkAndUnmarkLocalHandler implements RequestHandler<MarkLocalRequest, MarkLocalResponse> {
	public static LambdaLogger logger;
	String bucket = "bluh";
	String table = "segment";
	
	public MarkAndUnmarkLocalHandler(String bucket, String table) {
		this.bucket = bucket;
		this.table = table;
	}
	boolean MarkSegmentDAO(String seg) throws Exception {
		if (logger != null) {
			logger.log("In MarkSegmentDAO");
		}
		SegmentDAO dao = new SegmentDAO();
		dao.setTable(table);
		dao.markSegmentRemote(seg);
		return true;
	}
	@Override
	public MarkLocalResponse handleRequest(MarkLocalRequest input, Context context) {
		MarkLocalResponse resp;
		try {
			if (MarkSegmentDAO(input.segmentId)) {
				resp = new MarkLocalResponse(200, "success");
			} else {
				resp = new MarkLocalResponse(422, "Unable to change segment accessibility.");
			}
		} catch (Exception e) {
			resp = new MarkLocalResponse(403, "Unable to change segment accessibility: " + e.getMessage());
		}
		return resp;
	}
}