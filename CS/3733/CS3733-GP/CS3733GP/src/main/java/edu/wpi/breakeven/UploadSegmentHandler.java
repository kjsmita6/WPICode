package edu.wpi.breakeven;
import java.io.ByteArrayInputStream;
import java.util.Base64;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.LambdaLogger;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.PutObjectResult;
import edu.wpi.breakeven.db.SegmentDAO;
import edu.wpi.breakeven.http.UploadSegmentRequest;
import edu.wpi.breakeven.http.UploadSegmentResponse;
import edu.wpi.breakeven.model.Segment;
public class UploadSegmentHandler implements RequestHandler<UploadSegmentRequest, UploadSegmentResponse> {
	public static LambdaLogger logger;
	private AmazonS3 s3 = null;
	String bucket = "bluh";
	String table = "segment";
	public UploadSegmentHandler(String bucket, String table){
		this.bucket = bucket;
		this.table = table;
	}
	boolean uploadSegmentDAO(Segment seg) throws Exception {
		if(logger != null) {
			logger.log("In uploadSegmentDAO");
		}
		SegmentDAO dao = new SegmentDAO();
		dao.setTable(table);
		dao.addSegment(seg);
		return true;
	}
	boolean uploadSegment(String character, String quote, byte[] file) throws Exception {
		if(logger != null) {
			logger.log("In uploadSegment");
		}
		if(s3 == null) {
			logger.log("Attach to s3 request"); 
			s3 = AmazonS3ClientBuilder.standard().withRegion(Regions.US_EAST_1).build();
			logger.log("Attach succeeded");
		}
		if(!character.equals("") || !quote.equals("")) {
		ByteArrayInputStream bais = new ByteArrayInputStream(file);
		ObjectMetadata omd = new ObjectMetadata();
		omd.setContentLength(file.length);
		Segment seg = new Segment(null, null, 0, character, quote, 0, null);
		System.out.println(this.bucket);
		PutObjectResult res = s3.putObject(new PutObjectRequest(this.bucket, "segments/real .ogg files/OGG/" + seg.name + ".ogg", bais, omd).withCannedAcl(CannedAccessControlList.PublicRead));
		uploadSegmentDAO(seg);
		return true;
		}
		else {
			return false;
		}
	}
	@Override
	public UploadSegmentResponse handleRequest(UploadSegmentRequest input, Context context) {
		logger = context.getLogger();
		logger.log(input.toString());
		UploadSegmentResponse response;
		try {
			byte[] encoded = Base64.getDecoder().decode(input.base64);
			if(uploadSegment(input.character, input.quote, encoded)) {
				response = new UploadSegmentResponse(200, null); 
			}
			else {
				response = new UploadSegmentResponse(422, "Unable to upload video segment: Unknown error");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			response = new UploadSegmentResponse(422, "Unable to uplaod video segment: " + e.getMessage());
		}
		return response;
	}
}