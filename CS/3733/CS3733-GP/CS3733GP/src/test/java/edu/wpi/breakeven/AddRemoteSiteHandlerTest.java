package edu.wpi.breakeven;

import static org.junit.jupiter.api.Assertions.*;

import java.io.IOException;

import org.junit.After;
import org.junit.Assert;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Test;

import com.google.gson.Gson;

import edu.wpi.breakeven.db.ThirdPartyDAO;
import edu.wpi.breakeven.http.AddRemoteSiteRequest;
import edu.wpi.breakeven.http.AddRemoteSiteResponse;
import edu.wpi.breakeven.http.DeleteRemoteSiteRequest;
import edu.wpi.breakeven.http.DeleteRemoteSiteResponse;


public class AddRemoteSiteHandlerTest extends LambdaTest {
	@Test
	void testLambdaWorks() throws Exception {
		AddRemoteSiteRequest arsr =  new AddRemoteSiteRequest("test", "https://www.test.com/", "api");
		AddRemoteSiteHandler arsh = new AddRemoteSiteHandler();
		arsh.table = "testthirdpartysites";
		AddRemoteSiteResponse arsresp = arsh.handleRequest(arsr, createContext("add remote site"));
		assertEquals(200, arsresp.statusCode);
		assertTrue(arsresp.error.equals("added tps"));
		
		ThirdPartyDAO dao = new ThirdPartyDAO();
		dao.setTable("testthirdpartysites");
		dao.deleteThirdParty("test");
	}

	//this lambda cannot fail
//	@Test
//	void testLambdaFails() {
//		AddRemoteSiteRequest arsr = new AddRemoteSiteRequest(null, null, null);
//		String input = new Gson().toJson(arsr);
//		String output = "{\"list\": [], \"statusCode\": \"400\", \"error\": \"error\" }";
//		
//        try {
//        	testFailInput(input, output);
//        } catch (IOException ioe) {
//        	Assert.fail("Invalid:" + ioe.getMessage());
//        }
//	}
}
