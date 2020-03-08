package edu.wpi.breakeven;
import java.util.List;
import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.LambdaLogger;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import com.amazonaws.services.s3.AmazonS3;
import edu.wpi.breakeven.db.PlaylistDAO;
import edu.wpi.breakeven.http.ListPlaylistRequest;
import edu.wpi.breakeven.http.ListPlaylistResponse;
import edu.wpi.breakeven.model.Playlist;
public class ListPlaylistHandler implements RequestHandler<ListPlaylistRequest, ListPlaylistResponse> {
	public String table = "playlist";
	public LambdaLogger logger;
	List<Playlist> getPlaylist() throws Exception {
		logger.log("in getPlaylist");
		PlaylistDAO dao = new PlaylistDAO();
		dao.setTable(table);
		return dao.getAllPlaylist();
	}
private AmazonS3 s3 = null;
	/*
	List<Playlist> systemPlaylist() throws Exception {
		logger.log("In systemPlaylist");
		if (s3 == null) {
			logger.log("Attach to S3 request");
			s3 = AmazonS3ClientBuilder.standard().withRegion(Regions.US_EAST_1).build();
			logger.log("Attach to S3 succeed");
		}
		ArrayList<Playlist> sysPlaylist = new ArrayList<>();
	    
		ListObjectsV2Request listObjectsRequest = new ListObjectsV2Request().withBucketName("bluh").withPrefix("playlists/.ogg");
												  
		logger.log("Process request");
		ListObjectsV2Result result = s3.listObjectsV2(listObjectsRequest);
		logger.log("Process request succeeded");
		List<S3ObjectSummary> objects = result.getObjectSummaries();
		
		for (S3ObjectSummary os : objects) {
	      String name = os.getKey();
		  logger.log("S3 found:" + name);

	      if (name.endsWith("/")) { continue; }
			
	      S3Object obj = s3.getObject("bluh", name);
	    	
	    	try (S3ObjectInputStream constantStream = obj.getObjectContent()) {
				Scanner sc = new Scanner(constantStream);
				String val = sc.nextLine();
				sc.close();
				
				int postSlash = name.indexOf('/');
			} 
	    	catch (Exception e) {
				logger.log("Unable to parse contents of " + name);
			}
	    }
		
		return sysPlaylist;
	}
    */
    @Override
    public ListPlaylistResponse handleRequest(ListPlaylistRequest input, Context context) {
    	logger = context.getLogger();
		logger.log("Loading Java Lambda handler to list all playlists");

		ListPlaylistResponse response;
		try {
			List<Playlist> list = getPlaylist();
			//for (Playlist c : systemPlaylist()) {
			//	if (!list.contains(c)) {
			//		list.add(c);
			//	}
			//}
			response = new ListPlaylistResponse(list, 200);
		} catch (Exception e) {
			response = new ListPlaylistResponse(403, e.getMessage());
		}
		return response;
	}
}