package edu.wpi.breakeven;
import java.util.List;
import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.LambdaLogger;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import edu.wpi.breakeven.db.ThirdPartyDAO;
import edu.wpi.breakeven.http.ListRemoteSiteRequest;
import edu.wpi.breakeven.http.ListRemoteSiteResponse;
import edu.wpi.breakeven.model.ThirdPartySite;
public class ListRemoteSiteHandler implements RequestHandler<ListRemoteSiteRequest, ListRemoteSiteResponse> {
	public static LambdaLogger logger;
	public String table = "thirdpartysites";
	List<ThirdPartySite> getThirdParty() throws Exception {
		logger.log("In getThirdParty");
		ThirdPartyDAO dao = new ThirdPartyDAO();
		dao.setTable(table);
		return dao.getAllThirdParty();
	}
	@Override
	public ListRemoteSiteResponse handleRequest(ListRemoteSiteRequest input, Context context) {
		logger = context.getLogger();
		logger.log("Loading Java Lambda handler to list all remote sites");
		ListRemoteSiteResponse response;
		try {
			List<ThirdPartySite> list = getThirdParty();
			response = new ListRemoteSiteResponse(list, 200);
		} catch (Exception e) {
			response = new ListRemoteSiteResponse(403, e.getMessage());
		}
		String finalresponse = response.toString();
		logger.log(finalresponse);
		return response;
	}
}