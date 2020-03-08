package edu.wpi.breakeven;
import java.util.ArrayList;
import java.util.List;
import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.LambdaLogger;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import edu.wpi.breakeven.db.SegmentDAO;
import edu.wpi.breakeven.http.GetRemoteSitesRequest;
import edu.wpi.breakeven.http.GetRemoteSitesResponse;
import edu.wpi.breakeven.model.RemoteSegment;
import edu.wpi.breakeven.model.Segment;
public class GetRemoteSitesHandler implements RequestHandler<GetRemoteSitesRequest, GetRemoteSitesResponse> {
	LambdaLogger logger;
	public String table = "segment";
	List<RemoteSegment> getRemoteSites() throws Exception {
		SegmentDAO dao = new SegmentDAO();
		dao.setTable(table);
		List<Segment> segs = dao.getAllSegments();
		logger.log("Segments: " + segs.size());
		List<RemoteSegment> remoteSegs = new ArrayList<RemoteSegment>();
		for(Segment seg : segs) {
			if(seg.type != 1) {
				continue;
			}
			remoteSegs.add(new RemoteSegment(seg.url, seg.character, seg.quote));
		}
		return remoteSegs;
	}
    @Override
    public GetRemoteSitesResponse handleRequest(GetRemoteSitesRequest input, Context context) {
        logger = context.getLogger();
        logger.log("In lambda function to return remote sites");
        GetRemoteSitesResponse response;
        try {
        	List<RemoteSegment> remoteSegs = getRemoteSites();
        	response = new GetRemoteSitesResponse(remoteSegs);
        }
        catch(Exception e) {
        	response = new GetRemoteSitesResponse(new ArrayList<RemoteSegment>());
        }
        logger.log(response.toString());
        return response;
    }
}