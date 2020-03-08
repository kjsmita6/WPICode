package edu.wpi.breakeven;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.LambdaLogger;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.ListObjectsV2Request;
import com.amazonaws.services.s3.model.ListObjectsV2Result;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectInputStream;
import com.amazonaws.services.s3.model.S3ObjectSummary;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import edu.wpi.breakeven.db.SegmentDAO;
import edu.wpi.breakeven.db.ThirdPartyDAO;
import edu.wpi.breakeven.http.ListSegmentRequest;
import edu.wpi.breakeven.http.ListSegmentResponse;
import edu.wpi.breakeven.model.RemoteSegment;
import edu.wpi.breakeven.model.Segment;
import edu.wpi.breakeven.model.ThirdPartySite;
public class ListSegmentsHandler implements RequestHandler<ListSegmentRequest,ListSegmentResponse> {
	public String table = "segment";
	public String bucket = "bluh";
	public static LambdaLogger logger;

	public ListSegmentsHandler(String bucket, String table) {
		this.bucket = bucket;
		this.table = table;
	}


	List<Segment> getSegments() throws Exception {
		logger.log("In getSegments");
		SegmentDAO dao = new SegmentDAO();
		dao.setTable(this.table);
		return dao.getAllSegments();
	}
	private AmazonS3 s3 = null;
	List<Segment> systemSegments() throws Exception {
		logger.log("In systemSegments");
		if (s3 == null) {
			logger.log("Attach to S3 request");
			s3 = AmazonS3ClientBuilder.standard().withRegion(Regions.US_EAST_1).build();
			logger.log("Attach to S3 succeed");
		}
		ArrayList<Segment> sysSegments = new ArrayList<>();

		ListObjectsV2Request listObjectsRequest = new ListObjectsV2Request().withBucketName(this.bucket).withPrefix("segments/real .ogg files/OGG");
		logger.log("Process request");
		ListObjectsV2Result result = s3.listObjectsV2(listObjectsRequest);
		logger.log("Process request succeeded");
		List<S3ObjectSummary> objects = result.getObjectSummaries();
		for (S3ObjectSummary os : objects) {
			String name = os.getKey();
			logger.log("S3 found:" + name);
			if (name.endsWith("/")) { continue; }
			S3Object obj = s3.getObject(bucket, name);
			try (S3ObjectInputStream constantStream = obj.getObjectContent()) {
				Scanner sc = new Scanner(constantStream);
				String val = sc.nextLine();
				sc.close();
				int postSlash = name.indexOf('/');
				// TODO: What does postSlash and name look like? How to parse?
				// sysSegments.add(new Segment());
			} catch (Exception e) {
				logger.log("Unable to parse contents of " + name);
			}
		}
		return sysSegments;
	}
	public List<RemoteSegment> getRemoteSegs() throws Exception {
		ThirdPartyDAO dao = new ThirdPartyDAO();
		List<RemoteSegment> remoteSegs = new ArrayList<RemoteSegment>();
		List<ThirdPartySite> sites = dao.getAllThirdParty();
		for(ThirdPartySite site : sites) {
			logger.log("============= Getting segments from tps: " + site.name);
			URL url = new URL(site.url);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("X-Api-Key", site.apikey);
			int code = conn.getResponseCode();
			if(code == 200) {
				String json = "";
				BufferedReader in = new BufferedReader(
						new InputStreamReader(conn.getInputStream()));
				String inputLine;
				StringBuffer content = new StringBuffer();
				while ((inputLine = in.readLine()) != null) {
					json += inputLine;
				}
				in.close();
				logger.log(json);
				GsonBuilder builder = new GsonBuilder();
				Gson gson = builder.create();
				RemoteSegmentResponse oneRemoteSegs = gson.fromJson(json, new TypeToken<RemoteSegmentResponse>(){}.getType());
				for(RemoteSegment rs : oneRemoteSegs.segments) {
					remoteSegs.add(rs);
				}
			}
			else {
				logger.log("!!!!!!!!!!!!! Response code: " + code);
			}
		}
		return remoteSegs;
	}
	class RemoteSegmentResponse {
		public List<RemoteSegment> segments;
	}
	@Override
	public ListSegmentResponse handleRequest(ListSegmentRequest input, Context context) {
		logger = context.getLogger();
		logger.log("Loading Java Lambda handler to list all segments");
		ListSegmentResponse response;
		try {
			List<Segment> list = getSegments();
			for (Segment c : systemSegments()) {
				if (!list.contains(c)) {
					list.add(c);
				}
			}
			for(RemoteSegment seg : getRemoteSegs()) {
				list.add(new Segment(null, seg.url, 0, seg.character, seg.text, 1, null));
				logger.log("Adding remote segment: " + seg.url);
			}

			response = new ListSegmentResponse(list, 200);
		} catch (Exception e) {
			response = new ListSegmentResponse(403, e.getMessage());
		}
		String finalresponse = response.toString();
		logger.log(finalresponse);
		return response;
	}
}