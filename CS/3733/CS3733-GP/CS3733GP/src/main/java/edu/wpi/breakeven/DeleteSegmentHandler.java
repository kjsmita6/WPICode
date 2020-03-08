package edu.wpi.breakeven;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.LambdaLogger;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import edu.wpi.breakeven.db.SegmentDAO;
import edu.wpi.breakeven.http.DeleteSegmentRequest;
import edu.wpi.breakeven.http.DeleteSegmentResponse;
public class DeleteSegmentHandler implements RequestHandler<DeleteSegmentRequest, DeleteSegmentResponse> {
	public static LambdaLogger logger;
	private AmazonS3 s3 = null;
	public String bucket = "bluh";
	public String table = "segment";
	public DeleteSegmentHandler(String bucket, String table) {
		this.bucket = bucket;
		this.table = table;
	}
	boolean _deleteSegment(String name) throws Exception {
		if(logger != null) {
			logger.log("In _deleteSegment");
		}
		SegmentDAO dao = new SegmentDAO();
		dao.deleteSegment(name);
		return true;
	}
	boolean deleteSegment(String name) throws Exception {
		if(logger != null) {
			logger.log("In deleteSegment");
		}
		if(s3 == null) {
			logger.log("Attach to s3 request");
			s3 = AmazonS3ClientBuilder.standard().withRegion(Regions.US_EAST_1).build();
			logger.log("Attach succeeded");
		}
		s3.deleteObject(bucket, "segments/real .ogg files/OGG/" + name + ".ogg");
		_deleteSegment(name);
		return true;
	}
	@Override
	public DeleteSegmentResponse handleRequest(DeleteSegmentRequest input, Context context) {
		logger = context.getLogger();
		logger.log(input.toString());	
		DeleteSegmentResponse response;
		try {
			if(deleteSegment(input.name)) {
				response = new DeleteSegmentResponse(200, "success");
			}
			else {
				response = new DeleteSegmentResponse(422, "Unable to upload video segment: Unknown error");
			}
		}
		catch(Exception e) {
			response = new DeleteSegmentResponse(422, "Unable to uplaod video segment: " + e.getMessage());
		}
		return response;
	}
}