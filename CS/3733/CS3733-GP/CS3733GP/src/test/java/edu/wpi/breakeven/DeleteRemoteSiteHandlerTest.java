package edu.wpi.breakeven;

import static org.junit.jupiter.api.Assertions.*;

import java.io.IOException;

import org.junit.Assert;
import org.junit.Before;
import org.junit.jupiter.api.Test;

import com.google.gson.Gson;

import edu.wpi.breakeven.db.ThirdPartyDAO;
import edu.wpi.breakeven.http.*;
import edu.wpi.breakeven.model.ThirdPartySite;

class DeleteRemoteSiteHandlerTest extends LambdaTest{
	String JSONtps;
	ThirdPartyDAO tpdao;
	ThirdPartySite tps;
	
	void testInput(String incoming, String outgoing) throws IOException {
    	DeleteRemoteSiteHandler handler = new DeleteRemoteSiteHandler();
    	handler.table = "testthirdpartysites";
    	DeleteRemoteSiteRequest req = new Gson().fromJson(incoming, DeleteRemoteSiteRequest.class);
        DeleteRemoteSiteResponse response = handler.handleRequest(req, createContext("deleting remote site"));
        String JSONreturned = new Gson().toJson(response);
       
        Assert.assertEquals(200, response.statusCode);
        //Assert.assertEquals("added tps", response.error);
        System.out.println("Segment deleted:" + response.error);
        //Assert.assertEquals(outgoing, JSONreturned);
    }
	
    void testFailInput(String incoming, String outgoing) throws IOException {
    	DeleteRemoteSiteHandler handler = new DeleteRemoteSiteHandler();
    	handler.table = "testthirdpartysites";
    	DeleteRemoteSiteRequest req = new Gson().fromJson(incoming, DeleteRemoteSiteRequest.class);

    	DeleteRemoteSiteResponse response = handler.handleRequest(req, createContext("failing to delete remote site"));

        Assert.assertEquals(422, response.statusCode);
    }
    
//    @Before
//    void setUp() throws Exception {  
//    	tpdao= new ThirdPartyDAO();
//    	tps = new ThirdPartySite("test", "www.test.com","api");
//    	tpdao.addThirdPartySite(tps);
//    }
    
	@SuppressWarnings("rawtypes")
	@Test
	void testDeleteTPSWorks() {
		AddRemoteSiteRequest arsr = new AddRemoteSiteRequest("test", "https://www.test.com/", "api");
		AddRemoteSiteHandler ash = new AddRemoteSiteHandler();
		ash.table = "testthirdpartysites";
		AddRemoteSiteResponse asr = ash.handleRequest(arsr, createContext("adding a test site to delete"));
		DeleteRemoteSiteRequest drsr = new DeleteRemoteSiteRequest("test");
		String input = new Gson().toJson(drsr);
    	String output = "{\"[result\":\"\",\"statusCode\":\"200\",\"error\":\"test]\"}";
		
		try {
			testInput(input, output);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@Test
	void testDeleteTPSDoesNotWork() {
		//no testtest in database
    	String input = "{\"siteName\":\"testtest\"}";
    	String output = "{\"[result\":\"\",\"statusCode\":\"422\",\"error\":\"Unable to delete the remote site]\"}";
		
		try {
			testFailInput(input, output);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
