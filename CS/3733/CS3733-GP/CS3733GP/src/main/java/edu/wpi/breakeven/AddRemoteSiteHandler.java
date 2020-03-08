package edu.wpi.breakeven;
import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.LambdaLogger;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import com.amazonaws.services.s3.AmazonS3;
import edu.wpi.breakeven.db.ThirdPartyDAO;
import edu.wpi.breakeven.http.AddRemoteSiteRequest;
import edu.wpi.breakeven.http.AddRemoteSiteResponse;
import edu.wpi.breakeven.model.ThirdPartySite;
public class AddRemoteSiteHandler<RemoteSites> implements RequestHandler<AddRemoteSiteRequest, AddRemoteSiteResponse> {
	public static LambdaLogger Logger;
	private AmazonS3 s3 = null;
	public String table = "thirdpartysites";
	public boolean addRemoteSite(ThirdPartySite thirdpartysite) throws Exception {
		if(Logger != null) {
			Logger.log("In AddRemoteSite");
		}
		ThirdPartyDAO dao = new ThirdPartyDAO();
		dao.setTable(table);
		dao.addThirdPartySite(thirdpartysite);
		return true;
	}
	@Override
	public AddRemoteSiteResponse handleRequest(AddRemoteSiteRequest input, Context context) {
		Logger = context.getLogger();
		Logger.log(input.toString());
		
		AddRemoteSiteResponse response;
		try {
			ThirdPartySite tps = new ThirdPartySite(input.siteName, input.url, input.apikey);
			if(addRemoteSite(tps)) {
				response = new AddRemoteSiteResponse(200, "added tps");	
			}
			else {
				response = new AddRemoteSiteResponse(403, "error");
			}
		} catch (Exception e) {
			response = new AddRemoteSiteResponse(400, "Unable to add a remote site: " + input + "(" + e.getMessage() + ")");
		}
	return response;
	}
}
