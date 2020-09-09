package edu.wpi.breakeven;
import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.LambdaLogger;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import edu.wpi.breakeven.db.ThirdPartyDAO;
import edu.wpi.breakeven.http.DeleteRemoteSiteRequest;
import edu.wpi.breakeven.http.DeleteRemoteSiteResponse;
public class DeleteRemoteSiteHandler implements RequestHandler<DeleteRemoteSiteRequest, DeleteRemoteSiteResponse> {
	public String table = "thirdpartysites";
	public LambdaLogger logger = null;
	@Override
	public DeleteRemoteSiteResponse handleRequest(DeleteRemoteSiteRequest input, Context context) {
		logger = context.getLogger();
		logger.log("Loading Java Lambda DeleteRemoteSite handler to delete");
		DeleteRemoteSiteResponse response = null;
		logger.log(input.toString());
		ThirdPartyDAO dao = new ThirdPartyDAO();
		dao.setTable(table);
		try {
			if (dao.deleteThirdParty(input.siteName)) {
				response = new DeleteRemoteSiteResponse(200, input.siteName);
			} else {
				response = new DeleteRemoteSiteResponse(422, "Unable to delete the remote site");
			}
		} catch (Exception e) {
			response = new DeleteRemoteSiteResponse(422, "Unable to delete the remote site" + "(" + e.getMessage() + ")");
		}
		return response;
	}
}